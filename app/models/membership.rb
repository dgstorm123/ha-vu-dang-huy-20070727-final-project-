class Membership < ApplicationRecord
    belongs_to :order, primary_key: :phone, foreign_key: :phone, optional: true
    validates_presence_of :name , :phone , :voucher , :email 
    validates_uniqueness_of :email , :phone
    validates :phone, presence: true, uniqueness: true, length: { is: 10 }
end
