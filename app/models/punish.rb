class Punish < ApplicationRecord
  self.table_name = 'punish'
  # to prevent conflict between our column's name and rails' reserved words
  self.inheritance_column = nil
end
