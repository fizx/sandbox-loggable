module Loggable
  module ClassMethods
    def logger
      @logger || Loggable.default
    end
    
    def logger=(l)
      @logger = l
    end
    
    alias_method :l, :logger
    alias_method :l=, :logger=
  end
  
  module LoggableMethods
    def default
      @default_logger ||= STDOUT
    end
    def default=(l)
      @default_loffer = l
    end
  end
  
  def l
    self.class.logger
  end
  
  def fatal(*a, &b)
    l.fatal(*a, &b)
  end

  def error(*a, &b)
    l.error(*a, &b)
  end

  def warn(*a, &b)
    l.warn(*a, &b)
  end

  def info(*a, &b)
    l.info(*a, &b)
  end

  def debug(*a, &b)
    l.debug(*a, &b)
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
  
  extend(LoggableMethods)
end