# More info at https://github.com/guard/guard#readme

guard 'compass' do
	watch(%r{_scss/.+\.scss})
end

guard :jammit,
:config_path => "assets.yml",
:output_folder => "." do
	watch(%r{(?:_css|_js)(/.+)\.(?:css|js)}) { |m| m[0] unless m[1] =~ /\/\./ }
end