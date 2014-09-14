#!/usr/bin/perl -w

# AUTHOR:      Laszlo Szathmary, jabba.laci@gmail.com

use strict;

my ($dir, $elem, $firstRar, $cmd);

if (@ARGV > 0) { $dir = $ARGV[0]; }    # 1st parameter
else           { $dir = "."; }         # else: current dir.

#print ">>> $dir\n";

#
# looking for the file  *.part1.rar (or *.part01.rar, etc.)
#
foreach $elem (<$dir/*>) 
{
   #print ">>> $elem\n";
   if ($elem =~ /.*part0*1\.rar$/) {
      $firstRar = $elem;
   }
}

#
# if  *.part01.rar  doesn't exist, then
# looking for the file  *.rar
#
if (defined($firstRar) == 0) 
{
   my @collect;

   foreach $elem (<$dir/*>)
   {
      if ($elem =~ /\.rar$/) {
         push(@collect, $elem);
      }
   }

   if (scalar(@collect) > 1) {
      die("$0: there are multiple *.rar files");   # cannot decide which one to extract
   }
   else {
      $firstRar = $collect[0];
   }
}

# #
# # looking for the file  *.001
# #
# if (defined($firstRar) == 0) 
# {
#    foreach $elem (<"$dir"/*>) 
#    {
#       print ">>> $elem\n";
#       if ($elem =~ /\.001$/) {
#          $firstRar = $elem;
#       }
#    }
# }


if (defined($firstRar)) 
{
   mkdir("out") || warn("$0: error while trying to create the dir. out/\n");
   $cmd = "unrar  x  \"$firstRar\"  \"$dir/out/\"";
   #print $cmd."\n";
   system($cmd);
}
else
{
   warn("$0: no RAR file is found that could be extracted :(\n");
}

