require_relative '../credit_card'
require 'minitest/autorun'

card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      it 'Check the first card has the same hash when it is consistently produced' do
        card = cards[0]
        hashed_card_1 = card.hash
        hashed_card_2 = card.hash
        hashed_card_1.must_equal hashed_card_2
      end

      it 'Check the second card has the same hash when it is consistently produced' do
        card = cards[1]
        hashed_card_1 = card.hash
        hashed_card_2 = card.hash
        hashed_card_1.must_equal hashed_card_2
      end

      it 'Check the third card has the same hash when it is consistently produced' do
        card = cards[2]
        hashed_card_1 = card.hash
        hashed_card_2 = card.hash
        hashed_card_1.must_equal hashed_card_2
      end
    end

    describe 'Check for unique hashes' do
      it 'Check the first card and the second card do not have the same hash' do
        card_1 = cards[0]
        card_2 = cards[1]
        hashed_card_1 = card_1.hash
        hashed_card_2 = card_2.hash
        hashed_card_1.wont_equal hashed_card_2
      end

      it 'Check the first card and the third card do not have the same hash' do
        card_1 = cards[0]
        card_3 = cards[2]
        hashed_card_1 = card_1.hash
        hashed_card_3 = card_3.hash
        hashed_card_1.wont_equal hashed_card_3
      end

      it 'Check the second card and the third card do not have the same hash' do
        card_2 = cards[1]
        card_3 = cards[2]
        hashed_card_2 = card_2.hash
        hashed_card_3 = card_3.hash
        hashed_card_2.wont_equal hashed_card_3
      end
    end
  end  

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      it 'Check the first card has the same hash when it is consistently produced' do
        card = cards[0]
        hashed_card_1 = card.hash_secure
        hashed_card_2 = card.hash_secure
        hashed_card_1.must_equal hashed_card_2
      end

      it 'Check the second card has the same hash when it is consistently produced' do
        card = cards[1]
        hashed_card_1 = card.hash_secure
        hashed_card_2 = card.hash_secure
        hashed_card_1.must_equal hashed_card_2
      end

      it 'Check the third card has the same hash when it is consistently produced' do
        card = cards[2]
        hashed_card_1 = card.hash_secure
        hashed_card_2 = card.hash_secure
        hashed_card_1.must_equal hashed_card_2
      end
    end

    describe 'Check for unique hashes' do
      it 'Check the first card and the second card do not have the same hash' do
        card_1 = cards[0]
        card_2 = cards[1]
        hashed_card_1 = card_1.hash_secure
        hashed_card_2 = card_2.hash_secure
        hashed_card_1.wont_equal hashed_card_2
      end

      it 'Check the first card and the third card do not have the same hash' do
        card_1 = cards[0]
        card_3 = cards[2]
        hashed_card_1 = card_1.hash_secure
        hashed_card_3 = card_3.hash_secure
        hashed_card_1.wont_equal hashed_card_3
      end

      it 'Check the second card and the third card do not have the same hash' do
        card_2 = cards[1]
        card_3 = cards[2]
        hashed_card_2 = card_2.hash_secure
        hashed_card_3 = card_3.hash_secure
        hashed_card_2.wont_equal hashed_card_3
      end
    end

    describe 'Check regular hash not same as cryptographic hash' do
      it 'Check the first card does not have the same hash with hash_secure' do
        card = cards[0]
        hash_card = card.hash
        hash_secure_card = card.hash_secure
        hash_card.wont_equal hash_secure_card
      end

      it 'Check the second card does not have the same hash with hash_secure' do
        card = cards[1]
        hash_card = card.hash
        hash_secure_card = card.hash_secure
        hash_card.wont_equal hash_secure_card
      end

      it 'Check the third card does not have the same hash with hash_secure' do
        card = cards[2]
        hash_card = card.hash
        hash_secure_card = card.hash_secure
        hash_card.wont_equal hash_secure_card
      end
    end
  end
end
