GIT_COMMAND="git diff origin/main $GITHUB_REF_NAME --name-only --diff-filter=d"
PSR=PSR12

for diff_file in $($GIT_COMMAND); do
    eval "vendor/bin/phpcs --standard=$PSR $diff_file";
done;