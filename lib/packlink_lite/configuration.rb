module PacklinkLite
  class Configuration
    attr_accessor :api_key, :testing, :timeout
    attr_writer :api_endpoint
    attr_reader :headers

    def initialize
      @headers = { 'Accept' => 'application/json' }
    end

    def api_endpoint
      @api_endpoint || default_endpoint
    end

    def timeout
      @timeout || 60
    end

    def headers=(options)
      headers.merge!(options)
    end

    private

    def default_endpoint
      testing ? SANDBOX_URL : PRODUCTION_URL
    end
  end
end
