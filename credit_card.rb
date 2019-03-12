require_relative './luhn_validator.rb'
require 'json'

class CreditCard
  include LuhnValidator

  # instance variables with automatic getter/setter methods
  attr_accessor :number, :expiration_date, :owner, :credit_network

  def initialize(number, expiration_date, owner, credit_network)
    @number = number
    @expiration_date = expiration_date
    @owner = owner
    @credit_network = credit_network
  end

  # returns json string
  def to_json
    {
      "number" => @number,
      "expiration_date" => @expiration_date,
      "owner" => @owner,
      "credit_network" => @credit_network
    }.to_json
  end

  # returns all card information as single string
  def to_s
    to_json
  end

  # return a new CreditCard object given a serialized (JSON) representation
  def self.from_s(card_s)
    creditCard_json_object = JSON.parse(card_s)
    CreditCard.new(creditCard_json_object["number"], creditCard_json_object["expiration_date"], creditCard_json_object["owner"], creditCard_json_object["credit_network"])
  end

  # return a hash of the serialized credit card object
  def hash
    to_s.hash
  end

  # return a cryptographically secure hash
  def hash_secure
    sha256 = OpenSSL::Digest::SHA256.new
    digest = sha256.digest(to_s)
  end
end
