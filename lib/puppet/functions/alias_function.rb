Puppet::Functions::newfunction(:alias_function ) do |args|
  dispatch :resolve do
    param 'String', :old_function
    param 'String', :new_function
  end

  def resolve(old_function, new_function)
    Puppet::Functions::newfunction(old_function.to_sym) do |args|
    end
  end
end
