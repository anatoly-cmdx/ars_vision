if Company.count == 0
  50.times do
    people_count = Random.new.rand(2..10)
    FactoryGirl.create(:company, :with_people, people_count: people_count)
  end
end
