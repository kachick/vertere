# Copyright (C) 2012 Kenichi Kamiya

require 'delegate'

module Vertere

  VERSION = '0.0.2'.freeze
  
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
    
    alias_method :invert, :for_object

  end

end