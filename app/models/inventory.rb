class Inventory < ApplicationRecord
      validates_presence_of :name , :quantity , :import_day , :exp_day , :provider 
      validates_uniqueness_of :name
end
