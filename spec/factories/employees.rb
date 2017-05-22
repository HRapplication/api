FactoryGirl.define do
  factory :employee do
    name "imie"
    surname "nazwisko"
    phone_number "123123123"
    position 1
    weekly_working_hours 1
    supervisor_id nil
    user nil
  end

end
