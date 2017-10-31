require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

    it {should validate_presence_of(:username)}
    it {should validate_length_of(:password).is_at_least(6)}

    describe 'associations' do
      it { should have_many(:goals) }
      it { should have_many(:comments) }
    end

    describe '::find_by_credentials' do
      let!(:cavs) { User.create!(username: 'Cavaliers', password: 'Cleveland') }
      # debugger
      it "should find by credentials" do
        expect(User.find_by_credentials("Cavaliers", "Cleveland").username).to eq ("Cavaliers")
      end
    end

end
