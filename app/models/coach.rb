class Coach < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :rank
  belongs_to :rank_limit

  validates :rank_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :rank_limit_id, numericality: { other_than: 1, message: "can't be blank" }
end
