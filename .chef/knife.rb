current_dir = File.dirname(__FILE__)


# configuration
log_level                :info
log_location             STDOUT
node_name                user

cookbook_path            ["#{current_dir}", "#{current_dir}/../../cookbooks"]
