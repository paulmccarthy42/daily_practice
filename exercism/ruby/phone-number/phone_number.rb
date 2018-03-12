class PhoneNumber
  def self.clean(number)
    cleaned = number.gsub(/\D/, "").match(/\d{10,11}/).to_s
    if !self.valid_number?(cleaned)
      return nil
    end
    cleaned
  end

  def self.valid_number?(cleaned_number)
    !cleaned_number.empty? &&
    area_code_valid?(cleaned_number) && 
    exchange_code_valid?(cleaned_number) &&
    cleaned_number.length == 10
  end

  def self.area_code_valid?(cleaned_number)
    cleaned_number[0].to_i > 1
  end

  def self.exchange_code_valid?(cleaned_number)
    cleaned_number[3].to_i > 1
  end
end

p PhoneNumber.clean("12234567190")