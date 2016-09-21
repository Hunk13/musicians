require 'rails_helper'

feature 'Deleting Musician' do
  background do
    musician = create :musician
    user = create :user
    genre = create :genre
    sign_in_with user
  end

  scenario 'Can delete a single musician' do
    visit '/'
    click_link 'Vasya, Pupkin'
    click_link 'Delete'
    expect(page).to_not have_content('Vasya')
  end
end
