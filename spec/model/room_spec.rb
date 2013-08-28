require_relative '../spec_helper'

describe Room do
	it { should validate_presence_of(:name)}
	it { should validate_presence_of(:description)}
	xit { should validate_presence_of(:capacity)}
	it { should_not allow_value("blah").for(:capacity)}
	
	it "changes the number of rooms created" do
		room = Room.new(name: 'Meeting room 1', description: 'with ac', capacity: '10', status: 'true')
		expect {room.save}. to change {Room.count}. by (1)
	end

	it "raises an exception if saved without room details" do
		room = Room.new
		expect {room.save!}.to raise_error {
			ActiveRecord::RecordInvalid
		}             
	end	

	it "should have unique name" do
		room1 = Room.create(name: 'Meeting room 1', description: 'with ac', capacity: '10', status: 'true')

		room2 = Room.new(name: 'Meeting room 1', description: 'with ac', capacity: '10', status: 'true')
		
		# expect {room2.save!}.to raise_error {
		# 	ActiveRecord::RecordInvalid}
		expect {room2.save}.not_to change {Room.count}. by (1)
	end

	xit "must be enabled by default" do
		room = Room.create(name: 'Meeting room 1', description: 'with ac', capacity: '10')
    room.status.should eq(true)
    # expect {room.status}.to eq(true)
	end
end