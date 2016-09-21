require 'rails_helper'

feature 'Creating Musician' do
  background do
    user = create :user
    genre = create :genre
    sign_in_with user
  end

  scenario 'with valid data' do
    visit '/'
    click_link 'Add Musician'
    select 'Rock-n-Roll', from: 'musician_genre_id'
    fill_in 'Name of Musician', with: 'Eric'
    fill_in 'Surname', with: 'Clapton'
    select 'September', from: 'musician_date_of_birth_2i'
    select '1965', from: 'musician_date_of_birth_1i'
    select '18', from: 'musician_date_of_birth_3i'
    fill_in 'musician[description]', with: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus asperiores voluptatem nihil perspiciatis, quod. Veritatis natus consequatur in nisi magni esse! Laborum vero dolorem tempore recusandae corporis, ducimus dolore natus.'
    attach_file('musician[avatar]', 'spec/files/images/musician.jpg')
    click_button 'Save Musician'
    expect(page).to have_content('Eric, Clapton')
    expect(page).to have_css("img[src*='musician.jpg']")
  end

  scenario 'needs an name on create musician' do
    visit '/'
    click_link 'Add Musician'
    click_button 'Save Musician'
    expect(page).to have_content("Name can't be blank")
  end
end
