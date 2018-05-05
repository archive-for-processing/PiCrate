require 'rbconfig'

# Utility to load native binaries on Java CLASSPATH
class NativeFolder
  attr_reader :os, :bit

  WIN_FORMAT = 'windows%d'.freeze
  LINUX_FORMAT = 'linux%d'.freeze
  # WIN_PATTERNS = [
  #   /bccwin/i,
  #   /cygwin/i,
  #   /djgpp/i,
  #   /ming/i,
  #   /mswin/i,
  #   /wince/i
  # ].freeze

  def initialize
    @os = RbConfig::CONFIG['host_os'].downcase
    @bit = java.lang.System.get_property('os.arch') =~ /64/ ? 64 : 32
  end

  def name
    return 'macosx' if os =~ /darwin/ || os =~ /mac/
    # return format(WIN_FORMAT, bit) if WIN_PATTERNS.include? os
    return format(LINUX_FORMAT, bit) if os =~ /linux/
  end

  def extension
    return '*.so' if os =~ /linux/
    '*.dylib' # MacOS
  end
end
