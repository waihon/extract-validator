class PhoneNumberFormatValidator < ActiveModel::Validator
  # https://stackoverflow.com/questions/123559/how-to-validate-phone-numbers-using-regex?lq=1
  PHONE_REGEX = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/

  def validate(record)
    unless record.phone_number.nil? || record.phone_number =~ PHONE_REGEX
      record.errors[:phone_number] << "has invalid phone number format"
    end
  end
end