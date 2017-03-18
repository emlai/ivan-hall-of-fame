# IVAN Hall of Fame

[![Build Status](https://travis-ci.org/emlai/ivan-hall-of-fame.svg?branch=master)](https://travis-ci.org/emlai/ivan-hall-of-fame)

This is a global hall of fame for the game [Iter Vehemens ad Necem][1], aka
IVAN. The main goal is to extend the game to automatically send new scores
to the server, with proper authentication to prevent non-genuine submissions,
e.g. those sent from a custom build of the game, or from an official release
whose data files have been modified. A fork of IVAN with integration for this
project (i.e. automatic high-score syncing) is being implemented [here][2].

The server also provides a [web frontend][4] for viewing the global high-score
table.

__Current status:__ The fork submits new scores to, and downloads existing
scores from, the remote server.  
__To do:__ Authentication.

## Usage

This project uses [Rails][3], a server-side web framework for the Ruby
programming language. To start up the server, make sure you have Ruby and Rails
installed, then execute `rails server`. Use `rails test` to run the tests.

[1]: https://github.com/Attnam/ivan
[2]: https://github.com/emlai/ivan/tree/global-hall-of-fame
[3]: https://rubyonrails.org
[4]: https://ivan-hall-of-fame.herokuapp.com
