branch_ref= command git rev-parse --abrev-ref HEAD;
git_command="git fetch --all -p -q | git diff main ${branc_ref} --name-only"

eval $git_command;