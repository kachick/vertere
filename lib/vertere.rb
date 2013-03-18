# Copyright (C) 2012 Kenichi Kamiya

require 'delegate'
require_relative 'vertere/version'
require_relative 'vertere/objectextension'

module Vertere

  class << self
    
    def for_object(original)
      SimpleDelegator.new(original).tap {|wrapper|
        wrapper.singleton_class.class_eval do
          [:==, :===, :=~].each do |operator|
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
      }
    end
    
    alias_method :invert, :for_object

  end

end