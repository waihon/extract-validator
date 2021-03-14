require 'spec_helper'

class TestPerson
  include ActiveModel::Model

  attr_accessor :phone_number

  validates :phone_number, phone_number_format: true
end

describe PhoneNumberFormatValidator do
  it "validates if no phone number is passed" do
    valid_person = TestPerson.new(phone_number: nil)

    expect(valid_person).to be_valid
  end

  it "does not validate if a phone number formatting is incorrect" do
    invalid_person_one = TestPerson.new(phone_number: "++7777-777-777")
    invalid_person_two = TestPerson.new(phone_number: "777-7777-7777")

    expect(invalid_person_one).not_to be_valid
    expect(invalid_person_two).not_to be_valid
  end
end