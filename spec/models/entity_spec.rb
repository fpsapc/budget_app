require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'Salman', email: 'fpsapc@gmail.com', password: '123456')
    @group = Group.create(icon: 'icon.png', name: 'Group', user_id: @user.id)
    @entity = Entity.create(name: 'transaction', amount: '100', group_id: @group.id, user_id: @user.id,
                            author_id: @user.id)
  end

  describe 'Transaction validations' do
    it 'is valid with valid attributes' do
      expect(@entity).to be_valid
    end

    it 'is not valid without a name' do
      @entity.name = nil
      expect(@entity).to_not be_valid
    end

    it 'is invalid if name length is more than 100 characters' do
      @entity.name = 'name' * 26
      expect(@entity).to_not be_valid
    end

    it 'is not valid without a user' do
      @entity.user_id = nil
      expect(@entity).to_not be_valid
    end

    it 'is not valid without an amount' do
      @entity.amount = nil
      expect(@entity).to_not be_valid
    end
  end
end
