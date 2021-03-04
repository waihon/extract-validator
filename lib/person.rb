require_relative 'phone_validator'

class Person
  include ActiveModel::Validations

  validates :phone_number, phone: true

  attr_accessor :phone_number

  def initialize(attributes = {})
    @phone_number = attributes[:phone_number]
  end
end
