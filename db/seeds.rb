10.times do
    Member.create({
        name:Faker::Name.name,
        phone:Faker::Number.number,
        address:Faker::Address.street_name
    })
end