require 'delegate'

# @author Kenichi Kamiya
module Vertere

  VERSION = '0.0.1'.freeze

  # @author Kenichi Kamiya
  module ObjectExtension
    def for_vertere
      ::Vertere.for_object self
    end
    
    alias_method :for_!, :for_vertere
    
    def comparison_inverted?
      false
    end
  end
  
  class << self
    def for_object(original)
      invereted = original.clone
    rescue SecurityError
      invereted = original.dup
    rescue TypeError
      invereted = SimpleDelegator.new original
    ensure
      invereted.singleton_class.class_eval do
        %w[== === =~].each do |operator|
          if original.respond_to? operator
            define_method operator do |other|
              ! (super other)
            end
          end
        end
        
        if original.respond_to? :<=>
          def <=>(other)
            r = super other
            r && (- r)
          end
        end
        
        def comparison_inverted?
          true
        end
      end
    end
  end

end