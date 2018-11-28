# frozen_string_literal: false
require 'optparse'
require_relative 'version'

module Processing
  # Utility class to handle the different commands that the 'picrate' offers
  class Runner
    attr_reader :options, :argc, :filename

    def initialize
      @options = {}
    end

    # Start running a picrate command from the passed-in arguments
    def self.execute
      runner = new
      runner.parse_options(ARGV)
      runner.execute!
    end

    # Dispatch central.
    def execute!
      show_help if options.empty?
      show_version if options[:version]
      create if options[:create]
      install(filename) if options[:install]
    end

    # Parse the command-line options. Keep it simple.
    def parse_options(args)
      opt_parser = OptionParser.new do |opts|
        # Set a banner, displayed at the top
        # of the help screen.
        opts.banner = 'Usage: picrate [options] [<sketch.rb>]'

        # Define the options, and what they do
        options[:version] = false
        opts.on('-v', '--version', 'PiCrate Version') do
          options[:version] = true
        end

        options[:install] = false
        message = '<Samples><GLVideo><Video><Sound> Install samples or library'
        opts.on('-i', '--install', message) do
          options[:install] = true
        end

        options[:create] = false
        opts.on('-c', '--create', 'Create new sketch outline') do
          options[:create] = true
        end

        # This displays the help screen, all programs are
        # assumed to have this option.
        opts.on('-h', '--help', 'Display this screen') do
          puts opts
          exit
        end
      end
      @argc = opt_parser.parse(args)
      @filename = argc.shift
    end

    def create
      require_relative 'creators/sketch_writer'
      SketchWriter.new(File.basename(filename, '.rb'), argc).write
    end

    def show_version
      v_format = "PiCrate version %s\nJRuby version %s"
      puts format(v_format, PiCrate::VERSION, JRUBY_VERSION)
    end

    def install(library)
      choice = library.downcase
      valid = Regexp.union('samples', 'sound', 'video', 'glvideo')
      return warn format('No installer for %s', choice) unless valid =~ choice
      system "cd #{PICRATE_ROOT}/vendors && rake download_and_copy_#{choice}"
    end
  end # class Runner
end # module Processing
