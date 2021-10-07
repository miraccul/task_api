class Task < ApplicationRecord
    belongs_to :category

    validates :category_id, numericality: {grater_than: 0}
    validates :text, :category_id, presence: true
end
