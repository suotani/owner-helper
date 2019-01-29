# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
####owner
owner1 = Owner.new(id: 1,name: "魚谷　知司", email: "owner_u@example.com",password: "111111", phone_number: "00011112222")
owner2 = Owner.new(id: 2,name: "カナエ", email: "owner_k@example.com",password: "111111", phone_number: "1248-12-8649")
owner3 = Owner.new(id: 3,name: "田中　美穂", email: "owner_m@example.com",password: "111111", phone_number: "00011112222")
owner4 = Owner.new(id: 4,name: "株式会社　山田建設", email: "owner_y@example.com",password: "111111", phone_number: "00011112222")
owner1.skip_confirmation!
owner2.skip_confirmation!
owner3.skip_confirmation!
owner4.skip_confirmation!
owner1.save
owner2.save
owner3.save
owner4.save

####house
houses1 = []
houses1 += [House.create({id: 1,name: "アクシスカナエ", owner_id: 1, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]
houses1 += [House.create({id: 2,name: "シャルム西台", owner_id: 1, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]
houses1 += [House.create({id: 3,name: "ドム国玉", owner_id: 1, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]

houses2 = []
houses2 += [House.create({id: 4,name: "アクシスカナエ２", owner_id: 2, address: "東京都板橋区高島平1-82-5", postal_code: "175-00820"})]
houses2 += [House.create({id: 5,name: "シャルム西台２", owner_id: 2, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]
houses2 += [House.create({id: 6,name: "ドム国玉２", owner_id: 2, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]

houses3 = []
houses3 += [House.create({id: 7,name: "アクシスカナエ３", owner_id: 3, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]
houses3 += [House.create({id: 8,name: "シャルム西台３", owner_id: 3, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]
houses3 += [House.create({id: 9,name: "ドム国玉３", owner_id: 3, address: "東京都板橋区高島平1-82-5", postal_code: "175-0082"})]


####room
(1..9).each do |h|
    Room.create({id: (h*5) -4,number: "101", house_id: h})
    Room.create({id: (h*5) -3,number: "102", house_id: h})
    Room.create({id: (h*5) -2,number: "103", house_id: h})
    Room.create({id: (h*5) -1,number: "201", house_id: h})
    Room.create({id: (h*5), number: "202", house_id: h})
end

####resident&contact

resident1 = Resident.new(id: 1,name: "田中　圭", email: "resident1@example.com", password: "111111", phone_number: "00011111212")
resident1.skip_confirmation!
resident1.save
Room.find(1).update(resident_id: 1, request: true, requested_at: Time.zone.now)
resident2 = Resident.new(id: 2,name: "山田　圭", email: "resident2@example.com", password: "111111", phone_number: "00011111212")
resident2.skip_confirmation!
resident2.save
resident3 = Resident.new(id: 3,name: "木下　たくみ", email: "resident3@example.com", password: "111111", phone_number: "00-01111-1212")
resident3.skip_confirmation!
resident3.save
Room.find(15).update(resident_id: 3, request: true, requested_at: Time.zone.now)


resident4 = Resident.new(id: 4,name: "藤井　みなと", email: "resident4@example.com", password: "111111", phone_number: "000-111112-12")
resident4.skip_confirmation!
resident4.save
Room.find(16).update(resident_id: resident4.id, request: true, requested_at: Time.zone.now)
resident5 = Resident.new(id: 5,name: "ごとう　くみ", email: "resident5@example.com", password: "111111", phone_number: "00011-11-1212")
resident5.skip_confirmation!
resident5.save
Room.find(17).update(resident_id: 5, request: true, requested_at: Time.zone.now)
resident6 = Resident.new(id: 6,name: "アンリ・シューベルト", email: "resident6@example.com", password: "111111", phone_number: "000-111112-12")
resident6.skip_confirmation!
resident6.save
Room.find(30).update(resident_id: 6, request: false, requested_at: Time.zone.now)
Contact.create(room_id: 30, owner_id: 2, resident_id: 6)


resident7 = Resident.new(name: "小境　ともや", email: "resident7@example.com", password: "111111", phone_number: "000-11112-12")
resident7.skip_confirmation!
resident7.save
resident8 = Resident.new(name: "加藤　あおい", email: "resident8@example.com", password: "111111", phone_number: "000-1111-1212")
resident8.skip_confirmation!
resident8.save
resident9 = Resident.new(name: "佐保川　学", email: "resident9@example.com", password: "111111", phone_number: "000-1111-1212")
resident9.skip_confirmation!
resident9.save
###chat


