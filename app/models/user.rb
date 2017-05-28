class User < ActiveRecord::Base
  has_many :job_offers, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :schedules, dependent: :destroy
  # has_many :addresses, dependent: :destroy
  belongs_to :details, class_name: "Employee", foreign_key: 'employee_id', dependent: :destroy
  has_many :employees, foreign_key: 'supervisor_id', dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  accepts_nested_attributes_for :details
  accepts_nested_attributes_for :employees

  after_create do
    e = Employee.create(name: nil)
    self.details = e
    self.save
  end
end
