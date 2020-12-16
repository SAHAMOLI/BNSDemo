

$config = {}
# reads in config json files that can hold url's 
def get_all_configs
	require 'json'
	Dir.glob("./features/support/config/**/*.json").each do |file|
		file = File.read(file)
		data = JSON.parse(file)
		data.each do |key, stuff|
			$config[key] = stuff
		end
	end
end
