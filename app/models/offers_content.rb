class OffersContent < ActiveRecord::Base
  belongs_to :job_offer

  validates_presence_of :content, :job_offer_id
end
