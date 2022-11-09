class Api::Store::ShoplistsController < ApplicationController
  def show
    shoplist = Shoplist.find_by(user_id: shoplist_params[:user_id])
    if shoplist
      render json: { "#{User.find(shoplist_params[:user_id]).name} glasses" => shoplist.glasses }
    else
      render json: Shoplist.create(shoplist_params).glasses
    end
  end

  def create_glasse
    frame = Frame.find_by_id(params[:frame_id])
    user = User.find(params[:user_id])
    frame_with_user_currency = get_item_with_user_currency(Frame, frame, user)
    lense = Lense.find_by_id(params[:lense_id])
    lense_with_user_currency = get_item_with_user_currency(Lense, lense, user)
    shoplist = Shoplist.find_by(user_id: user.id)

    if (frame_with_user_currency && lense_with_user_currency) &&
       (frame_with_user_currency.stock.positive? &&
         lense_with_user_currency.stock.positive?)
      glass_price =
        frame_with_user_currency.price +
        lense_with_user_currency.price
      shoplist ||= Shoplist.create(user_id: params[:user_id])
      glass = Glass.new(shoplist_id: shoplist.id, frame_id: frame_with_user_currency.id,
                        lense_id: lense_with_user_currency.id, price: glass_price,
                        price_currency: user.user_currency, user_id: shoplist.user_id)
      glass_saved?(glass, frame_with_user_currency, lense_with_user_currency)
    else
      render json: "You are run out or don't have enough frames or lenses make sure you submited the
       ( frame_id: integer, lense_id: integer, user_id: integer, price: float, price_currency)"
    end
  end

  private

  def glass_saved?(glass, frame, lense)
    if glass.save
      frame.update(stock: frame.stock - 1)
      lense.update(stock: lense.stock - 1)
      render json: { 'glass_info' => glass, 'lense' => glass.lense, 'frame' => glass.frame }
    else
      render json: glass.errors.full_messages
    end
  end

  def shoplist_params
    params.permit(:user_id)
  end

  def get_object_of_item(item)
    item.attributes.filter do |n|
      n != 'id' && n != 'created_at' && n != 'updated_at' && n != 'price_currency' && n != 'price'
    end
  end

  def get_item_with_user_currency(itemclass, item, user)
    itemclass.where(get_object_of_item(item)).filter do |n|
      n.price_currency == user.user_currency
    end[0]
  end
end
