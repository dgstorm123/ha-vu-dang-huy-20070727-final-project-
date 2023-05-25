class Order < ApplicationRecord
    belongs_to :product
    validates_presence_of :name , :quantity 
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }
    has_one :membership, primary_key: :phone, foreign_key: :phone
    belongs_to :membership, optional: true
    belongs_to :membership, foreign_key: :phone, primary_key: :phone, optional: true
end
