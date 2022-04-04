# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# NOTE: Due to some error the tests work when the members folder is called but not when the rspec spec/
# is called, this seems to be a problem with rspec or the order in which the tests are run

OmniAuth.config.silence_get_warning = true
RSpec.describe('Authentication', type: :feature) do
  before do
<<<<<<< HEAD
    Admin.create_or_find_by!(full_name: 'check', email: 'JH@gmail.com')
    Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu', joinDate: '01/01/2001', admin: 1)
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    Admin.create_or_find_by!(full_name: 'check', email: 'JH@gmail.com')
    Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu', admin: 1)
=======
<<<<<<< HEAD
    Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu',  admin: 1)
=======
    Member.destroy_all
    Event.destroy_all
    Due.destroy_all
    Attendance.destroy_all
    Lineage.destroy_all
    Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu')
>>>>>>> 379f69c (Dummy Commit)
>>>>>>> b180159 (Dummy Commit)
=======
    Member.delete_all
=======
>>>>>>> 44e7858 (dummy)
    Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu',  admin: 1)
>>>>>>> f46c063 (Mail Buttons)
>>>>>>> 7d0b316 (Mail Buttons)
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_admin]
    # visit sign_in click_on "Sign in with Google"
    visit admin_google_oauth2_omniauth_authorize_path
    # Permission.create!(description: 'admin') if Permission.where(description: 'admin').first.nil?
    unless Admin.where(email: 'userdoe@example.com').first.nil? == false
      Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    end
  end

<<<<<<< HEAD
  # Members Test
=======
<<<<<<< HEAD
<<<<<<< HEAD
  # Members Test
=======
<<<<<<< HEAD
=======
>>>>>>> f46c063 (Mail Buttons)
  #Members Test
>>>>>>> b180159 (Dummy Commit)
>>>>>>> 7d0b316 (Mail Buttons)
  describe 'Creating Min Requirements for Member', type: :feature do
    it 'valid inputs' do
      visit new_member_path
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Henry'
      fill_in 'Email Address', with: 'JH@gmail.com'
      fill_in 'Join Date', with: '01/01/2001'
      click_on 'Submit'
      visit members_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Henry'))
      expect(page).to(have_content('JH@gmail.com'))
    end
  end

  describe 'Creating Full Member', type: :feature do
    it 'valid inputs' do
      visit new_member_path
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name',	with: 'Henry'
      fill_in 'Email Address', with: 'JH@gmail.com'
      fill_in 'Join Date', with: '01/01/2001'
      fill_in 'Graduation Date', with: '01/01/2010'
      fill_in 'City', with: 'Austin'
      check 'Admin'
      fill_in 'Major', with: 'CS Major'
      click_on 'Submit'
      visit members_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Henry'))
      expect(page).to(have_content('JH@gmail.com'))
      expect(page).to(have_content('2001-01-01'))
      expect(page).to(have_content('2010-01-01'))
      expect(page).to(have_content('Austin'))
      expect(page).to(have_content('false'))
      expect(page).to(have_content('CS Major'))
      expect(page).to(have_content('true'))
    end
  end

  describe 'Creating Edit Full Member', type: :feature do
    it 'valid inputs' do
      test_member = Member.create!(fname: 'John', lname: 'Henry', joinDate: '01/01/2001', gradDate: '01/01/2010', email: 'JH@gmail.com', city: 'Austin', admin: 0, major: 'CS Major', active: 1)
      visit edit_member_path(id: test_member.id)
      fill_in 'Last Name', with: 'Smith'
      fill_in 'City', with: 'Dallas'
      click_on 'Submit'
      visit members_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Smith'))
      expect(page).to(have_content('JH@gmail.com'))
      expect(page).to(have_content('2001-01-01'))
      expect(page).to(have_content('2010-01-01'))
      expect(page).to(have_content('Dallas'))
      expect(page).to(have_content('CS Major'))
      expect(page).to(have_content('true'))
      expect(page).to(have_content('false'))
    end
  end

<<<<<<< HEAD
  describe 'Delete Member', type: :feature do
    it 'valid inputs' do
<<<<<<< HEAD
      Member.destroy_all
      test_member = Member.create!(fname: 'Victor', lname: 'Henry', joinDate: '01/01/2001', gradDate: '01/01/2010', email: 'JH@gmail.com', city: 'Austin', admin: 1, major: 'CS Major', active: 1)
<<<<<<< HEAD
      Member.create!(fname: 'Admin', lname: 'Doe', joinDate: '01/01/2001', email: 'admindoe@tamu.edu', admin: 1)
=======
      Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu', admin: 1)
=======
      Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu',  admin: 1)
      test_member = Member.create!(fname: 'Victor', lname: 'Henry', joinDate: '01/01/2001', gradDate: "01/01/2010", email: "JH@gmail.com", city: "Austin", admin: 1, major: "CS Major", active: 1)
