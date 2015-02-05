module GiantBombApi
  class Exception::ApiError < GiantBombApi::Exception

    def initialize(status_code, message)
      @status_code = status_code
      @message = message
    end

    def message
      "#Status: {status_code} - #{message}"
    end

  end
end