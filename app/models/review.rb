class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :board

  enum state: [:not_reviewed, :published, :hidden]
end
