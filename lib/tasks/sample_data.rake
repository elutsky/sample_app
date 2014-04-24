namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create(name: "Evgeny The Best",
                         email: "elutsky@gmail.com",
                         password: "123456",
                         password_confirmation: "123456",
                         admin: true)
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end

    # users = User.where.not(id: 1).(limit: 6)
    # 50.times do
    #   content = Faker::Lorem.sentence(5)
    #   users.each { |user| user.microposts.create!(content: content) }
    # end
    #
    # evgeny = User.where(id: 1)
    # 50.times do
    #   content = Faker::Lorem.sentence(5)
    #   evgeny.microposts.create!(content: content)
    # end

  end
end