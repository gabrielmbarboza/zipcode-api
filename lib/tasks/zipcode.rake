namespace :zipcode do
  desc "Setup for development environment"
  task dev: :environment do
    User.insert_all([
      { email: 'user1@example.com', password: '123'},
      { email: 'user2@example.com', password: '456'},
      { email: 'user3@example.com', password: '789'}],
      unique_by: %i[ email ]
      )
  end
end
