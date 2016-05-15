require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe 'validations' do
    # it 'requires title' do
    #   achievement = Achievement.new(title: '')
      # achievement.valid?
      # expect(achievement.errors[:title]).to include("can't be blank")
      # expect(achievement.errors[:title]).not_be be_empty
    # expect(achievement.valid?).to be_falsy

    it { should validate_presence_of(:title) }


    # it 'requires title to be unique for one user' do
    #   user = FactoryGirl.create(:user)
    #   first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user)
    #   new_achievement = Achievement.new(title: 'First Achievement', user: user)
    #   expect(new_achievement.valid?).to be_falsy
    # end

    # it 'allows different users to have achievements with identical titles' do
    #   user1 = FactoryGirl.create(:user)
    #   user2 = FactoryGirl.create(:user)
    #   first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user1)
    #   new_achievement = Achievement.new(title: 'First Achievement', user: user2)
    #   expect(new_achievement.valid?).to be_truthy
    # end

     it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title")}
  end

  # it 'belongs to user' do
  #   achievement = Achievement.new(title: 'Some title', user: nil)
  #   expect(achievement.valid?).to be_falsy
  # end
  # Without gem should-matchers
  # it 'has belongs_to user association' do
  #   # 1 approach
  #   user = FactoryGirl.create(:user)
  #   achievement = FactoryGirl.create(:public_achievement, user: user)
  #   expect(achievement.user).to eq(user)
  #   # 2 approach
  #   u = Achievement.reflect_on_association(:user)
  #   expect(u.macro).to eq(:belongs_to)
  # end

  # With gem 'should-matchers'

  it { should belong_to(:user) }
end
