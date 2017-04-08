class JobOffer < ActiveRecord::Base
  belongs_to :user
  has_one :offers_content, dependent: :destroy
end
