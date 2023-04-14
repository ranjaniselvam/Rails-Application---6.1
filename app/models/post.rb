class Post < ApplicationRecord
  #=====Pagination====
  self.per_page = 10

  #========Associations======
  belongs_to :topic

  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags

  has_many :ratings, dependent: :destroy

  has_many_attached :images


end
