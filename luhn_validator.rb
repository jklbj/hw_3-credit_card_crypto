module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    # reverse the array and double the value of every second digit
    nums_a.reverse!.each_index { |i| nums_a[i] = nums_a[i]*2 if i%2 == 1 }
    sum_digits = 0
    # If the result of this doubling operation is greater than 9, then add the digits of the result
    nums_a.each_index do |i|
      nums_a[i] = ((nums_a[i]/10)%10) + (nums_a[i]%10) if nums_a[i] >= 10
      sum_digits += nums_a[i] unless i == 0 
    end
    return true if nums_a[0] == (10 - (sum_digits%10)) ||  (sum_digits%10 == 0 && nums_a[0] == 0)

    false
  end
end
