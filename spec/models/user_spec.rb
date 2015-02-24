require 'rails_helper'

RSpec.describe User, type: :model do

  context 'when given valid attributes' do
    context 'and the atributes are unique' do
      it 'creates a user with the given attributes' do
      end
    end

    context 'and the email or username is already taken' do
      it 'will throw a duplicate username error' do
      end

      it 'will throw a duplicate email error' do
      end
    end
  end

  context 'when given invalid or missing atributes' do
    context 'when the first name is missing' do
      it 'will throw a NameMissingError' do
      end
    end

    context 'when the last name is missing' do
      it 'will throw an NameMissingError' do
      end
    end

    context 'when the username is missing' do
      it 'will throw an NameMissingError' do
      end
    end

    context 'when the email is missing' do
      it 'will throw an error' do
      end
    end

    context 'when the password is missing' do
      it 'will throw an error' do
      end
    end
  end
end
