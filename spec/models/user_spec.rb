require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "needs first name" do
        @user = User.new(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "password")
        expect(@user.first_name).to be_present
    end

    it "needs email" do
      @user = User.new(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.email).to be_present
    end

    it "needs unique email" do
      @user1 = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "existingemail@email.com", :password => "password", :password_confirmation => "password")
      @user2 = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "existingemail@email.com", :password => "password", :password_confirmation => "password")
      expect(@user2.errors.full_messages).to eq(["Email has already been taken"])
    end

    it "needs password field" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password).to be_present
    end

    it "needs password_confirmation" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password_confirmation).to be_present
    end

    it "needs password and password_confirmation to match" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "password")
      expect(@user.password).to eq(@user.password_confirmation)
    end

    it "throws error when confirmations don't match" do
      @user = User.create(:first_name =>  "Firstname", :last_name => "Surname", :email => "email@email.com", :password => "password", :password_confirmation => "nope")
      expect(@user.errors.full_messages.first).to eq("Password confirmation doesn't match Password")
    end


  end
end
