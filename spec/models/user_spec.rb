require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations.' do
    context "User is created." do
      it "must be created with a password and password_confirmation fields" do
        @some_user = User.new({
          first_name: "bub", 
          last_name: "rub",
          email: "brub@a.ca",
          password: "password",
          password_confirmation: "password"
        })
        expect(@some_user).to be_valid
      end

      it "is not valid if password and password_confirmation fields do not match" do
        @some_user = User.new({
          first_name: "bub", 
          last_name: "rub",
          email: "brub@a.ca",
          password: "password",
          password_confirmation: "111111111"
        })
        # puts @some_user.inspect
        # puts @some_user.save
        # puts @some_user.inspect
        expect(@some_user).to_not be_valid
      end

      it "Emails must be unique (not case sensitive)" do
        @some_user = User.new({
          first_name: "bub", 
          last_name: "rub",
          email: "brub@a.ca",
          password: "password",
          password_confirmation: "password"
        })
        @some_user2 = User.new({
          first_name: "ol", 
          last_name: "yeller",
          email: "BRUB@a.ca",
          password: "password",
          password_confirmation: "password"
        })

        @some_user.save
        @some_user2.save
        # puts User.all.inspect

        expect(@some_user2).to_not be_valid
      end

      it "Email, first name, and last name are required" do
        @some_user = User.new({
          first_name: "", 
          last_name: "",
          email: "",
          password: "password",
          password_confirmation: "password"
        })

        @some_user.save
        # puts @some_user.errors.full_messages

        expect(@some_user.errors.full_messages).to include("Email can't be blank","First name can't be blank", "Last name can't be blank")
      end
      it "Password length must be 5 characters or greater" do
        @some_user = User.new({
          first_name: "bub", 
          last_name: "rub",
          email: "brub@a.ca",
          password: "pass",
          password_confirmation: "pass"
        })

        @some_user.save
        # puts @some_user.errors.full_messages

        expect(@some_user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
      end
    end
  end


  describe '.authenticate_with_credentials' do
    context "when called, " do
      it "returns the user instance if a valid email and password are passed in" do
        @some_user = User.new({
          first_name: "one", 
          last_name: "two",
          email: "abc@example.ca",
          password: "swordfish",
          password_confirmation: "swordfish"
        })
        @some_user.save

        test_user = User.authenticate_with_credentials("abc@example.ca","swordfish")
        # puts test_user.inspect
        expect(test_user.last_name).to eq("two")
      end

      it "returns nil if invald credentials are passed in" do
        @some_user = User.new({
          first_name: "one", 
          last_name: "two",
          email: "abc@example.ca",
          password: "swordfish",
          password_confirmation: "swordfish"
        })
        @some_user.save

        test_user = User.authenticate_with_credentials("abc@example.ca","incorrect_password")
        expect(test_user).to eq(nil)
      end

      it "trims leading or trailing whitespace from email user input" do
        @some_user = User.new({
          first_name: "one", 
          last_name: "two",
          email: "abc@example.ca",
          password: "swordfish",
          password_confirmation: "swordfish"
        })
        @some_user.save

        test_user = User.authenticate_with_credentials("  abc@example.ca  ","swordfish")
        expect(test_user.last_name).to eq("two")
      end

      it "is not case sensitive for email input" do
        @some_user = User.new({
          first_name: "one", 
          last_name: "two",
          email: "Abc@example.ca",
          password: "swordfish",
          password_confirmation: "swordfish"
        })
        @some_user.save
        test_user = User.authenticate_with_credentials("ABc@EXamplE.ca","swordfish")
        # puts test_user.inspect
        expect(test_user.last_name).to eq("two")
      end
    end
  end

end
