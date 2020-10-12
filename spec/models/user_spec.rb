require 'rails_helper'

RSpec.describe User, type: :model do


  it 'It is expected to generate a valid factory_bot user' do
    expect(build(:user)).to be_valid
  end


  it 'It is expected to generate :hash_id on create' do
    @user = create(:user)
    expect(@user.hash_id).to_not    be_nil
    expect(@user.hash_id.length).to eq(36)
  end


  # E-mail
  # ------------------------------------------------------------------
  describe 'E-mail' do

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it 'It is expected to validate email length' do
      @user = build(:user)
      expect(@user).to validate_length_of(:email).is_at_least(Settings['users']['validations']['email']['min_length'])
      expect(@user).to validate_length_of(:email).is_at_most(Settings['users']['validations']['email']['max_length'])
    end

    it 'It is expected to validate :email format' do
      should allow_value('a@a.com').for(:email)
      should_not allow_value('@a.com').for(:email)
      should_not allow_value('a@.com').for(:email)
      should_not allow_value('a@acom').for(:email)
      should_not allow_value('a@a.').for(:email)
    end

    it 'It is expected to not validate :email when record is deleted' do
      @user = build(:user, email: '', deleted: true)
      expect(@user).to be_valid
    end

  end
  # ------------------------------------------------------------------


  # Password
  # ------------------------------------------------------------------
  describe 'Password' do

    it 'It is expected to not validate password by default' do
      @user = build(:user, password: nil)
      expect(@user).to be_valid
    end

    describe 'If :should_validate_password is true' do

      it 'It is expected to validate password' do
        @user = build(:user, password: nil, should_validate_password: true)
        expect(@user).to_not be_valid
      end

      it 'It is expected to validate password length' do
        @user = build(:user, password: '123456', should_validate_password: true)
        expect(@user).to(validate_length_of(:password).is_at_least(Settings['users']['validations']['password']['min_length']))
        expect(@user).to validate_length_of(:password).is_at_most(Settings['users']['validations']['password']['max_length'])
      end

      it 'It is expected to correctly create encrypted_password' do
        @user = create(:user, password: '123456', should_validate_password: true)
        expect(@user.encrypted_password).to_not be_nil
        expect(::BCrypt::Password.new(@user.encrypted_password)).to eq('123456')
      end

      it 'It is expected for password_is? to return a valid response' do
        @user = create(:user, password: '123456', should_validate_password: true)
        expect(@user.password_is?('123456')).to be_truthy
        expect(@user.password_is?('000000')).to be_falsey
      end

      it 'It is expected to require password confirmation' do
        @user = build(:user, should_validate_password: true)
        expect(@user).to validate_confirmation_of(:password)
      end

    end

  end
  # ------------------------------------------------------------------


  # Blocked
  # ------------------------------------------------------------------
  describe 'Blocked' do

    it 'It is expected to require reason to block user' do
      @user = build(:user, blocked: true)
      expect(@user).to_not be_valid
      expect(@user).to validate_presence_of(:blocked_reason)
    end

    it 'It is expected to clear blocked reason when unblocking user' do
      @user = create(:user, blocked: true, blocked_reason: 'reason')
      @user.update(blocked: false)
      expect(@user.blocked_reason).to be_nil
    end

  end
  # ------------------------------------------------------------------


end
