eval "git fetch --all -p -q";
git_command="git diff main $(git rev-parse HEAD) --name-only";

for diff_file in $($git_command); do
    eval "vendor/bin/phpcs --standard=PSR12 $diff_file";
done