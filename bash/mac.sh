#!/bin/bash

function _skype_list_usernames() {
  sqlite3 /Users/phchang/Library/Application\ Support/Skype/philipchoongheechang/main.db 'SELECT DISTINCT(dialog_partner) FROM Messages;'
}

function _skype_query_history() {
  sqlite3 /Users/phchang/Library/Application\ Support/Skype/philipchoongheechang/main.db "SELECT author, from_dispname, datetime(timestamp, 'unixepoch') as date, body_xml FROM Messages where dialog_partner = '$1' ORDER BY timestamp;"
}

