Puppet::Functions.create_function(:alias_function,Puppet::Functions::InternalFunction ) do
  
    require "pry"
    binding.pry
  # initial dispatch to create 2 params of type string - old function to be replaced and new function to replace the old function.
  dispatch :resolve do
    param 'String', :old_function
    param 'String', :new_function
  end

  def resolve(old_function, new_function)
    created = Puppet::Functions.create_function(old_function.to_sym) do
      define_method(old_function.to_sym) do |*user_args|
        call_function(new_function,user_args)
      end
    end
  end
end
