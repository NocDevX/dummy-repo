# eval "git fetch --all -p -q";
# git_command="git diff origin/main $(git rev-parse HEAD) --name-only";

# for diff_file in $($git_command); do
#     eval "vendor/bin/phpcs --standard=PSR12 $diff_file";
#     echo "";
# done

# COMMITS_BEHIND=$(git rev-list --count $(git rev-parse HEAD)..origin/main);
# COMMITS_BEHIND=$(git rev-list --count origin/test-bash..origin/main);
COMMITS_BEHIND=$(git rev-list --count --right-only test-bash..origin/main);

eval git rev-list --count --left-right test-bash..origin/main;

if [[ $COMMITS_BEHIND -gt 0 ]]; then
    echo "Branch desnivelada à main, $COMMITS_BEHIND commit(s) atrás."
    exit 1;
else
    echo "Nivelada";
fi