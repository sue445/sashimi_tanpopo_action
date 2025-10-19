# sashimi_tanpopo_action
Action for running [sashimi_tanpopo](https://github.com/sue445/sashimi_tanpopo) with GitHub Actions

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
    sashimi-tanpopo-command: ""

    # sashimi_tanpopo arguments.
    # c.f. https://github.com/sue445/sashimi_tanpopo#usage
    sashimi-tanpopo-arguments: ""
```

## Example
```yml
jobs:
  sashimi_tanpopo:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v5

      - name: Run sashimi_tanpopo
        uses: sue445/sashimi_tanpopo_action@v0
        with:
          sashimi-tanpopo-arguments: "TBD" # See. https://github.com/sue445/sashimi_tanpopo#sashimi_tanpopo-github
```
