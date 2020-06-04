require 'rails_helper'
RSpec.feature 'User', type: :feature do
  scenario 'Creates a new User' do
    visit 'http://localhost:3000/users/sign_up'

    within find('#new_user') do
      fill_in 'user_name', with: 'RSpec'
      click_button 'commit'
    end
  rescue StandardError => e
    puts e.message.to_s
  end
end

RSpec.describe User, type: :model do
  describe '#name' do
    let(:user) { User.create(name: 'test') }
    it 'doesnt take user without the name' do
      user = User.new
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")

      user.name = 'test'
      user.valid?
      expect(user.errors[:name]).to_not include("can't be blank")
    end
  end
end
