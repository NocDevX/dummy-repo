# eval "git fetch --all -p -q";
# git_command="git diff origin/main $(git rev-parse HEAD) --name-only";

# for diff_file in $($git_command); do
#     eval "vendor/bin/phpcs --standard=PSR12 $diff_file";
#     echo "";
# done

# COMMITS_BEHIND=$(git rev-list --count $(git rev-parse HEAD)..origin/main);
COMMITS_BEHIND=$(git rev-list --count origin/test-bash..origin/main);

if [[ $COMMITS_BEHIND -gt 0 ]]; then
    echo "Branch desnivelada à master, $COMMITS_BEHIND commit(s) atrás."
    exit 1;
fi