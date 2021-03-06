class BusinessTripForm < ActiveRecord::Base
  belongs_to :employee

  enum status: [:waiting, :rejected, :accepted]
end
