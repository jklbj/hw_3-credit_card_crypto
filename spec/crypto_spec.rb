# frozen_string_literal: true

require_relative '../credit_card'
require_relative '../substitution_cipher'
require_relative '../double_trans_cipher'
require_relative '../sk_cipher'
require 'minitest/autorun'

describe 'Test card info encryption' do
  before do
    @cc = CreditCard.new('4916603231464963', 'Mar-30-2020',
                         'Soumya Ray', 'Visa')
    @key = 3
    @transpositionKey = [2,1,3,4]
  end

  describe 'Using Caesar cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Caesar.encrypt(@cc, @key)
      dec = SubstitutionCipher::Caesar.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Permutation cipher' do
    it 'should encrypt card information' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      enc = SubstitutionCipher::Permutation.encrypt(@cc, @key)
      dec = SubstitutionCipher::Permutation.decrypt(enc, @key)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using double transposition cipher' do
    it 'should encrypt card information' do
      enc = DoubleTranspositionCipher.encrypt(@cc, @transpositionKey)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      enc = DoubleTranspositionCipher.encrypt(@cc, @transpositionKey)
      dec = DoubleTranspositionCipher.decrypt(enc, @transpositionKey)
      dec.must_equal @cc.to_s
    end
  end

  describe 'Using Modern Symmetric cipher' do
    it 'should generate new key' do
      en_key = ModernSymmetricCipher.generate_new_key
      en_key.wont_be_nil
    end

    it 'should encrypt card information' do
      en_key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc, en_key)
      enc.wont_equal @cc.to_s
      enc.wont_be_nil
    end

    it 'should decrypt text' do
      en_key = ModernSymmetricCipher.generate_new_key
      enc = ModernSymmetricCipher.encrypt(@cc, en_key)
      dec = ModernSymmetricCipher.decrypt(enc, en_key)
      dec.must_equal @cc.to_s
    end
  end
end

