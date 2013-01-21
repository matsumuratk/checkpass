# ShortAccess
module ShortAccess
  TOKEN_LENGTH = 6

  module ClassMethods
    def short_access(column=:access_token, options={})
      opts = { :length => TOKEN_LENGTH }.merge(options)

      #generate access token
      define_method :_generate_access_token do
        if (temp_token = _random_token(opts[:length])) &&
          self.class.find(:first, :conditions => { column => temp_token }).nil?
          self.send("#{column}=", temp_token)
        else
          _generate_access_token
        end
      end
      private :_generate_access_token

      self.__send__(:include, Methods)

      self.before_create :_generate_access_token
      self.validates_uniqueness_of column
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module Methods
    private

    def _random_token(token_length)
      characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'
      temp_token = ''
      token_length.times do
        pos = rand(characters.length)
        temp_token += characters[pos..pos]
      end
      temp_token
    end
  end
end

