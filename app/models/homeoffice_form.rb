class HomeofficeForm < ActiveRecord::Base
  belongs_to :employee

  enum status: [:waiting, :rejected, :accepted]
end
