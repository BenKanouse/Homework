class Class


  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_hist_name = attr_name+"_history" # create bar_history getter

    self.class_eval("def #{attr_name};@#{attr_name};end")

    self.class_eval %Q{
      def #{attr_name}=(val)

        # add to history
        @#{attr_hist_name} = [nil] if @#{attr_hist_name}.nil?
        @#{attr_hist_name} << val
 
        # set the value itself
        @#{attr_name}=val
      end
 
      def #{attr_hist_name};@#{attr_hist_name};end
 
                    }
  end
end