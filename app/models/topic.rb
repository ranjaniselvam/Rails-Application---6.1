class Topic < ApplicationRecord
  #=====Pagination====
  self.per_page = 10

  #=====Associations======
  has_many :posts,dependent: :destroy

end
