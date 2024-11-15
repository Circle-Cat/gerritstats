#!/bin/bash
#
# Run GerritDownloader and GerritStats.
#

script_path="$(cd "$(dirname -- "$0")" || exit 1; pwd -P)"
gerrit_out_dir="$script_path/gerrit_out"
out_html_dir="$script_path/out-html"

rm -rf $gerrit_out_dir
rm -rf $out_html_dir

$script_path/gerrit_downloader.sh $*
if [ $? != 0 ]
then
  exit $?
fi

$script_path/gerrit_stats.sh -f $gerrit_out_dir
if [ $? != 0 ]
then
  exit $?
fi
