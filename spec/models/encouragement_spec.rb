require 'rails_helper'

RSpec.describe Encouragement, type: :model do
  it { shoud belongs_to(:user) }  
  it { shoud belongs_to(:achievement) }
  it { shoud valida_presence_of(:message) }
end
