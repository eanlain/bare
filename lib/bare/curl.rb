require 'net/http'
require 'uri'

module Bare
  class Curl
    class << self
      attr_accessor :body
      attr_accessor :code
      attr_accessor :cookie
      attr_accessor :response

      def setCookie(url, parameters={}, https=false)
        uri, http = setupHttp(url, https)

        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(parameters)
        response = http.request(request)
        cookie = response.response['set-cookie']
        self.cookie = cookie
        return cookie
      end

      def get(url, parameters={}, https=false, cookie=self.cookie)
        reset_attr
        full_url = url

        if !parameters.empty?
          full_url += "?"
        end

        parameters.each_with_index do |(k,v), index|
          if index == 0
            full_url += "#{k.to_s}=#{v.to_s}"
          else
            full_url += "&#{k.to_s}=#{v.to_s}"
          end
        end

        uri, http = setupHttp(full_url, https)

        request = Net::HTTP::Get.new(uri.request_uri)

        if !cookie.nil?
          request['Cookie'] = cookie
        end

        set_attr(http.request(request))
        return self.response
      end

      def post(url, parameters={}, https=false, cookie=self.cookie)
        reset_attr
        uri, http = setupHttp(url, https)

        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(parameters)

        if !cookie.nil?
          request['Cookie'] = cookie
        end

        set_attr(http.request(request))
        return self.response
      end

      def put(url, parameters={}, https=false, cookie=self.cookie)
        reset_attr
        uri, http = setupHttp(url, https)

        request = Net::HTTP::Put.new(uri.request_uri)
        request.set_form_data(parameters)

        if !cookie.nil?
          request['Cookie'] = cookie
        end

        set_attr(http.request(request))
        return self.response
      end

      def delete(url, https=false, cookie=self.cookie)
        reset_attr
        uri, http = setupHttp(url, https)

        request = Net::HTTP::Delete.new(uri.request_uri)

        set_attr(http.request(request))
        return self.response
      end

    protected
      def reset_attr
        self.body = nil
        self.code = nil
        self.response = nil
      end

      def set_attr(response)
        self.body = response.body
        self.code = response.code
        self.response = response
      end

      def setupHttp(url, https=false)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)

        if https == true
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end

        return uri, http
      end
    end    
  end
end
