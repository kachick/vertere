module Vertere

  module ObjectExtension
    def for_vertere
      ::Vertere.for_object self
    end
    
    alias_method :for_!, :for_vertere
    
    def comparison_inverted?
      false
    end
  end

end


class Object

  include Vertere::ObjectExtension

end
