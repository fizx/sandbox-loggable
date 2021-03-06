require "logger"
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
      return @default_logger if @default_logger
      @default_logger ||= Logger.new(STDOUT)
      level = to_log_level(ENV["LOG_LEVEL"])
      @default_logger.level = level if level
      @default_logger
    end
    
    def default=(l)
      @default_logger = l
    end
    
    def to_log_level(str)
      Logger.const_get(str.upcase)      
    rescue NameError
      nil
    end
  end
  
  def l
    respond_to?(:logger) ? logger : self.class.logger
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
    klass.extend(self)
  end
  
  extend(LoggableMethods)
end