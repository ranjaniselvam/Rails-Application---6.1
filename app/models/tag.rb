class Tag < ApplicationRecord
  #=====Pagination====
  self.per_page = 10

  #=====Association=====
  has_and_belongs_to_many :posts

end
