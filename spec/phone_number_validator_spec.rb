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
end