require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "needs first name" do
        @user = User.new(:first_name =>  "Firstname", :last_name => "Surname", :email => "email1@email.com", :password => "password", :password_confirmation => "password")
        expect(@user.first_name).to be_present
    end

    it "needs email" do
      @user = User.new(:first_name =>  "Firstname", :last_name => "Surname", :email => "email2@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.email).to be_present
    end

    it "needs unique email" do
      @user1 = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "existingemail@email.com", :password => "password", :password_confirmation => "password")
      @user2 = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "existingemail@email.com", :password => "password", :password_confirmation => "password")
      expect(@user2.errors.full_messages).to eq(["Email has already been taken"])
    end

    it "needs password field" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email3@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password).to be_present
    end

    it "needs password_confirmation" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email4@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password_confirmation).to be_present
    end

    it "password needs to have at least three characters" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email5@email.com", :password => "p", :password_confirmation => "p")
      expect(@user.errors.full_messages.first).to eq("Password is too short (minimum is 3 characters)")
    end

    it "needs password and password_confirmation to match" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email6@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "throws error when confirmations don't match" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email7@email.com", :password => "password", :password_confirmation => "nope")
      expect(@user.errors.full_messages.first).to eq("Password confirmation doesn't match Password")
    end


    describe '.authenticate_with_credentials' do
      it "should login if email and password correct" do
        user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email8@email.com", :password => "password", :password_confirmation => "password")
        puts user
        expected = User.authenticate_with_credentials("email8@email.com", "password")
        expect(user).to eq(expected)
      end

      it "should give error if email incorrect" do
        user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email9@email.com", :password => "password", :password_confirmation => "password")
        expected = User.authenticate_with_credentials("wrong@email.com", "password")
        expect(expected).to be_nil

      end

      it "should give error if password incorrect" do
        user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email10@email.com", :password => "password", :password_confirmation => "password")
        expected = User.authenticate_with_credentials("email10@email.com", "wrong")
        expect(expected).to be_nil
      end

    end




  end
end
