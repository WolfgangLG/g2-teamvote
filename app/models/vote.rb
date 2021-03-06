class Vote < ActiveRecord::Base
  belongs_to :employee

  validates :value, inclusion: { in: [-1,1], message: "%{value} is not a valid vote." }, presence: true
end
