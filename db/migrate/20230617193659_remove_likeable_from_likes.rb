class RemoveLikeableFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :likeable_type, :string
    remove_column :likes, :likeable_id, :bigint
  end
end
