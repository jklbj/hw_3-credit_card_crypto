require 'rbnacl'
require 'base64'

module ModernSymmetricCipher

   

  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    secret_box = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
    Base64.encode64(secret_box)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    secret_box = RbNaCl::SecretBox.new(Base64.decode64(key))
    
    @nonce = RbNaCl::Random.random_bytes(secret_box.nonce_bytes)

    secret_box.encrypt(@nonce, document.to_s)
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    secret_box = RbNaCl::SecretBox.new(Base64.decode64(key))
    
    secret_box.decrypt(@nonce, encrypted_cc)
  end
end
