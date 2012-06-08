require "yaml"

module Juggernaut
  module JRails
    class <<self
      attr_writer :hosts
      
      def default_options
        @default_options ||= {
          :config_path => File.join(::Rails.root, 'config', 'juggernaut.yml'),
          :log_path => File.join(::Rails.root, 'log', 'juggernaut.log'),
          :pid_path => File.join(::Rails.root, 'tmp', 'pids', 'juggernaut.5001.pid')
        }
      end
      
      def hosts
        @hosts ||= YAML::load(ERB.new(IO.read("#{::Rails.root}/config/juggernaut_hosts.yml")).result)[:hosts].select {|k, h| !h[:environment] or h[:environment] == ::Rails.env.to_sym }
      end
      
      def random_host
        hosts[hosts.keys.sample]        
      end
    end
  end
end