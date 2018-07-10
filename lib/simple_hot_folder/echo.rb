module SimpleHotFolder
  # Example class.
  class Echo

    # Return the same string that it is passed as param.
    #
    # @param [String] text The strint that will be returned.
    # @param [Boolean] uppercase To return the uppercase version of the string.
    # @return [String]
    def say(text, uppercase = false)
      uppercase ? text.upcase : text
    end
   
  end
end
  
