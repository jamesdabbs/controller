require 'rack/file'
require 'rack/request'

module Hanami
  module Action
    module Rack
      # File to be sent
      #
      # @since 0.4.3
      # @api private
      #
      # @see Hanami::Action::Rack#send_file
      class File
        # @param path [String,Pathname] file path
        #
        # @since 0.4.3
        # @api private
        def initialize(path)
          @file = ::Rack::File.new(nil)
          @path = path
        end

        # @since 0.4.3
        # @api private
        def call(env)
          @file.serving(::Rack::Request.new(env), @path.to_s)
        rescue Errno::ENOENT
          [404, {}, nil]
        end
      end
    end
  end
end
