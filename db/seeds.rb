require 'faker'

ActiveRecord::Base.transaction do
  900.times do |i|
    user = User.create(
      first_name: Faker::Name.unique.first_name,
      last_name: Faker::Name.last_name,
      user_name: "#{Faker::Name.first_name.downcase}_#{i+10}",
      email: Faker::Internet.email,
      contact_number: Faker::PhoneNumber.phone_number_with_country_code,
      street_address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state,
      country: Faker::Address.country,
      pincode: Faker::Address.postcode,
      date_of_birth: (Date.today + rand(1..30).days) - rand(24..36).years,
      profile_title: User::PROFILE_TITLE.sample,
      password: "password",
      about: Faker::Lorem.paragraph(sentence_count: 5)
    )
    
    if user.persisted?
      puts "User #{user.id} created successfully"
    else
      puts "Failed to create user #{i+1}: #{user.errors.full_messages.join(', ')}"
    end
  end
end

