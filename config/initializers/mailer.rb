# TODO: Create config/mailer.yml file, uncomment this code and remove mailer configration from environment/*.rb files

#action_mailer_config = YAML.load_file(File.join(Rails.root, "config", "mailer.yml"))[Rails.env]
#action_mailer_config.each do |key,value|
#  value.symbolize_keys! if value.is_a? Hash
#  Rails.application.config.action_mailer.send "#{key.to_s}=".to_sym, value
#end

