# hubot-mizuyari

A Hubot script for mizuyari.

## Installation

    $ npm install git://github.com/bouzuya/hubot-mizuyari.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-mizuyari.git#TAG'

## Configuration

    $ export HUBOT_MIZUYARI_ROOM='hitoridokusho'
    $ # cron format: https://github.com/ncb000gt/node-cron
    $ export HUBOT_MIZUYARI_SCHEDULE='00 45 09 * * 1-5'
    $ export HUBOT_MIZUYARI_MEMBERS='["bouzuya", "emanon001"]'

## Commands

    bouzuya> hubot help mizuyari
    hubot> hubot mizuyari - display the member on duty today

    bouzuya> hubot mizuyari
    hubot> 2014-07-25 : bouzuya

    (AM 09:45)
    hubot> @bouzuya mizuyari today!(2014-07-25)

## License

MIT

## Badges

[![Build Status][travis-status]][travis]

[travis]: https://travis-ci.org/bouzuya/hubot-mizuyari
[travis-status]: https://travis-ci.org/bouzuya/hubot-mizuyari.svg?branch=master
