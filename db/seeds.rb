if Rails.env.development?
  Genre.destroy_all

  genres = %W[Disco Trance Folk Rock Pop Acid]

  genres.each do |genre|
    genre_name = Genre.create!(
      name: genre
    )
  end
end
