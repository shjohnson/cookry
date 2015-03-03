require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'testing vallidations' do
    describe 'for names, ratings and user' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:rating) }
      it { is_expected.to validate_presence_of(:user_id) }
    end
  end
end
