require 'rails_helper'

describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of :date}
    it { should validate_presence_of :start_time}
    it { should validate_presence_of :duration}
    #it { should validate_presence_of :host_id}
  end

  describe 'relationships' do
    it { should belong_to :movie}
  end
end
