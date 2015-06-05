require 'rest-client'

namespace :php_tools do

  desc "Clear the APC cache"
  task :apc_clear do
    on roles(:app) do
      unless fetch(:uri)
        raise "uri not set, please set it in your deployment or stage settings:\nset :uri, 'http://example.com'"
      end

      puts 'Clearing APC Cache to prevent memmory allocation errors.'

      apc_clear_uri = "#{fetch(:uri)}/apc_clear.php"
      apc_clear_path = "#{current_path}/apc_clear.php"
      apc_clear_code = <<-CODE
<?php
apc_clear_cache();
apc_clear_cache('user');
apc_clear_cache('opcode');
CODE

      execute "touch #{apc_clear_path} && echo \"#{apc_clear_code}\" >> #{apc_clear_path}"

      puts "Sending HTTP GET request to: #{apc_clear_uri}"
      response = RestClient.get apc_clear_uri
      case response.code
      when 200
        execute "rm #{apc_clear_path}"
      else
        raise "Failed to clear APC cache. GET #{apc_clear_uri} returned #{response.code}"
      end

    end
  end
end
