require 'rails_helper'

feature 'Can view individual musicians' do
  scenario 'Can click and view a single musician' do
    musician = create :musician
    user = create :user
    genre = create :genre
    sign_in_with user

    visit '/'
    click_link 'Vasya, Pupkin'
    expect(page.current_path).to eq(musician_path(musician))
  end
end
