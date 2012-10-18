require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "Example User", :email => "user@example.com" }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr);
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require a name of 50 characters or less" do
    toolong_user = User.new(@attr.merge(:name => "a" * 51))
    toolong_user.should_not be_valid
  end

  it "should accept a valid e-mail address" do
    addresses = %w[efrierson@ebscohost.com stacey.frierson@gmail.com mike.a@sted.wards.edu]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject bad e-mail addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should_not be_valid
    end
  end

  it "should have a unique email address" do
    User.create!(@attr.merge(:email => @attr[:email].upcase))
    user2 = User.new(@attr.merge(:name => "Bilbo"))
    user2.should_not be_valid
  end
end
