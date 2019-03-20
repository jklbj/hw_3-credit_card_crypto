module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      x = document.to_s.each_char.map{|a| a.ord + key }

      x.map{|a| a.chr}.join("")
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      x = document.to_s.each_char.map{|a| a.ord - key}

      x.map{|a| a.chr}.join("")
    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      def self.hashfun(number, key)
        number.to_i * 2 + key
      end
      
      document.to_s.each_char.map{|a| hashfun(a.ord, key).chr}.join("")
    end
    
        # Decrypts String document using integer key
        # Arguments:
        #   document: String
        #   key: Fixnum (integer)
        # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      def self.hashfun(number, key)
        (number - key) / 2
      end
    
      document.to_s.each_char.map{|a| hashfun(a.ord, key).chr}.join("")
    end
  end
end
