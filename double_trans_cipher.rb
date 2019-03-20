module DoubleTranspositionCipher
  def self.encrypt(document, key)
    plaintext = document.to_s
    text_block = text_to_block(plaintext)
    char_matrix, rows_cols_number = text_to_matrix(text_block)  
    cipher_matrix = change_position(char_matrix, key, rows_cols_number)
    c_text(cipher_matrix)
  end

  def self.decrypt(ciphertext, key)
    text_block = text_to_block(ciphertext)
    char_matrix, rows_cols_number = text_to_matrix(text_block)
    plaintext_matrix = change_position(char_matrix, key, rows_cols_number)
    d_text(plaintext_matrix)
  end

  def self.text_to_block(text)
    char_matrix = Array.new()
    until text == ""
      text_matrix = text.split(//, 17)
      char_matrix.append(text_matrix[0..15])
      text = text_matrix[-1]
    end
    char_matrix
  end

  def self.text_to_matrix(total_char_array)
    rows_cols_number = 4 
    total_char_matrix = Array.new()
    total_char_array.each { |char_array|
    # create an 2-dimensional array(matrix) to store the character
    # puts "0" into the residual place to fill the matrix
      char_matrix = Array.new(rows_cols_number) { Array.new(rows_cols_number, "~") }
      j,i = 0,0
      #puts character into matrix
      char_array.each { |c|
        char_matrix[i][j] = c
        j+=1
        if (j % rows_cols_number) == 0
          i += 1
          j = 0
        end
      }
      total_char_matrix.append(char_matrix)
    }
    return total_char_matrix, rows_cols_number
  end


  def self.change_position(total_char_matrix, key, rows_cols_number)
    change_row_matrix = Array.new()
    total_char_matrix.each_with_index { |char_matrix, q|
      #change the position of the rows
      key.each_with_index { |v, i|
        change_row_matrix[v-1] = char_matrix[i]
      }

      #change the position of the columns
      change_row_column_matrix = Array.new(rows_cols_number) { Array.new(rows_cols_number, "~") }
      key.each_with_index { |k, i|
        change_row_matrix.each_index { |j|
          change_row_column_matrix[j][i] = change_row_matrix[j][k-1]
        }
      }
      total_char_matrix[q] = change_row_column_matrix
    }
    
    total_char_matrix
  end

  # transfer the character ciphered matrix into string
  def self.c_text(total_char_matrix)
    cypher_text = ""
    total_char_matrix.each { |char_matrix|
      char_matrix.each { |row|
        row.each { |c|
          cypher_text += c
        }
      }
    }
    
    cypher_text
  end

   # transfer the character deciphered matrix into string
   def self.d_text(total_char_matrix)
    cypher_text = ""
    total_char_matrix.each { |char_matrix|
      char_matrix.each { |row|
        row.each { |c|
          cypher_text += c unless c == "~"
        }
      }
    }
    cypher_text
  end
end
