module Juggernaut # :nodoc:
  module JRails
    module Helpers

      def juggernaut(options = {}, include_tag = true)
        options = juggernaut_options(options)
        if include_tag
          javascript_tag "new Juggernaut(#{options.to_json});"
        else
          "new Juggernaut(#{options.to_json});"
        end
      end
      
      def juggernaut_options(options = {})
        random_host = Juggernaut::JRails.random_host
        session_name = Rails.application.config.session_options[:key]
        options = {
          :host                 => (random_host[:public_host] || random_host[:host]),
          :port                 => (random_host[:public_port] || random_host[:port]),
          :width                => '0px',
          :height               => '0px',
          :session_id           => request.session_options[:id],
          :session_name         => session_name,
          :session_value        => cookies[session_name] || '',
          :token_name           => request_forgery_protection_token,
          :token_value          => URI.escape(form_authenticity_token, '/+='),
          :swf_address          => "/juggernaut/juggernaut.swf",
          :ei_swf_address       => "/juggernaut/expressinstall.swf",
          :flash_version        => 8,
          :flash_color          => "#fff",
          :swf_name             => "juggernaut_flash",
          :bridge_name          => "juggernaut",
          :debug                => Rails.env.development?,
          :reconnect_attempts   => 3,
          :reconnect_intervals  => 3
        }.merge(options)
      end
    end
  end
end
