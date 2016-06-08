Puppet::Functions.create_function(:alias_function ) do |args|
  
  # initial dispatch to create 2 params of type string - old function to be replaced and new function to replace the old function.
  dispatch :resolve do
    param 'String', :old_function
    param 'String', :new_function
  end

  def resolve(old_function, new_function)
    require "pry"
    biding.pry
    Puppet::Functions::newfunction(old_function.to_sym) do |old_args|
      def sample(*old_args)
        call_function(new_function,old_args)
      end
    end
  end
end
