# Instrumental Tools

A collection of tools for use with Instrumental ([www.instrumental.com](http://www.instrumentalapp.com/))

## instrument_server

Use to collect various monitoring statistics of a server. Execute with:

```sh
instrument_server [INSTRUMENTAL_API_KEY]
```

Linux note: Install iostat (part of the sysstat package) in order to collect disk I/O metrics.

## instrumental

Output text graphs of the different metrics in your project.

See all options with: `instrumental --help`

## gitstrumental

Collect statistics on commit counts in a given git repo.  Execute in the repo directory with:

```sh
gitstrumental [INSTRUMENTAL_API_KEY]
```