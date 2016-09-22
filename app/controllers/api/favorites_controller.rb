class Api::FavoritesController < ActionController
  def destroy
    render json: { "message": "Unauthorized" } and return unless user_signed_in?

    event_item = Event::Item.get_valid_item(params[:id])
    render json: { "message": "Not Found" }, status: 404 and return if event_item.blank?

    favorite = event_item.favorites.where("event_user_id = ?", current_user.id)
    render json: { "message": "Not Found" }, status: 404 and return if favorites.blank?

    favorite.destroy
    render json: { event_item_id: params[:id], count: event_item.favorites.count() }, status: 200
  end
end
