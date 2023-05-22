class Product < ApplicationRecord
    validates_presence_of :name , :quantity , :price  
    validates_uniqueness_of :name
end
