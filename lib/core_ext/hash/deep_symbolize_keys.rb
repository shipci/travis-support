class Hash
  def _deep_symbolize_keys
    inject({}) { |result, (key, value)|
      result[(key.to_sym rescue key) || key] = if value.respond_to?(:_deep_symbolize_keys)
        value._deep_symbolize_keys
      else
        value
      end
      result
    }
  end

  def _deep_symbolize_keys!
    replace(_deep_symbolize_keys)
  end
end

class Array
  def _deep_symbolize_keys
    map { |value| value.respond_to?(:_deep_symbolize_keys) ? value._deep_symbolize_keys : value }
  end
end
