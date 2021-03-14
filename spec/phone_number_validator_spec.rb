require 'spec_helper'

class TestPerson
  include ActiveModel::Model

  attr_accessor :phone_number

  validates :phone_number, phone_number_format: true
end

  