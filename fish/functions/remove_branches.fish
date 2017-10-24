function remove_branches --description 'remove local branches that do not exist on origin'
	git fetch -p
	for branch in (git branch -vv | awk '{print $1,$4}' | grep gone] | awk '{print $1}')
		if test "" = $branch 
			echo "no branche to delete"
		else
			git branch -D $branch
		end
	end
end
