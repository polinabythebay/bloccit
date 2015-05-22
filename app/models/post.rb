class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  scope :ordered_by_title, -> { order(:title)  }
  scope :ordered_by_reverse_created_at, -> { order('created_at').reverse }

end