>>>>>>> f46c063 (Mail Buttons)
>>>>>>> 7d0b316 (Mail Buttons)
      visit members_path
      expect(page).to(have_content('Victor'))
      expect(page).to(have_content('Henry'))
      expect(page).to(have_content('JH@gmail.com'))
      expect(page).to(have_content('2001-01-01'))
      expect(page).to(have_content('2010-01-01'))
      expect(page).to(have_content('Austin'))
      expect(page).to(have_content('true'))
      expect(page).to(have_content('CS Major'))
      expect(page).to(have_content('true'))
      click_on 'Destroy', match: :first
=======
  # describe 'Delete Member', type: :feature do
  #   it 'valid inputs' do
  #     Member.create!(fname: 'Admin', lname: 'Doe', email: 'admindoe@tamu.edu',  admin: 1)
  #     test_member = Member.create!(fname: 'Victor', lname: 'Henry', joinDate: '01/01/2001', gradDate: "01/01/2010", email: "JH@gmail.com", city: "Austin", admin: 1, major: "CS Major", active: 1)
  #     visit members_path
  #     expect(page).to have_content('Victor')
  #     expect(page).to have_content('Henry')
  #     expect(page).to have_content('JH@gmail.com')
  #     expect(page).to have_content('2001-01-01')
  #     expect(page).to have_content('2010-01-01')
  #     expect(page).to have_content('Austin')
  #     expect(page).to have_content('true')
  #     expect(page).to have_content('CS Major')
  #     expect(page).to have_content('true')
  #     click_on 'Destroy', match: :first
>>>>>>> 44e7858 (dummy)

  #     begin
  #       page.driver.browser.switch_to.alert.accept
  #     rescue StandardError
  #       Selenium::WebDriver::Error::NoSuchAlertError
  #     end

