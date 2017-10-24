function backup --description 'create a backup of given directory/file'
	if count $argv > /dev/null
		cp -rf $argv $argv-(rfc3339)
	else
		echo "please provide a directory or file"
	end
end
