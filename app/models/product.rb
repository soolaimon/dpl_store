class Product < ActiveRecord::Base

  validates :name, presence: true # extra layer of validation. null: false doesn't accoun for empty strings.

end
