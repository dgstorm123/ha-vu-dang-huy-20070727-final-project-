class Order < ApplicationRecord
    belongs_to :product
    validates_presence_of :name , :quantity 
    validates_uniqueness_of :phone
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }
    has_one :membership, primary_key: :phone, foreign_key: :phone

end
