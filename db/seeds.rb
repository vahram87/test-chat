ap FactoryBot.create_list(:user, 2)
ap FactoryBot.create_list(:room, 4)
Room.find_each do |room|
  ap FactoryBot.create(:message, room: room, user: User.all.sample)
end
