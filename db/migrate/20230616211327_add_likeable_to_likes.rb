class AddLikeableToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :likeable, polymorphic: true, null: false
  end
end
