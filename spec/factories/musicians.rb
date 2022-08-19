FactoryBot.define do
  factory :musician do
    name { 'Vasya' }
    surname { 'Pupkin' }
    date_of_birth { '1926-09-20' }
    description { 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci dolorem, placeat ratione recusandae quaerat ipsum cum, et minima. Itaque tempore et nesciunt sunt veritatis quas unde magni, at officiis iusto!' }
    avatar { Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/musician.jpg', 'image/jpg') }
    user_id { 1 }
    genre_id { 1 }
  end
end
