100.times do
    Pokemon.create({
        name: Faker::Lorem.word,
        number: Faker::Number.number(digits: 3),
        type1: Faker::Number.number(digits: 2),
        type2: Faker::Number.number(digits: 2)
    })
end