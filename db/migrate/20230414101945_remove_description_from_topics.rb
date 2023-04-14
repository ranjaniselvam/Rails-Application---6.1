class RemoveDescriptionFromTopics < ActiveRecord::Migration[6.1]
  def change
    remove_column :topics, :description, :string
  end
end
