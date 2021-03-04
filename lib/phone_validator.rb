class PhoneValidator < ActiveModel::EachValidator
  # https://stackoverflow.com/questions/123559/how-to-validate-phone-numbers-using-regex?lq=1
  PHONE_REGEX = /^(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})(?:\s*(?:#|x\.?|ext\.?|extension)\s*(\d+))?$/

  def validate_each(record, attribute, value)
    unless (value && value.match(PHONE_REGEX))
      record.errors.add(attribute, options[:message] || "invalid phone number formatting")
    end
  end
end