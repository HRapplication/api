class Address < ActiveRecord::Base
  belongs_to :employee

  validates_presence_of :country, :city, :address, :postcode, :employee_id
end
