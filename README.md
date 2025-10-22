# sashimi_tanpopo_action
Action for running [sashimi_tanpopo](https://github.com/sue445/sashimi_tanpopo) with GitHub Actions

[![test](https://github.com/sue445/sashimi_tanpopo_action/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/sashimi_tanpopo_action/actions/workflows/test.yml)

## Usage
```yml
- uses: sue445/sashimi_tanpopo_action@v0
  with:
    # Runtime ruby version.
    # This passed to ruby-version of ruby/setup-ruby.
    # c.f. https://github.com/ruby/setup-ruby
    # Default: ruby (latest stable version)
    ruby-version: ""

    # sashimi_tanpopo version. (e.g. 0.1.0, 0.1.1)
    # c.f. https://github.com/sue445/sashimi_tanpopo/releases
    # Default: latest version
    sashimi-tanpopo-version: ""

    # sashimi_tanpopo command. (e.g. local, github, gitlab)
    # c.f. https://github.com/sue445/sashimi_tanpopo#usage
    # Default: github
    command: ""

    # recipe files.
    # e.g. "recipe1.rb recipe2.rb"
    recipe-files: ""

    # Target directory.
    # Default: $GITHUB_WORKSPACE
    target-dir: ""

    # Params passed to recipe file.
    # e.g. "key1:value1 key2:value2"
    params: ""

    # Whether to run dry run.
    # Either true or false.
    # Default: false
    dry_run: "false"

    # Whether to colorize output.
    # Either true or false.
    # Default: true
    color: "true"

    # user name for git commit.
    # Default: username of user authenticated with token.
    # When using App Token, you must set this.
    git-user-name: ""

    # email for git commit.
    # Default: <git_user_name>@users.noreply.<github_host>
    git-email: ""

    # commit message
    message: ""

    # GitHub repository for Pull Request.
    # e.g. user/repo
    # Default: $GITHUB_REPOSITORY
    github-repository: ""

    # GitHub API endpoint.
    # Default: $GITHUB_API_URL
    github-api-url: ""

    # Pull Request title
    pr-title: ""

    # Pull Request body
    pr-body: ""

    # Pull Request source branch (a.k.a. head branch)
    pr-source-branch: ""

    # Pull Request target branch (a.k.a. base branch)
    # Default: default branch of github-repository
    pr-target-branch: ""

    # Pull Request assignees.
    # e.g. "one two three"
    pr-assignees: ""

    # Pull Request reviewers.
    # e.g. "one two three"
    pr-reviewers: ""

    # Pull Request labels.
    # e.g. "one two three"
    pr-labels: ""

    # Whether to create draft Pull Request.
    # Either true or false.
    # Default: false
    pr-draft: "false"

    # sashimi_tanpopo arguments.
    # If you want to pass an argument you created yourself, use this.
    # c.f. https://github.com/sue445/sashimi_tanpopo#usage
    arguments: ""
```

## Example
```yml
jobs:
  sashimi_tanpopo:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v5

      - name: Generate App Token
        id: generate_app_token
        uses: actions/create-github-app-token@v2
        with:
          app-id:       ${{ secrets.GH_APP_ID }}
          private-key:  ${{ secrets.GH_PRIVATE_KEY }}
          owner:        "username"
          repositories: "reponame"

      - name: Run sashimi_tanpopo
        uses: sue445/sashimi_tanpopo_action@v0
        with:
          # See usage and https://github.com/sue445/sashimi_tanpopo#sashimi_tanpopo-github
        env:
          GITHUB_TOKEN: ${{ steps.generate_app_token.outputs.token }}
```

**[IMPORTANT]** I strongly recommend using [App Token](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app) instead of `secrets.GITHUB_TOKEN`.

Because Pull Requests created by `secrets.GITHUB_TOKEN` doesn't trigger builds.

c.f. https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/trigger-a-workflow#triggering-a-workflow-from-a-workflow
