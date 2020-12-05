require 'rails_helper'

describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :api_id}
  end

  describe 'relationships' do
    it { should have_many :events}
  end
end
