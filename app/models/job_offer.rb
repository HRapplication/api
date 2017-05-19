class JobOffer < ActiveRecord::Base
  belongs_to :user
  has_one :offers_content, dependent: :destroy
  accepts_nested_attributes_for :offers_content

  validates_presence_of :title, :user_id
  validates_inclusion_of :is_available, :in => [true, false]
end
