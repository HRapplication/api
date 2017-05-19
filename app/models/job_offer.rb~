class JobOffer < ActiveRecord::Base
  belongs_to :user
  has_one :offers_content, dependent: :destroy
  accepts_nested_attributes_for :offers_content
end
