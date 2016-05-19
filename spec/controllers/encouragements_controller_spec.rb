require 'rails_helper'

RSpec.describe EncouragementController do

  let(:user) { FactoryGirl.crate(:user) }
  let(:author) { FactoryGirl.create(:user) }
  let(:achievement) { FactoryGirl.create(:public_achievement, user: author) }

  describe "GET new" do
    context 'guest user' do
  	  it 'is redirected back to achievement page' do
  	    get :new, achievement_id: achievement.id
  	    expect(response).to redirect_to(achievement_path(achievement))
  	  end
  	  it 'assigns flash message' do
  	  	get :new, achievement_id: achievement.id
  	  	expect(flash[:alert]).to eq('You must be logged in to encourage people')
  	  end
    end
    context 'autheticated user' do

      before { sign_in(user) }

  	  it 'renders :new template' do
  	    get :new, achievement_id: achievement.id
  	    expect(response).to render_template(:new)
  	  end
  	  it 'assigns new encouragement to template' do
  	  	get :new, achievement_id: achievement.id
  	  	expect(assigns(:encouragement)).to be_a_new(Encouragement)
  	  end
    end
    context 'achievement author' do
  	  it 'is redirected back to achievement page' do
  	  end
  	  it 'assigns flash message' do
  	  end
    end
    context 'user who already left encouragement for this achievement' do
      it 'is redirected back to achievement page' do
  	  end
  	  it 'assigns flash message' do
  	  end
    end
  end
end