<<<<<<< HEAD
      expect(page).not_to(have_content('Victor'))
    end
  end
  
  #Lineage Test
  describe 'Lineage one null node', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testMember2 = Member.create!(fname: 'Tim', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)

      visit new_lineage_path
      select 'John', from: 'lineage_member_id', match: :first
      select 'Tim', from: 'lineage_father', match: :first
      select 'None', from: 'lineage_son', match: :first
      click_on 'Submit'
      visit lineages_path

      expect(page).to(have_content('John'))
      expect(page).to(have_content('Tim'))
    end
  end

  describe 'Lineage three diffrent member nodes', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember2 = Member.create!(fname: 'Tim', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember3 = Member.create!(fname: 'Jade', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001',)

      visit new_lineage_path
      select 'John', from: 'lineage_member_id', match: :first
      select 'Tim', from: 'lineage_father', match: :first
      select 'Jade', from: 'lineage_son', match: :first
      click_on 'Submit'
      visit lineages_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Tim'))
      expect(page).to(have_content('Jade'))
    end
  end

  describe 'edit', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember2 = Member.create!(fname: 'Tim', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember3 = Member.create!(fname: 'Jade', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember4 = Member.create!(fname: 'Slim', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')

      testLineage = Lineage.create!(member_id: testMember1.id, father: testMember2.id, son: testMember3.id)
      visit lineages_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Tim'))
      expect(page).to(have_content('Jade'))

      visit edit_lineage_path(id: testLineage.id)
      select 'Slim', from: 'lineage_member_id', match: :first
      select 'John', from: 'lineage_father', match: :first
      click_on 'Submit'
      visit lineages_path
      expect(page).to(have_content('Slim'))
      expect(page).not_to(have_content('Tim'))
    end
  end

  describe 'Testing Delete', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember2 = Member.create!(fname: 'Tim', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')
      testMember3 = Member.create!(fname: 'Jade', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001')

      visit new_lineage_path
      select 'John', from: 'lineage_member_id', match: :first
      select 'Tim', from: 'lineage_father', match: :first
      select 'Jade', from: 'lineage_son', match: :first
      click_on 'Submit'
      visit lineages_path

      expect(page).to(have_content('John'))
      expect(page).to(have_content('Tim'))
      expect(page).to(have_content('Jade'))

      click_on 'Destroy', match: :first

      begin
        page.driver.browser.switch_to.alert.accept
      rescue StandardError
        Selenium::WebDriver::Error::NoSuchAlertError
      end

      expect(page).not_to(have_content('John'))
    end
  end

  # Attendance

  describe 'rsvped and attended', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      visit new_attendance_path
      # expect(page).to have_content('fesfesesfafesefaesfseafeff')
      select 'John', from: 'attendance_member_id', match: :first
      select 'Funeral', from: 'attendance_event_id', match: :first
      check 'Rsvp'
      check 'Attended'
      click_on 'Submit'
      visit attendances_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Funeral'))
      expect(page).to(have_content('true'))
      expect(page).to(have_content('true'))
    end
  end

  describe 'no rsvp and attended', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      visit new_attendance_path
      select 'John', from: 'attendance_member_id', match: :first
      select 'Funeral', from: 'attendance_event_id', match: :first
      check 'Attended'
      click_on 'Submit'
      visit attendances_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Funeral'))
      expect(page).to(have_content('false'))
      expect(page).to(have_content('true'))
    end
  end

  describe 'Member Name link', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testMember2 = Member.create!(fname: 'Jane', lname: 'Doe', email: 'JaneDoe@email.com', joinDate: '01/01/2001', admin: 1)
      testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      testEvent2 = Event.create!(name: 'Party', location: 'MSC', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      visit new_attendance_path
      select 'John', from: 'attendance_member_id', match: :first
      select 'Funeral', from: 'attendance_event_id', match: :first
      check 'Rsvp'
      check 'Attended'
      click_on 'Submit'
      visit attendances_path
      visit new_attendance_path
      select 'Jane', from: 'attendance_member_id', match: :first
      select 'Party', from: 'attendance_event_id', match: :first
      check 'Rsvp'
      check 'Attended'
      click_on 'Submit'
      visit attendances_path
      # click_link "Member Name"
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Jane'))
    end
  end
  # Due Test

  describe 'paid', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      visit new_due_path
      select 'John', from: 'due_member_id', match: :first
      select 'Funeral', from: 'due_event_id', match: :first
      fill_in 'Amount', with: 120
      check 'Paid'
      click_on 'Submit'
      visit dues_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Funeral'))
      expect(page).to(have_content('120'))
      # expect(page).to have_content('true')
    end
  end

  describe 'not paid', type: :feature do
    it 'valid inputs' do
      testMember1 = Member.create!(fname: 'John', lname: 'Henry', email: 'JohnHenry@email.com', joinDate: '01/01/2001', admin: 1)
      testEvent1 = Event.create!(name: 'Funeral', location: 'Church', start_time: '03/03/2099 10:00PM', end_time: '03/03/2099 11:00PM', description: 'N/A')
      visit new_due_path
      select 'John', from: 'due_member_id', match: :first
      select 'Funeral', from: 'due_event_id', match: :first
      fill_in 'Amount', with: 120
      click_on 'Submit'
      visit dues_path
      expect(page).to(have_content('John'))
      expect(page).to(have_content('Funeral'))
      expect(page).to(have_content('120'))
      # expect(page).to have_content('false')
    end
  end

  # Events
  # 2023-03-06 13:00:00 UTC
  describe 'Event test 1', type: :feature do
    it 'valid inputs' do
      visit new_event_path
      fill_in 'Name', with: 'Birthday'
      fill_in 'Description', with: 'Celebration of the Presidents birthday'
      fill_in 'Location', with: 'My House'
      fill_in 'Start Time', with: DateTime.new(2023, 3, 3, 17, 0, 0)
      fill_in 'End Time', with: DateTime.new(2023, 3, 3, 21, 0, 0)
      click_on 'Submit'
      expect(page).to(have_content('Birthday'))
      expect(page).to(have_content('Celebration of the Presidents birthday'))
      expect(page).to(have_content('My House'))
      expect(page).to(have_content('03/03/2023 05:00PM'))
      expect(page).to(have_content('03/03/2023 09:00PM'))
    end
  end

  describe 'Delete Event', type: :feature do
    it 'valid inputs' do
      testEvent = Event.create!(name: 'Birthday', description: 'Celebration of the Presidents birthday', location: 'My House', start_time: '03/03/2023 9:00PM', end_time: '03/03/2023 11:00PM')
      visit new_event_path
      fill_in 'Name', with: 'Birthday'
      fill_in 'Description', with: 'Celebration of the Presidents birthday'
      fill_in 'Location', with: 'My House'
      fill_in 'Start Time', with: DateTime.new(2023, 3, 3, 21, 0, 0)
      fill_in 'End Time', with: DateTime.new(2023, 3, 3, 23, 0, 0)
      click_on 'Submit'
      expect(page).to(have_content('Birthday'))
      expect(page).to(have_content('Celebration of the Presidents birthday'))
      expect(page).to(have_content('My House'))
      expect(page).to(have_content('03/03/2023 09:00PM'))
      expect(page).to(have_content('03/03/2023 11:00PM'))
      visit edit_event_path(id: testEvent.id)
      click_on 'Remove Event'
      testEvent.destroy
    end
  end

  describe 'Edit Event', type: :feature do
    it 'valid inputs' do
      testEvent = Event.create(name: 'Celebration', description: 'Celebrating the welcoming of the new President', location: 'My House', start_time: '03/06/2023 4:00PM', end_time: '03/06/2023 7:00PM')
      visit edit_event_path(id: testEvent.id)
      fill_in 'Name', with: 'Celebration'
      fill_in 'Description', with: 'Celebrating the welcoming of the new President'
      fill_in 'Location', with: 'My House'
      fill_in 'Start Time', with: DateTime.new(2023, 3, 12, 16, 0, 0)
      fill_in 'End Time', with: DateTime.new(2023, 3, 12, 19, 0, 0)
      click_on 'Submit'
      expect(page).to(have_content('Celebration'))
      expect(page).to(have_content('Celebrating the welcoming of the new President'))
      expect(page).to(have_content('My House'))
      expect(page).to(have_content('03/12/2023 04:00PM'))
      expect(page).to(have_content('03/12/2023 07:00PM'))
    end
  end
=======
  #     expect(page).not_to have_content('Victor')
  #   end
  # end
>>>>>>> 44e7858 (dummy)
end
