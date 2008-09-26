require "test/unit"
require "rubygems"
require "mocha"
require File.dirname(__FILE__) + "/../lib/loggable"

class TestLoggable < Test::Unit::TestCase
  include Loggable
  
  def test_calls
    l = mock()
    l.expects(:fatal).with("fatal").times(2)
    l.expects(:error).with("error").times(2)
    l.expects(:warn).with("warn").times(2)
    l.expects(:info).with("info").times(2)
    l.expects(:debug).with("debug").times(2)
    
    assert_equal Loggable.default, self.class.logger
    
    self.class.logger = l
    assert_equal l, self.class.logger
    
    fatal "fatal"
    error "error"
    warn "warn"
    info "info"
    debug "debug"
    
    l.fatal "fatal"
    l.error "error"
    l.warn "warn"
    l.info "info"
    l.debug "debug"
  end
end