require 'rails_helper'

RSpec.describe User, type: :model do

  context 'testing validations' do
    describe 'for names and password' do
      it { is_expected.to validate_uniqueness_of(:username) }
      it { is_expected.to validate_presence_of(:first_name) }
      it { is_expected.to validate_presence_of(:last_name) }
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
      it { is_expected.to validate_length_of(:password).is_at_most(20) }
    end

    describe 'for email' do
      it { is_expected.to validate_uniqueness_of(:email) }

      ['test.com', 'test@test', '2345.com', 'test@.com'].each do |email|
        it { is_expected.to_not allow_value(email).for(:email) }
      end

      ['test.t@test.com', 'test@test.com', 'test23@test.co'].each do |email|
        it { is_expected.to allow_value(email).for(:email) }
      end
    end
  end
end
