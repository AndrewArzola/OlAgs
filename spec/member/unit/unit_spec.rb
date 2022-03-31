# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

# def setup
#   test_user = {email: 'user@test.com', password: 'testuser'}
#   sign_up(test_user)
#   @auth_tokens = auth_tokens_for_user(test_user)
# end
OmniAuth.config.test_mode = true

RSpec.describe(Member, type: :model) do
  subject do
    described_class.new(fname: 'Jerome', lname: 'Wood', email: 'Jeromewood@gmail.com', joinDate: Date.new(2001, 1, 1), gradDate: Date.new(2001, 1, 1),
                        phoneNumber: '(282)-1231-432', city: 'Dallas', admin: 0, major: 'CS'
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to(be_valid)
  end

  it 'is not valid without a names and email' do
    subject.fname = nil
    subject.lname = nil
    subject.email = nil
    expect(subject).not_to(be_valid)
  end

  it 'is valid without unnecessary attributes' do
    subject.joinDate = nil
    subject.gradDate = nil
    subject.phoneNumber = nil
    subject.city = nil
    subject.admin = nil
    subject.major = nil
    subject.active = nil
    expect(subject).to(be_valid)
  end
end

RSpec.describe(Lineage, type: :model) do
  testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com')
  testMember2 = Member.create!(fname: 'Red', lname: 'Henry', email: 'JohnHenry@email.com')
  testMember3 = Member.create!(fname: 'Ned', lname: 'Henry', email: 'JohnHenry@email.com')

  subject do
    described_class.new(member_id: testMember1.id, father: nil, son: nil)
  end

  it 'Big and Little nil' do
    expect(subject).not_to(be_valid)
  end

  it 'Little nil' do
    subject.father = testMember2.id
    expect(subject).to(be_valid)
  end

  it 'Big nil' do
    subject.son = testMember2.id
    expect(subject).to(be_valid)
  end

  it 'No duplicates in instance' do
    subject.father = testMember1.id
    expect(subject).not_to(be_valid)
  end

  it 'Same Member id' do
    testlineage = described_class.create!(member_id: testMember2.id, father: testMember1.id, son: testMember3.id)
    subject.member_id = testMember2.id
    expect(subject).not_to(be_valid)
  end

  it 'Same Big' do
    testlineage = described_class.create!(member_id: testMember2.id, father: testMember3.id, son: testMember1.id)
    subject.father = testMember3.id
    expect(subject).not_to(be_valid)
  end

  it 'Same Little' do
    testlineage = described_class.create!(member_id: testMember2.id, father: testMember1.id, son: testMember3.id)
    subject.son = testMember3.id
    expect(subject).not_to(be_valid)
  end

  it 'Common inputs' do
    subject.father = testMember2.id
    subject.son = testMember3.id
    expect(subject).to(be_valid)
  end
end

RSpec.describe(Attendance, type: :model) do
  testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com')
  testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')

  subject do
    described_class.new(member_id: testMember1.id, event_id: testEvent1.id, rsvp: 'false', attended: 'false')
  end

  it 'No RSVP and no Attended' do
    expect(subject).to(be_valid)
  end

  it 'RSVP' do
    subject.rsvp = 'true'
    expect(subject).to(be_valid)
  end

  it 'Attended' do
    subject.attended = 'true'
    expect(subject).to(be_valid)
  end
end

RSpec.describe(Due, type: :model) do
  testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com')
  testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')

  subject do
    described_class.new(member_id: testMember1.id, event_id: testEvent1.id, dueAmount: '0', paid: 'false')
  end

  it 'All initializations done correctly' do
    expect(subject).to(be_valid)
  end

  it 'Paid' do
    subject.paid = 'true'
    expect(subject).to(be_valid)
  end

  it 'Due amount with decimal' do
    subject.dueAmount = '120.99'
    expect(subject).to(be_valid)
  end
end

RSpec.describe(Event, type: :model) do
  testEvent = Event.create(name: 'Celebration', description: 'Celebrating the welcoming of the new President', location: 'My House', start_time: '03/06/2023 4:00PM', end_time: '03/06/2023 7:00PM')

  it 'is valid with valid attributes' do
    expect(testEvent).to(be_valid)
  end

  it 'is not valid without a name, description, location, start and end times' do
    subject.name = nil
    subject.description = nil
    subject.location = nil
    subject.start_time = nil
    subject.end_time = nil
    expect(subject).not_to(be_valid)
  end
end
