FactoryGirl.define do
  factory :reservation do
    start_time Time.now + (60 * 60 * 2)
    end_time Time.now + (60 * 60 * 4)
    table_number 1
  end
end
