require 'core_ext/module/include'

class Module
  def prepend_to(name, &prepended)
    push_to_module(name)
    define_method(name, &prepended)
  end

  def push_to_module(name)
    method = instance_method(name)
    p [method, method.object_id]
    include do
      define_method name do |*args, &block|
        # p [method, method.object_id]
        method.bind(self).call(*args, &block)
      end
    end
    remove_method(name)
  end
end
