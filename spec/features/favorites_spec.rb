require 'features/helper'

feature 'User can add companies and people to favorites', js: true do
  given(:user) { create :user }
  given!(:companies) { create_list :company, 2, :with_people, people_count: 3 }
  given!(:other_companies) { create_list :company, 3, :with_people, people_count: 2 }

  scenario 'User adds companies and people to favorites' do
    log_in user

    visit companies_path
    companies.each do |company|
      click_on "favorites_company_#{company.id}"
    end

    visit company_path companies[1]
    companies[1].people.each do |person|
      click_on "favorites_person_#{person.id}"
    end

    visit favorites_path
    companies.each do |company|
      expect(page).to have_content company.name
    end

    companies[1].people.each.each do |person|
      expect(page).to have_content person.first_name
    end
  end

  scenario 'Guest can not add something to favorites' do
    visit companies_path
    expect(page).to have_content t('devise.failure.unauthenticated')
  end
end
