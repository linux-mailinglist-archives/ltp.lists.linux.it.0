Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B637C7E52
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 09:04:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1A1D63CD3C7
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 09:04:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A04E73C8767
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 09:04:33 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 77031616637
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 09:04:31 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 177CB1FD7B;
 Fri, 13 Oct 2023 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697180670; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JzWeEd7x5o/JwNmZhaxC1BWAJnJcWirlUmFsWApmb4U=;
 b=H5idRMu/2/BxNPSRTN6tiB5X5kAcn8PxvNlj5sdwcf8b3k/cpuzvlWtoOE5AWaI9jVPwF/
 qVUJVMHCKITe2VT/k2xG2/WGbCNrm272hELANEsSNkn5GP03pWgTRoftCIPbecsfzdzW4x
 74AIUsneAEKsD1Kswa4dbZeqIfAYLFA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697180670;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JzWeEd7x5o/JwNmZhaxC1BWAJnJcWirlUmFsWApmb4U=;
 b=v8dpBZQMmMMZbc3a7K4k3+nbK+/NKZdgCw29ScP5HwE0jCzPFodDLw0LnDtadeHT1rWgFM
 eO+14pTt55h5XpDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6FFD1358F;
 Fri, 13 Oct 2023 07:04:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fEtWL/3rKGXDSQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 13 Oct 2023 07:04:29 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Oct 2023 09:04:04 +0200
Message-ID: <20231013070404.695418-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -2.10
X-Spamd-Result: default: False [-2.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_MISSING_CHARSET(2.50)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] Remove mongo test framework
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: fstests@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Nearly 20 years old code for testing reiserfs, ext2 and jfs has never
been properly integrated into LTP properly (not in runtest file).

The main motivation was probably to test reiserfs, which has been
deprecated and no longer used in the production.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

I'm not sure if algorithm in reiser_fract_tree.c or anything else from
this very old testsuite would be useful for folks in fstests, I doubt,
but just for sure Cc them.

Kind regards,
Petr

 testcases/kernel/fs/mongo/README              |  37 --
 testcases/kernel/fs/mongo/map5.c              |  78 ---
 testcases/kernel/fs/mongo/mongo.pl            | 511 ------------------
 testcases/kernel/fs/mongo/mongo_compare.c     | 224 --------
 testcases/kernel/fs/mongo/mongo_read.c        |  57 --
 testcases/kernel/fs/mongo/mongo_slinks.c      |  98 ----
 testcases/kernel/fs/mongo/reiser_fract_tree.c | 502 -----------------
 testcases/kernel/fs/mongo/run_mongo           |  36 --
 testcases/kernel/fs/mongo/summ.c              |  27 -
 testcases/kernel/fs/mongo/test.sh             | 109 ----
 10 files changed, 1679 deletions(-)
 delete mode 100644 testcases/kernel/fs/mongo/README
 delete mode 100644 testcases/kernel/fs/mongo/map5.c
 delete mode 100755 testcases/kernel/fs/mongo/mongo.pl
 delete mode 100644 testcases/kernel/fs/mongo/mongo_compare.c
 delete mode 100644 testcases/kernel/fs/mongo/mongo_read.c
 delete mode 100644 testcases/kernel/fs/mongo/mongo_slinks.c
 delete mode 100644 testcases/kernel/fs/mongo/reiser_fract_tree.c
 delete mode 100755 testcases/kernel/fs/mongo/run_mongo
 delete mode 100644 testcases/kernel/fs/mongo/summ.c
 delete mode 100755 testcases/kernel/fs/mongo/test.sh

diff --git a/testcases/kernel/fs/mongo/README b/testcases/kernel/fs/mongo/README
deleted file mode 100644
index a134305b6..000000000
--- a/testcases/kernel/fs/mongo/README
+++ /dev/null
@@ -1,37 +0,0 @@
-
-       MONGO.PL BENCHMARK.
-
-To run mongo benchmark please use the next :
-
-# run_mongo <device> <processes>
-
-Where :
-<device>    - test device
-<processes> - number of processes
-
-The benchmark will be performed on given device with
-reiserfs and ext2. Then results will be compared.
-
-The results directory : ./results
-The comparision *.html and *.txt files in ./results/html
-
-Warning : All info will be erased on device.
-
-------------------------------------------------------
-
-Mongo.pl description :
-
-  mongo.pl <filesystem> <device> <test_dir> <log> <processes>
-
-  for example :
-  mongo.pl reiserfs /dev/hda5 /testfs log 1
-
-Be careful :
-  /dev/hda5 - test device and all info on it will be erased.
-  It should be at least 500 Mb in size.
-
-  /testfs - mount-point directory
-
-  log - name prefix for results file.
-
-
diff --git a/testcases/kernel/fs/mongo/map5.c b/testcases/kernel/fs/mongo/map5.c
deleted file mode 100644
index 7cd700e98..000000000
--- a/testcases/kernel/fs/mongo/map5.c
+++ /dev/null
@@ -1,78 +0,0 @@
-/*
- * Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
- */
-
-#include <stdio.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <linux/fs.h>
-#include <errno.h>
-
-int main(int argc, char **argv)
-{
-	int fd;
-	int block;
-	int first_block;
-	int last_block;
-	int totals_block;
-	int fragments;
-	int i;
-	int n;
-
-	for (n = 1; n < argc; n++) {
-		if (argc < 2) {
-			printf
-			    ("Used to see file maps \nUsage: %s filename1 [[..[filename2]...filename(N-1)] filenameN]\n",
-			     argv[0]);
-			return 0;
-		}
-		fd = open(argv[n], O_RDONLY);
-		if (fd == -1) {
-			perror("open failed");
-			continue;
-		}
-		// printf ("file %s occupies blocks: \n", argv[1]);
-		// printf ("START\tEND\tCOUNT\n");
-		i = 0;
-		block = 0;
-		first_block = 0;
-		last_block = 0;
-		fragments = 0;
-		totals_block = 0;
-
-		while (ioctl(fd, FIBMAP, &block) == 0) {
-			if (first_block == 0) {
-				last_block = block - 1;
-				first_block = block;
-			}
-			if (block != last_block + 1) {
-				// printf ("%d\t%d\t%d\n",first_block,last_block,last_block-first_block+1);
-				totals_block += last_block - first_block + 1;
-				fragments++;
-				first_block = block;
-				last_block = block;
-			} else {
-				last_block++;
-			}
-
-			if (!block) {
-				//printf ("Fragments: %d\tBlocks: %d\n",fragments,totals_block);
-				//printf ("%d:%d\t",fragments,totals_block);
-				//if (fragments == 1) printf(".",totals_block);
-				//else printf("%d_",fragments,totals_block);
-				printf("%d\n", fragments);
-				break;
-			}
-
-			i++;
-			block = i;
-		}
-		if (errno) {
-			perror("FIBMAP failed");
-		}
-		close(fd);
-		// printf ("\n");
-	}
-	return 0;
-}
diff --git a/testcases/kernel/fs/mongo/mongo.pl b/testcases/kernel/fs/mongo/mongo.pl
deleted file mode 100755
index 5d47d8746..000000000
--- a/testcases/kernel/fs/mongo/mongo.pl
+++ /dev/null
@@ -1,511 +0,0 @@
-#!/usr/bin/perl
-#
-# Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
-#
-
-#
-# Mongo.pl is reiserfs benchmark.
-#
-# To run please use run_mongo script or :
-#
-# # ./mongo.pl reiserfs /dev/xxxx /testfs log1 5
-# or
-# # ./mongo.pl ext2 /dev/xxxx /testfs log2 5
-#
-# 5 - number of processes, you can set any number here
-#
-# Test will format partition /dev/xxxx by 'mkreiserfs' or 'mke2fs'
-# mount it and run given number of processes during each phase :
-# Create, Copy, Symlinks, Read, Stats, Rename and Delete.
-#
-# Also, the program calc fragmentations after Create and Copy phases:
-# Fragm = number_of_fragments / number_of_files
-# (Current version use the files more than 16KB to calc Fragm.)
-#
-# You can find the same results in files : log, log.tbl, log_table
-#
-# log       - raw results
-# log.tbl   - results for compare program
-# log_table - results in table form
-#
-
-$EXTENDED_STATISTICS = 1;
-
-
-use POSIX;
-use File::stat;
-
-sub print_usage {
-
-        print "\nUsage: mongo.pl <filesystem> <device>";
-	print                  " <mount_point> <log> <processes>\n";
-
-	print "<filesystem>  - the name of filesystem [reiserfs|ext2]\n";
-	print "<device>      - the device for benchmark (e.g. /dev/hda9)\n";
-	print "<mount_point> - mount-point for the filesystem";
-	print " (e.g. /mnt/testfs)\n";
-	print "<log>         - the name prefix for benchmark results\n";
-	print "<processes>   - the number of benchmark processes\n";
-
-	print "\nexamples:\n";
-	print "mongo.pl reiserfs /dev/hda9 /testfs reiserfs_results 1\n";
-	print "mongo.pl ext2 /dev/hda9 /testfs ext2_results 1\n";
-
-	print "\nThe results will be put in ./results directory\n";
-}
-
-
-#------- Subroutines declaration --------
-sub make_fsys;
-sub mongo_x_process;
-sub mongo_launcher;
-sub set_params;
-
-#------- main() -------------------------
-
-if ( $#{ARGV} != 4 ) {
-        print_usage;
-	exit(0);
-    }
-
-#--------------------------------------------
-# Set working directories
-#--------------------------------------------
-$TOPDIR  = "$ENV{PWD}";
-
-$RESDIR  = "${TOPDIR}/results";
-$HTMLDIR = "${RESDIR}/html";
-
-$FILESYSTEM  = $ARGV[0];
-$DEVICE      = $ARGV[1];
-$TESTDIR     = $ARGV[2];
-$PROCESSES   = $ARGV[4];
-
-$LOGFILE     = "${RESDIR}/${ARGV[3]}";
-$LOGFILE2    = "${LOGFILE}_table";
-$LOGFILE3    = "${LOGFILE}.tbl";
-
-$TMPFILE     = "${RESDIR}/mongo_tmp";
-$nproc       = $PROCESSES;
-$READIT      = "${TOPDIR}/mongo_read";
-$SLINKS      = "${TOPDIR}/mongo_slinks";
-
-#-------- reiser_fract_tree parameters----------------
-$x1mb   = 1024 * 1024;
-$x2mb   =    2 * $x1mb;
-$x3mb   =    3 * $x1mb;
-
-$x5mb   =    5 * $x1mb;
-$x50mb  =   50 * $x1mb;
-$x100mb =  100 * $x1mb;
-
-# Total amount of bytes in all files on test partition
-#-----------------------------------------------------
-
-$small_bytes   = $x50mb;
-$medium_bytes  = $x100mb;
-$big_bytes     = $x100mb;
-$large_bytes   = $x100mb;
-
-# Median size of files in bytes for first tree to create
-#-------------------------------------------------------
-$small_size   = 100;
-$medium_size  = 1000;
-$big_size     = 10000;
-$large_size   = 100000;
-
-# Keep the largest file to one fifth (100 million bytes)
-# of the total tree size.
-#-------------------------------------------------------
-$max_file_size = 100000000;
-
-# Yuri Shevchuk says that 0 is the median size
-# in real life, so I believe him.
-#----------------------------------------------
-$median_dir_nr_files = 0;
-
-# This should be larger, change once done testing.
-#-------------------------------------------------
-$bytes_to_consume = 10000000;
-
-$median_file_size = 100;
-$max_file_size    = 1000000;
-
-$median_dir_nr_files    = 100;
-$max_directory_nr_files = 10000;
-
-$median_dir_branching = 0;
-$max_dir_branching    = 1;
-
-# This should be varying, someday....
-#------------------------------------
-$write_buffer_size = 4096;
-
-@numb_of_bytes = ($small_bytes, $medium_bytes, $big_bytes, $large_bytes);
-@size_of_files = ($small_size,  $medium_size,  $big_size,  $large_size);
-
-$reiser_fract_tree_rep_counter = 3;
-
-$total_params = $#{numb_of_bytes};
-
-#... Make directories for results
-#--------------------------------
-unless (-e $RESDIR) {
-    print "Creating dir: ${RESDIR} \n";
-    system("mkdir $RESDIR");
-}
-
-unless ( -e $HTMLDIR ) {
-    print "Creating dir: ${HTMLDIR} \n";
-    system("mkdir $HTMLDIR");
-}
-
-#... Compile *.c files if it is necessary
-#----------------------------------------
-sub compile
-{
-  my $file = shift @_;
-  my $opt = shift @_ if @_ ;
-  my $cfile = $file . ".c";
-  die "source file \"${cfile}\" does not exist" unless (-e  "$cfile");
-  if ( -e "$file" && (stat("$file")->mtime >= stat("$cfile")->mtime)) {
-    print "$file is up to date ...\n";
-  } else {
-    print "Compiling ${cfile} ...\n";
-    system ("gcc $cfile -o $file $opt");
-  }
-}
-
-compile("reiser_fract_tree", "-lm");
-compile("mongo_slinks");
-compile("mongo_read");
-compile("map5");
-compile("summ");
-compile("mongo_compare");
-
-#... Check the command string parameters
-#---------------------------------------
-unless ( ($FILESYSTEM eq "reiserfs") or ($FILESYSTEM eq "ext2") ) {
-    print "mongo.pl: not valid filesystem name: ${FILESYSTEM} \n";
-    print "Usage: mongo.pl <filesystem> <device> <mount_point> <log> <repeat>\n";
-    exit(0);
-}
-
-unless ( -b $DEVICE ) {
-    print "mongo.pl: not valid device: ${DEVICE} \n";
-    print "Usage: mongo.pl <filesystem> <device> <mount_point> <log> <repeat>\n";
-    exit(0);
-}
-
-
-#------- Subroutines --------------------------------------
-#----------------------------------------------------------
-sub get_blocks_usage ($) {
-  my ($mp) = @_;
-  my $df = `df -k $mp | tail -n 1`;
-  chomp $df;
-  my @items = split / +/, $df;
-  return $items[2];
-}
-
-sub make_fsys {
-
-    system ("umount $TESTDIR") ;
-
-    if ( $FILESYSTEM eq "reiserfs" ) {
-	system("echo y | mkreiserfs $DEVICE") ;
-	system("mount -t reiserfs $DEVICE $TESTDIR") ;
-    }
-
-    if ( $FILESYSTEM eq "ext2" ) {
-	system("mke2fs $DEVICE") ;
-	system("mount $DEVICE $TESTDIR") ;
-    }
-}
-
-
-#------------------------------------------------------------------
-# Mongo Launcher
-#------------------------------------------------------------------
-sub mongo_launcher {
-
-    my ($phase_num, $phase_name, $cmd, $dir1, $dir2, $flag, $processes) = @_ ;
-
-
-    print "$phase_num.$phase_name files of median size $median_file_size bytes ($p processes)...\n";
-    print LOG "********* Phase $phase_num: $phase_name files of median size $median_file_size bytes ($p processes) *********\n";
-    $i=0;
-    $total=0;
-
-# eliminate the rep counter and the while
-    while ( $i < $reiser_fract_tree_rep_counter ) {
-	print "$phase_name : ";
-    	print LOG "$phase_name : ";
-	$com = "";
-	$pp=$processes;
-
-	$j=0;
-	while ($pp > 0) {
-	    $pp--;
-
-# the fact that this if statement was necessary indicated you
-# attempted excessive generalization and abstraction where it was not
-# natural to the task that makes the code harder to understand.  put
-# every command on one line to execute.  I like it when I can read a
-# one line command and see what that phase of the test does instead of
-# looking in many places throughout the code.
-
-	    if ($phase_num == 1) {
-    		$com .= "$cmd $dir1-$i-$j $flag";
-	    }
-	    elsif ($phase_num == 2) {
-		$com .= "$cmd $dir1-$i-$j $dir2-$i-$j";
-	    }
-	    elsif ($phase_num == 3) {
-		$com .= "$cmd $dir1-$i-$j "."-type f | while read X; do echo \$X \$X.lnk ; done | $TOPDIR/mongo_slinks ";
-	    }
-	    elsif ($phase_num == 4) {
-		$com .= "$cmd";
-	    }
-	    elsif ($phase_num == 5) {
-		$com .= "$cmd";
-	    }
-	    elsif ($phase_num == 6) {
-		$com .= "$cmd $dir1-$i-$j -type f | perl -e 'while (<>) { chomp; rename (\$_, \"\$_.r\"); };'";
-		#$com .= " & $cmd $dir2-$i-$j "."-type d -exec mv {} {}.r ';'";
-	    }
-	    elsif ($phase_num == 7) {
-		if ($processes > 1) {
-		    $com .= "$cmd $dir1-$i-$j & $cmd $dir2-$i-$j";
-		}
-		else {
-		    $com .= "$cmd $dir1-$i-$j ; $cmd $dir2-$i-$j";
-		}
-	    }
-	    $com .= " & ";
-	    $j++;
-	}
-
-	$com .= " wait";
-	#print $com, "\n";
-
-	@t=`(time -p $com) 2>&1`;
-
-	@tt = split ' ', $t[0];
-    	$res = $tt[1];
-	unless ( $res =~ /\s*\d+/) {
-	    print @t , "\n";
-	    print LOG @t, "\n";
-	} else {
-	    print LOG "$res sec.\n";
-	    print "$res sec.\n";
-	}
-
-	$total += $res;
-    	$i++;
-     }
-
-    print "total $phase_name time: $total sec.\n";
-    print LOG "total $phase_name time: $total sec.\n";
-
-    $ares[$phase_num]=$total;  # ser array of results
-
-    if ($EXTENDED_STATISTICS) {
-	if( $phase_num < 3) {
-	    $used = get_blocks_usage($TESTDIR) - $used0;
-	    if ($phase_num == 1) {
-		$used1=$used;
-	    }elsif($phase_num == 2){
-		$used2=$used;
-	    }
-	    print "Used disk space (df) : $used KB\n";
-	    print LOG "Used disk space (df) : $used KB\n";
-
-	    open (FIND_PIPE, "find $TESTDIR|") || die "cannnot open pipe from \"find\": $!\n";
-	    $dirs = 0;
-	    $files = 0;
-	    $files16 = 0;
-
-	    while(<FIND_PIPE>) {
-		chomp;
-		$st = lstat ($_);
-		if (S_ISDIR($st->mode)) {
-		    $dirs ++;
-		} elsif (S_ISREG($st->mode)) {
-		    $files ++;
-		    $files16 ++ if ($st->size > 16384);
-		}
-	    }
-
-	    close (FIND_PIPE);
-
-	    print "Total dirs: $dirs\n";
-	    print "Total files: $files\n";
-	    print LOG "Total dirs: $dirs\n";
-	    print LOG "Total files: $files\n";
-
-	    #$f=$frag;
-	    $f16  = $files16;
-	    $fr16 =`find $TESTDIR -type f -size +16k | xargs $TOPDIR/map5 | $TOPDIR/summ | tail -n 1 2>&1`;
-	    @ff16= split ' ', $f16;
-	    @ffr16= split ' ', $fr16;
-	    $files16 = $ff16[0];
-	    $frag = $ffr16[0];
-	    $procent = $frag / $files16;
-	    print "Total fragments : $frag \n";
-	    print LOG "Total fragments : $frag \n";
-
-	    printf "Fragments / files :%.3f\n", $procent;
-	    printf LOG "Fragments / files :%.3f\n", $procent;
-	    $frag_res[$phase_num]=$procent;  # ser array of results
-	}
-    }
-
-    system("sync");
-    print "\n";
-    print LOG "\n";
-
-}
-
-# and what is an x process?
-
-#------------------------------------------------------------------
-# MONGO_X_PROCESS ( x is number of processes to run )
-#------------------------------------------------------------------
-sub mongo_x_process {
-
-    my ($processes) = @_ ;
-    $p = $processes;
-
-    make_fsys;       # make and mount the file system
-    $used0 = get_blocks_usage($TESTDIR);
-
-    open LOG,  ">>$LOGFILE"  or die "Can not open log file $LOGFILE\n";
-    open LOG2, ">>$LOGFILE2" or die "Can not open log file $LOGFILE2\n";
-    open LOG3, ">>$LOGFILE3" or die "Can not open log file $LOGFILE2\n";
-
-    print LOG "FILESYSTEM=$FILESYSTEM \n";
-
-    print "\n";
-    if($p == 1) {
-	print "mongo_single_process, the_set_of_param.N=$par_set_n of $total_params \n";
-	print LOG "mongo_single_process, the_set_of_paramN=$par_set_n of $total_params \n";
-    } elsif ($p > 1) {
-        print "mongo_multi_process ($p processes), the_set_of_param.N=$par_set_n of $total_params \n";
-	print LOG "mongo_multi_process ($p processes), the_set_of_paramN=$par_set_n of $total_params \n";
-    }
-
-    print "Results in file : $LOGFILE \n";
-    print "\n";
-
-    $dir1 = "$TESTDIR/testdir1";
-    $dir2 = "$TESTDIR/testdir2";
-    $flag = 0;
-
-    $cmd_1 = "$TOPDIR/reiser_fract_tree $bytes_to_consume $median_file_size $max_file_size $median_dir_nr_files $max_directory_nr_files $median_dir_branching $max_dir_branching $write_buffer_size";
-    $cmd_2 = "cp -r";
-    $cmd_3 = "find";
-    $cmd_4 = "find $TESTDIR -type f | xargs $TOPDIR/mongo_read";
-    $cmd_5 = "find $TESTDIR -type f > /dev/null"; # it should be enough for stat all files. -zam
-    $cmd_6 = "find"; #" $TESTDIR -type f -exec mv {} {}.r ';'";
-    $cmd_7 = "rm -r";
-
-    system("sync");
-    $frag = 0;
-    mongo_launcher ( 1, "Create", $cmd_1, $dir1, $dir2, $flag, $p); # phase 1
-    mongo_launcher ( 2, "Copy  ", $cmd_2, $dir1, $dir2, $flag, $p); # phase 2
-    mongo_launcher ( 3, "Slinks", $cmd_3, $dir1, $dir2, $flag, $p); # phase 3
-    mongo_launcher ( 4, "Read  ", $cmd_4, $dir1, $dir2, $flag, $p); # phase 4
-    mongo_launcher ( 5, "Stats ", $cmd_5, $dir1, $dir2, $flag, $p); # phase 5
-    mongo_launcher ( 6, "Rename", $cmd_6, $dir1, $dir2, $flag, $p); # phase 6
-    mongo_launcher ( 7, "Delete", $cmd_7, $dir1, $dir2, $flag, $p); # phase 7
-
-    print LOG2 "\n";
-    if ($processes > 1) {
-	print LOG2 "MONGO_MULTI_PROCESS ($processes processes) BENCHMARK RESULTS (time in sec.)\n";
-    }else {
-	print LOG2 "MONGO_SINGLE_PROCESS BENCHMARK RESULTS (time in sec.)\n";
-    }
-    print LOG2 "  FILESYSTEM=$FILESYSTEM\n";
-    print LOG2 "  parameters: files=$files, base_size=$median_file_size bytes, dirs=$dirs\n";
-    print LOG2 "--------------------------------------------------------------\n";
-    print LOG2 "Create\tCopy\tSlink\tRead\tStats\tRename\tDelete\n";
-    print LOG2 " time \ttime\ttime\ttime\ttime \t time \t time\n";
-    print LOG2 "--------------------------------------------------------------\n";
-    print LOG2 "$ares[1]\t$ares[2]\t$ares[3]\t$ares[4]\t$ares[5]\t$ares[6]\t$ares[7]\n";
-    print LOG2 "--------------------------------------------------------------\n";
-    print LOG2 "The size of files tree : \n";
-    print LOG2 "         after create = $used1 kb\n";
-    print LOG2 "         after copy   = $used2 kb\n";
-    print LOG2 "\n";
-
-
-    print LOG3 "\n";
-    if ($processes > 1) {
-	print LOG3 "MONGO_MULTI_PROCESS  ($processes)    \n";
-    }else {
-	print LOG3 "MONGO_SINGLE_PROCESS      \n";
-    }
-    print LOG3 "parameters:              \n";
-    print LOG3 "files=$files            \n";
-    print LOG3 "base_size=$median_file_size bytes    \n";
-    print LOG3 "dirs=$dirs              \n";
-    print LOG3 "\n";
-
-    print LOG3 "FSYS=$FILESYSTEM         \n";
-    print LOG3 "(time in sec.)           \n";
-    print LOG3 "Create : $ares[1]\n";
-    print LOG3 "Fragm. : $frag_res[1]\n";
-    print LOG3 "df     : $used1\n\n";
-    print LOG3 "Copy   : $ares[2] \n";
-    print LOG3 "Fragm. : $frag_res[2]\n";
-    print LOG3 "df     : $used2\n\n";
-    print LOG3 "Slinks : $ares[3]\n";
-    print LOG3 "Read   : $ares[4]\n";
-    print LOG3 "Stats  : $ares[5]\n";
-    print LOG3 "Rename : $ares[6] \n";
-    print LOG3 "Delete : $ares[7]\n";
-
-    print LOG3 "\n";
-
-
-    if($processes > 1) {
-	print LOG "******* The end of mongo_multi_process *******";
-    }else {
-	print LOG "******* The end of mongo_single_process *******";
-    }
-}
-
-#---------------------------------------------------
-# Set parameters
-#---------------------------------------------------
-sub set_params {
-    my ($n) = @_ ;
-
-    $bytes_to_consume = $numb_of_bytes[$n];
-    $median_file_size = $size_of_files[$n];
-
-    #$max_file_size    = 1000000;
-
-    #$median_dir_nr_files    = 100;
-    #$max_directory_nr_files = 10000;
-
-    #$median_dir_branching = 0;
-    #$max_dir_branching    = 1;
-
-}
-
-#----------------------------------------------------------
-#           TEST START
-#----------------------------------------------------------
-
-    $par_set_n = 0;
-    foreach $fsize (@size_of_files) {
-	set_params ($par_set_n);
-	mongo_x_process( $nproc );    # run n processes
-	$par_set_n++;
-    }
-    system("umount $TESTDIR");
-    exit;
-
-
diff --git a/testcases/kernel/fs/mongo/mongo_compare.c b/testcases/kernel/fs/mongo/mongo_compare.c
deleted file mode 100644
index 6dba95347..000000000
--- a/testcases/kernel/fs/mongo/mongo_compare.c
+++ /dev/null
@@ -1,224 +0,0 @@
-/*
- * Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
- */
-
-#include <stdio.h>
-#include <ctype.h>
-#include <string.h>
-
-char time_str1[50];
-char time_str2[50];
-char name_str1[50];
-char tmp_str[20][100];
-
-char out1[256];
-char out2[256];
-
-FILE *f1;
-FILE *f2;
-FILE *f3;
-FILE *f4;
-
-void write_html_head(FILE * fp);
-void write_html_end(FILE * fp);
-
-char head_str[] = "\n \
-<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n \
-<html>\n \
-<head>\n \
-   <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">\n \
-   <meta name=\"GENERATOR\" content=\"Mozilla/4.5 [en] (X11; I; Linux 2.2.7 i586) [Netscape]\">\n \
-</head>\n \
-<body>\n \
-";
-/*
-<tt></tt>&nbsp;\n \
-<table BORDER NOSAVE >\n \
-<tr BGCOLOR=\"#CCFFFF\" NOSAVE>\n \
-<td NOSAVE> \n \
-";
-*/
-
-char end_str[] = "\n \
-</table> \n \
-<tt></tt> \n \
-</body> \n \
-</html> \n \
-";
-
-main(int argc, char **argv)
-{
-	float n1, n2, ratio;
-	char *p, *p1, *p2;
-	char line0[100];
-	char line1[100];
-	char line2[100];
-	char line3[100];
-	char out_line[100];
-	char html_line[500];
-	int i, k;
-
-	if (argc < 3) {
-		printf("\nUsage: mongo_compare file1 file2 res_file\n\n");
-		printf
-		    ("\t<file1> should contain reiserfs or ext2 results of mogo benchmark\n");
-		printf
-		    ("\t<file2> should contain reiserfs or ext2 results of mogo benchmark\n");
-		printf("\tMongo results   will be compared\n");
-		printf
-		    ("\t<res_file.txt>  will be contain results in the text form\n");
-		printf
-		    ("\t<res_file.html> will be contain results in the html form\n");
-		exit(0);
-	}
-
-	strcpy(out1, argv[3]);
-	strcat(out1, ".txt");
-
-	strcpy(out2, argv[3]);
-	strcat(out2, ".html");
-
-	if ((f1 = fopen(argv[1], "r")) == NULL) {
-		fprintf(stderr, "%s: can't open %s\n", argv[0], argv[1]);
-		return 1;
-	}
-
-	if ((f2 = fopen(argv[2], "r")) == NULL) {
-		fprintf(stderr, "%s: can't open %s\n", argv[0], argv[2]);
-		return 1;
-	}
-
-	if ((f3 = fopen(out1, "wr")) == NULL) {
-		fprintf(stderr, "%s: can't open %s\n", argv[0], out1);
-		return 1;
-	}
-
-	if ((f4 = fopen(out2, "wr")) == NULL) {
-		fprintf(stderr, "%s: can't open %s\n", argv[0], out2);
-		return 1;
-	}
-
-	write_html_head(f4);
-	i = 0;
-	while (fgets(line1, 100, f1)) {
-		fgets(line2, 100, f2);
-
-		if (p = strstr(line1, "\n"))
-			*(p + 1) = 0;
-		if (p = strstr(line2, "\n"))
-			*(p + 1) = 0;
-
-		strcpy(line3, line1);
-		line3[strlen(line3) - 1] = 0;
-
-		while (strlen(line3) < 40) {
-			strcat(line3, " ");
-		}
-
-		if (strstr(line3, "MONGO_")) {
-			fprintf(f4, "</table>\n<table BORDER NOSAVE >\n");
-			fprintf(f4, "<tr BGCOLOR=\"#CCFFFF\" NOSAVE>");
-			fprintf(f4, "<td NOSAVE>\n");
-			i = 0;
-		}
-		if (i < 20)
-			strcpy(tmp_str[i], line2);
-
-		if (strstr(line3, "FSYS=")) {
-			fprintf(f4, "</td><td>\n");
-			for (k = 0; k < i; k++) {
-				fprintf(f4, "<tt>%s</tt><br>\n", tmp_str[k]);
-			}
-			fprintf(f4,
-				"</td>\n <tr BGCOLOR=\"#CCFFFF\" NOSAVE><td COLSPAN=\"2\"><tt><B> %s %s </B></tt>\n",
-				line3, line2);
-			i = 20;
-		} else if (NULL == strstr(line3, " :")) {
-
-			if (strstr(line3, "(time"))
-				fprintf(f4,
-					"<br><tt><center>%s</center></tt>\n",
-					line3);
-			else {
-				k = 0;
-				p = line3;
-				while (*p++ != 0) {
-					if (*p != ' ' && *p != '\n')
-						k++;
-				}
-				if (k > 0) {
-					fprintf(f4, "<tt>%s</tt><br>\n", line3);
-					if (i < 20)
-						i++;
-				}
-			}
-		}
-
-		else if (strstr(line3, "Create"))
-			fprintf(f4, "</td>\n");
-
-		line2[strlen(line2) - 1] = 0;
-		while (strlen(line2) < 40) {
-			strcat(line2, " ");
-		}
-
-		strcat(line3, line2);
-
-		strcpy(out_line, line3);
-		strcat(out_line, "\n");
-		name_str1[0] = 0;
-
-		if (p1 = strstr(line1, " :")) {
-			strcpy(time_str1, p1 + 2);
-			strncpy(name_str1, line1, p1 - line1);
-
-			if (p2 = strstr(line2, " :")) {
-				strcpy(time_str2, p2 + 2);
-
-				time_str1[strlen(time_str1) - 1] = 0;
-				time_str2[strlen(time_str2) - 1] = 0;
-
-				sscanf(time_str1, "%f", &n1);
-				sscanf(time_str2, "%f", &n2);
-
-				ratio = n1 / n2;
-				sprintf(out_line, "%s : %6.2f / %6.2f = %.2f\n",
-					name_str1, n1, n2, ratio);
-
-				fprintf(f4,
-					"<tr><td><tt> %s &nbsp </tt></td> <td><div align=right><tt> %6.2f / %6.2f = %.2f &nbsp </tt></div></td></tr>\n",
-					name_str1, n1, n2, ratio);
-
-			}
-		}
-
-		fprintf(f3, "%s", out_line);
-		line1[0] = 0;
-		line2[0] = 0;
-		line3[0] = 0;
-		out_line[0] = 0;
-	}
-
-	write_html_end(f4);
-
-	fclose(f1);
-	fclose(f2);
-
-	fclose(f3);
-	fclose(f4);
-
-	fflush(f3);
-	fflush(f4);
-}
-
-/*******************************************/
-void write_html_head(FILE * fp)
-{
-	fprintf(fp, "%s", head_str);
-}
-
-/*******************************************/
-void write_html_end(FILE * fp)
-{
-	fprintf(fp, "%s", end_str);
-}
diff --git a/testcases/kernel/fs/mongo/mongo_read.c b/testcases/kernel/fs/mongo/mongo_read.c
deleted file mode 100644
index 927b92a13..000000000
--- a/testcases/kernel/fs/mongo/mongo_read.c
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
- */
-
-/*
- * MONGO READ  - simple possible program to read a number of given files
- *               suitable for benchmarking FS read performance
- */
-
-#include <stdio.h>
-#include <errno.h>
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <stdlib.h>
-#include <unistd.h>
-
-int main(int argc, char **argv)
-{
-	int fd, rd, i;
-	char *buf;
-	int bufsize = 4096;
-
-	if (argc < 2) {
-		printf("\nUsage: %s filename [,filename2 [,...] ] ]\n\n",
-		       argv[0]);
-		return 0;
-	}
-
-	buf = malloc(bufsize);
-	if (buf == 0) {
-		printf("Malloc failed on %d\n", bufsize);
-		return 0;
-	}
-
-	/* Read all given files */
-	for (i = 1; i < argc; i++) {
-
-		/* open the file */
-		fd = open(argv[i], O_RDONLY);
-		if (fd == -1) {
-			printf("Open failed (%s)\n", strerror(errno));
-			return 0;
-		}
-
-		/* read the file */
-		while ((rd = read(fd, buf, bufsize)) == bufsize) ;
-		if (rd == -1) {
-			printf("Read failed (%s)\n", strerror(errno));
-			return 0;
-		}
-		close(fd);
-	}
-
-	free(buf);
-	return 0;
-}
diff --git a/testcases/kernel/fs/mongo/mongo_slinks.c b/testcases/kernel/fs/mongo/mongo_slinks.c
deleted file mode 100644
index 6bd1e2b69..000000000
--- a/testcases/kernel/fs/mongo/mongo_slinks.c
+++ /dev/null
@@ -1,98 +0,0 @@
-//
-//  A simple symlink test
-//
-
-#define _GNU_SOURCE
-
-#include <sys/stat.h>
-#include <unistd.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <stdio.h>
-#include <string.h>
-
-//
-// Creates symlink [new-path] to [old-path], checks it,
-// returnes  0 - if everything looks fine and
-//  1 - otherwise.
-// mongo_slinks reads arguments from stdin.
-
-int main(int argc, char *argv[])
-{
-	char *old_path;
-	char *new_path;
-
-	struct stat statbuf;
-
-	int num;
-	char *buffer = NULL;
-	char *line_buffer = NULL;
-	size_t line_buffer_size = 0;
-	int size = 1;
-
-	if ((buffer = malloc(size + 1)) == NULL) {
-		perror("checklink: malloc failed");
-		return 1;
-	}
-
-	while (getline(&line_buffer, &line_buffer_size, stdin) != -1) {
-
-		old_path = strtok(line_buffer, "\t ");
-		new_path = strtok(NULL, "\t\n ");
-
-		if (!old_path || !new_path)	/* empty lines at the end of file */
-			break;
-
-		// Create symlink
-		if (symlink(old_path, new_path) != 0) {
-			perror("checklink : symlink failed ");
-			return 1;
-		}
-		// stat data of symlink itself
-		if (lstat(new_path, &statbuf) == -1) {
-			perror("checklink: lstat failed");
-			return 1;
-		}
-
-		if (!(S_ISLNK(statbuf.st_mode))) {
-			printf("checklink : file %s is not a symbol link\n",
-			       new_path);
-			return 1;
-		}
-		// Test readlink
-		//
-		// Increase size of buffer to readlink untile whole symlink body will be read.
-		// Check readlink result on every iteration.
-
-		while (1) {
-			memset(buffer, 0, size + 1);
-			num = readlink(new_path, buffer, size);
-			if (num < 1 || num > size) {
-				perror("checklink: readlink failed");
-				free(buffer);
-				return 1;
-			}
-			// Make sure that readlink did not break things
-			if (buffer[num] != 0) {
-				printf
-				    ("checklink : readlink corrupts memory\n");
-				free(buffer);
-				return 1;
-			}
-			// Whole expected symlink body is read
-			if (num < size)
-				break;
-
-			// Only part of symlink body was read. So we  make a bigger buffer
-			// and call `readlink' again.
-			size *= 2;
-			if ((buffer = realloc(buffer, size + 1)) == NULL) {
-				perror("checklink: realloc failed");
-				return 1;
-			}
-		}
-	}
-	free(buffer);
-	free(line_buffer);
-	return 0;
-}
diff --git a/testcases/kernel/fs/mongo/reiser_fract_tree.c b/testcases/kernel/fs/mongo/reiser_fract_tree.c
deleted file mode 100644
index af2fa46a7..000000000
--- a/testcases/kernel/fs/mongo/reiser_fract_tree.c
+++ /dev/null
@@ -1,502 +0,0 @@
-/*
- * Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
- */
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-#include <math.h>
-#include <sys/types.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
-char tdir[256];
-char path[256];
-long stats = 0;
-
-void print_usage()
-{
-	printf("
-This program creates files in a tree of random depth and branching. Files vary
-in size randomly according to a distribution function which seems to model real
-file systems.  This distribution function has a median size of median_file_size
-(Median file size is hypothesized to be proportional to the average per file
-space wastage. Notice how that implies that with a more efficient file system
-file size usage patterns will in the long term move to a lower median file
-size), and a maximum size of max_file_size.  Directories vary in size according
-to the same distribution function but with separate parameters to control median
-and maximum size for the number of files within them, and the number of
-subdirectories within them.  This program prunes some empty subdirectories in a
-way that causes parents of leaf directories to branch less than
-median_dir_branching.
-
- To avoid having one large file distort the results such that you have
-to benchmark many times set max_file_size to not more than
-bytes_to_consume/10.  If maximum/median is a small integer, then
-randomness is very poor.  This is a bug, Nikita, please find some
-clever way to fix it.  If it is 0, then the program crashes....
-
-For isolating performance consequences of design variations on
-particular file or directory size ranges, try setting their median size and
-max_size to both equal the max size of the file size range you want
-to test.
-
-To avoid having one large file distort the results set max_file_size to
-not more than bytes_to_consume/10.  Using a distribution function for
-the sizes of writes would be a natural next step in developing this program.\n\n");
-
-	printf
-	    ("Usage: reiser_fract_tree bytes_to_consume median_file_size max_file_size median_dir_nr_files max_directory_nr_files median_dir_branching max_dir_branching write_buffer_size /testfs_mount_point print_stats_flag\n\n");
-}
-
-/* #define DEBUG */
-
-char *write_buffer;		/* buffer from which we write */
-int write_buffer_size = 0;	/* gets reset to an argv  */
-static int already_whined = 0;	/* keep out of disk space errors from being
-				   endless by tracking whether we already
-				   printed the message */
-long bytes_to_consume = 0;	/* create files until their total number of
-				   bytes exceeds this number, but not by more
-				   than 1/10th */
-long byte_total = 0;		/* bytes created so far */
-
-/* statistics on sizes of files we attempted to create */
-int fsz_0_100 = 0;
-int fsz_100_1k = 0;
-int fsz_1k_10k = 0;
-int fsz_10k_100k = 0;
-int fsz_100k_1m = 0;
-int fsz_1m_10m = 0;
-int fsz_10m_larger = 0;
-
-void chngdir(char *name)
-{
-	int i;
-
-	if (name[0] == '.' && name[1] == '.') {
-		for (i = strlen(path); i > 0; i--) {
-			if (path[i] == '/') {
-				path[i] = 0;
-				break;
-			}
-		}
-	} else {
-		strcat(path, "/");
-		strcat(path, name);
-	}
-}
-
-/* this is the core statistical distribution function, and it is used for file
-   sizes, directory sizes, etc. */
-int determine_size(double median_size,
-		   double max_size /* The maximal value of size */ )
-{
-	/* when x is half of its random range (max_size/median_size), result is
-	   median_size */
-	int nr_random, granularity_reducer;
-	double size, double_nr_random;
-
-	/* it is a feature for us that this repeats identically every time it is run,
-	   as otherwise meaningless variances would affect our results and require us
-	   to use a higher number of benchmarks to achieve low noise results.  */
-	nr_random = rand();
-	median_size++;		/* avoids divide by zero errors */
-
-	/* this code does poorly when max_size is not a lot more than median size,
-	   and that needs fixing */
-
-	/* THE NEXT 2 LINES ARE THE HEART OF THE PROGRAM */
-
-	/* keep x below the value that when multiplied by median size on the next
-	   line will equal max_size */
-	/* the granularity_reducer is to handle the case where max_size is near
-	   median_size, since '%' can only take ints, we need this complicated what
-	   of handling that for small values of max_size/median_size by making
-	   large ints out of small ints temporarily.  */
-	if (max_size / median_size < 1024)
-		granularity_reducer = 1024 * 1024;
-	else
-		granularity_reducer = 1;
-	nr_random =
-	    nr_random %
-	    ((int)
-	     (granularity_reducer *
-	      (((double)max_size) / ((double)median_size))));
-	double_nr_random = ((double)nr_random) / (granularity_reducer);
-	size =
-	    median_size * (1 /
-			   (1 -
-			    (double_nr_random) / (((double)max_size) /
-						  ((double)median_size))) - 1);
-	return ((int)size);
-}
-
-/* generate a unique filename */
-void get_name_by_number(long this_files_number, char *str)
-{
-	sprintf(str, "%lu", this_files_number);
-}
-
-/* make a file of a specified size */
-void make_file(int size)
-{
-	char string[128] = { 0 };
-	char *str = string;
-	char fname[256];
-	int fd = 0;
-	int error;
-	static long this_files_number = 1;
-
-	/* collect statistics about the size of files created, or more precisely, the
-	   size of files that we will attempt to create. */
-	if (size <= 100)
-		fsz_0_100++;
-	else if (size <= 1000)
-		fsz_100_1k++;
-	else if (size <= 10 * 1000)
-		fsz_1k_10k++;
-	else if (size <= 100 * 1000)
-		fsz_10k_100k++;
-	else if (size <= 1000 * 1000)
-		fsz_100k_1m++;
-	else if (size <= 10 * 1000 * 1000)
-		fsz_1m_10m++;
-	else
-		fsz_10m_larger++;
-
-	/* construct a name for the file */
-	get_name_by_number(this_files_number++, str);
-	strcpy(fname, path);
-	strcat(fname, "/");
-	strcat(fname, str);
-
-	/* open the file, and deal with the various errors that can occur */
-
-	if ((fd = open(fname, O_CREAT | O_EXCL | O_RDWR, 0777)) == -1) {
-		if (errno == ENOSPC) {
-			if (!already_whined) {
-				printf
-				    ("reiser-2021A: out of disk (or inodes) space, will keep trying\n");
-				already_whined = 1;	/* we continue other file creation in out of
-							   space conditions */
-			}
-			return;
-		}
-		/*  it is sometimes useful to be able to run this program more than once
-		   inside the same directory, and that means skipping over filenames that
-		   already exist.  Thus we ignore EEXIST, and pay attention to all
-		   else. */
-		if (errno == EEXIST) {	/* just skip existing file */
-			return;
-		}
-		perror("open");
-		exit(errno);
-	}
-	/* write to the file until it is the right size, handling the various error
-	   conditions appropriately */
-
-	while (size > 0) {
-		size -= (error =
-			 write(fd, write_buffer,
-			       (size <
-				write_buffer_size -
-				1) ? size : (write_buffer_size - 1)));
-		if (error == -1) {
-			if (errno == ENOSPC) {
-				if (!already_whined) {
-					printf
-					    ("reiser-2022: out of disk space, will keep trying\n");
-					already_whined = 1;
-				}
-				close(fd);
-				return;
-			}
-			perror("write() failed");
-			exit(errno);
-		}
-	}
-
-	/* close the file */
-	if (close(fd)) {
-		perror("close() failed");
-		exit(errno);
-	}
-}
-
-/* print the statistics on how many files were created of what size */
-
-void print_stats()
-{
-	if (!stats)
-		return;
-
-	printf("\n");
-	printf("File stats: Units are decimal (1k = 1000)\n");
-	printf("files 0-100    : %i\n", fsz_0_100);
-	printf("files 100-1K   : %i\n", fsz_100_1k);
-	printf("files 1K-10K   : %i\n", fsz_1k_10k);
-	printf("files 10K-100K : %i\n", fsz_10k_100k);
-	printf("files 100K-1M  : %i\n", fsz_100k_1m);
-	printf("files 1M-10M    : %i\n", fsz_1m_10m);
-	printf("files 10M-larger    : %i\n", fsz_10m_larger);
-	printf("total bytes written    : %lu\n", byte_total);
-
-}
-
-/* predict the number of files that will be created before max_bytes total
-   length of files is reached */
-long determine_nr_of_files(int median_file_size, double max_file_size,
-			   long bytes_to_consume)
-{
-	long nr_of_files = 0, byte_total = 0;
-
-	/* the next line is not necessary as 1 is the default, it is just cautious
-	   coding */
-	srand(1);
-	while (byte_total < bytes_to_consume) {
-		byte_total += determine_size(median_file_size, max_file_size);
-		nr_of_files++;
-	}
-	/* reset the random number generator so that when we determine_size() of the
-	   files later they will be created with the same "random" sequence used in
-	   this calculation */
-	srand(1);
-#ifdef DEBUG
-	printf("number of files is %d\n", (int)nr_of_files);
-#endif /* DEBUG */
-	fflush(NULL);
-	return nr_of_files;
-}
-
-/* fill the current working directory with nr_files_this_directory number of
-   files*/
-
-void fill_this_directory(long nr_files_this_directory, long median_file_size,
-			 long maximum_size)
-{
-	long size;
-
-#ifdef DEBUG
-	printf("filling with %lu files, ", nr_files_this_directory);
-#endif
-	while (nr_files_this_directory--) {
-		size = determine_size(median_file_size, maximum_size);
-		byte_total += size;
-		make_file(size);
-	}
-}
-
-/* this will unfortunately handle out of disk space by forever trying */
-/* What we should do in out of space situaltion ? I think we must skip this
-   directory and continue files/dirs creation process. Error value (!= 0)
-   indicates that we can't go to this directory. -zam */
-int make_directory(char *dirname)
-{
-	static long this_directory_number = 0;
-
-	strcpy(tdir, path);
-	strcat(tdir, "/");
-	strcat(tdir, dirname);
-
-	if (mkdir(tdir, 0755) == -1) {
-		if (errno == ENOSPC) {
-			if (!already_whined) {
-				printf("reiser-2021: out of disk space, ");
-				already_whined = 1;
-			}
-			return errno;
-		}
-		/*  it is sometimes useful to be able to run this program more than once
-		   inside the same directory, and that means skipping over filenames that
-		   already exist.  Thus we ignore EEXIST, and pay attention to all else. */
-		if (errno != EEXIST) {
-			perror("mkdir");
-			exit(errno);
-		}
-	}
-	sprintf(dirname, "d%lu", this_directory_number++);
-	strcpy(tdir, path);
-	strcat(tdir, "/");
-	strcat(tdir, dirname);
-
-	return 0;
-}
-
-/* assumes we are already chdir'd into a directory that the subtree is rooted
-   at.  Fills the directory with files and subdirectories, cd's into those
-   subdirectories, and recurses upon itself */
-
-void do_subtree(
-		       /* the start and end of the portion of the directory sizes
-		          array which corresponds to the sizes of the directories
-		          composing this subtree */
-		       /* sizes_end minus sizes_start is equal to the number of
-		          directories in this subtree */
-		       long *sizes_start, long *sizes_end,
-		       long median_file_size, long maximum_file_size,
-		       long median_dir_branching, long max_dir_branching)
-{
-	long *p;
-	long *sub_start;
-	long *sub_end;
-	int index_subdirectory_to_add_directory_to;
-	long *dirs_in_subtrees;
-	char *subtree_name;
-	long *sizes_index = sizes_start;
-	char subtree_name_array[128];
-	long this_directory_branching;
-	static long this_directorys_number;
-
-	subtree_name = subtree_name_array;
-	/* fill this directory with its number of files */
-	fill_this_directory(*sizes_index, median_file_size, maximum_file_size);
-	sizes_index++;
-	/* ok, now randomly assign directories (and their number of files) among the
-	   subdirectories that will be created if at least one directory is assigned
-	   to it */
-
-	/* this will cause the random number sequence to not match the one used in
-	   determine_nr_files() I need to accumulate my values in an array
-	   beforehand. I'll code that later.  */
-	/* worry about whether 0 or 1 is a problem value */
-	this_directory_branching =
-	    determine_size(median_dir_branching, max_dir_branching) + 1;
-
-	/* create an array holding the number of directories assigned to each
-	   potential subdirectory */
-	dirs_in_subtrees = calloc(this_directory_branching, sizeof(long));
-	while (sizes_index <= sizes_end) {
-		index_subdirectory_to_add_directory_to =
-		    (rand() % this_directory_branching);
-		(*
-		 (dirs_in_subtrees + index_subdirectory_to_add_directory_to))++;
-		sizes_index++;
-	}
-	/* the +1 is for the fill_directory() we did above */
-	sizes_index = sizes_start + 1;
-
-	/* go through each potential subdirectory, and if at least one directory has
-	   been assigned to it, create it and recurse */
-	for (p = dirs_in_subtrees;
-	     p < (dirs_in_subtrees + this_directory_branching); p++) {
-		if (*p) {
-			int nocd;
-			sprintf(subtree_name, "d%lu", this_directorys_number++);
-			nocd = make_directory(subtree_name);
-			/* if make_dir.. may fails (in out of space situation), we continue
-			   creation process in same dir */
-			if (!nocd)
-				chngdir(subtree_name);
-			sub_start = sizes_index;
-			/* the minus one is because *p is the number of elements and arrays start at 0 */
-			sub_end = (sizes_index + (*p - 1));
-
-#ifdef DEBUG
-			/* comment this back in if the array logic has you going cross-eyed */
-			/*      printf ("sizes_start is %p, sizes_index is %p, sizes_index+p is %p, sizes_end is %p\n", sizes_start, sub_start, sub_end, sizes_end); */
-#endif
-			do_subtree(sub_start, sub_end, median_file_size,
-				   maximum_file_size, median_dir_branching,
-				   max_dir_branching);
-			if (!nocd)
-				chngdir("..");
-		}
-		sizes_index += *p;
-	}
-}
-
-/* We have already determined that nr_files can fit in bytes_to_consume space.
-   Fill the sizes array with the number of files to be in each directory, and
-   then call do_subtree to fill the tree with files and directories.  */
-
-void make_fractal_tree(long median_file_size, long maximum_file_size,
-		       long median_dir_nr_files, long max_dir_nr_files,
-		       long median_dir_branching, long max_dir_branching,
-		       long nr_files)
-{
-	long *sizes_start;
-	long *sizes_end;
-	long *sizes_index;
-	long remaining_files = nr_files;
-
-	/* collect together array of directory sizes for whole filesystem.  This
-	   cannot easily be done recursively without distorting the directory sizes
-	   and making deeper directories smaller.  Send me the code if you
-	   disagree.:-) */
-	/* we almost certainly don't need this much space, but so what.... */
-	sizes_index = sizes_start = malloc(nr_files * sizeof(long));
-	for (; remaining_files > 0;) {
-		*sizes_index =
-		    determine_size(median_dir_nr_files, max_dir_nr_files);
-		// we alloc space for nr_files, so we should avoid
-		// number of files in directory = 0 -grev.
-		if (*sizes_index == 0)
-			*sizes_index = 1;
-		*sizes_index =
-		    (*sizes_index <
-		     remaining_files) ? *sizes_index : remaining_files;
-
-#ifdef DEBUG
-		printf("*sizes_index == %lu, ", *sizes_index);
-#endif
-		remaining_files -= *sizes_index;
-		sizes_index++;
-	}
-	/* don't decrement below sizes_start if nr_files is 0 */
-	sizes_end = (sizes_index-- > sizes_start) ? sizes_index : sizes_start;
-
-	sizes_index = sizes_start;
-	srand(1);
-	do_subtree(sizes_start, sizes_end, median_file_size, maximum_file_size,
-		   median_dir_branching, max_dir_branching);
-
-}
-
-int main(int argc, char *argv[])
-{
-	/* initialized from argv[] */
-	long median_file_size,
-	    median_dir_branching,
-	    median_dir_nr_files,
-	    max_dir_nr_files, max_dir_branching, max_file_size;
-	long nr_of_files = 0;	/* files to be created */
-
-	if (argc != 11) {
-		print_usage();
-		exit(1);
-	}
-
-	write_buffer_size = atoi(argv[8]);
-	write_buffer = malloc(write_buffer_size);
-	memset(write_buffer, 'a', write_buffer_size);
-
-	/* the number of bytes that we desire this tree to consume.  It will actually
-	   consume more, because the last file will overshoot by a random amount, and
-	   because the directories and metadata will consume space.  */
-	bytes_to_consume = atol(argv[1]);
-	max_file_size = atol(argv[3]);
-	median_file_size = atol(argv[2]);
-	/* Figure out how many random files will fit into bytes_to_consume bytes. We
-	   depend on resetting rand() to get the same result later. */
-	nr_of_files =
-	    determine_nr_of_files(median_file_size, max_file_size,
-				  bytes_to_consume);
-
-	strcpy(path, argv[9]);
-	mkdir(path, 0755);
-	stats = atol(argv[10]);
-	median_dir_branching = atol(argv[6]);
-	max_dir_branching = atol(argv[7]);
-	median_dir_nr_files = atol(argv[4]);
-	max_dir_nr_files = atol(argv[5]);
-	make_fractal_tree(median_file_size, max_file_size, median_dir_nr_files,
-			  max_dir_nr_files, median_dir_branching,
-			  max_dir_branching, nr_of_files);
-	print_stats();
-	if (stats)
-		printf("\nreiser_fract_tree finished\n");
-
-	return 0;
-}
diff --git a/testcases/kernel/fs/mongo/run_mongo b/testcases/kernel/fs/mongo/run_mongo
deleted file mode 100755
index e22e2b9a8..000000000
--- a/testcases/kernel/fs/mongo/run_mongo
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/bash
-#
-# Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
-#
-if [ $# -lt 2 ]
-then
-   echo
-   echo "Usage : run_mogo <device> <processes>"
-   echo
-   echo "Example :"
-   echo "# run_mogo /dev/hdx1 2"
-   echo
-   exit
-fi
-
-DEVICE=$1
-NPROC=$2
-
-y="Yes"
-echo "WARNING : All data will be erased on device=$DEVICE "
-echo "Run ? (Yes | no)"
-read x
-
-if [ -z $x ]
-then
-  exit
-fi
-
-if ! [ $x = $y ]
-then
-   exit
-fi
-
-./mongo.pl reiserfs $DEVICE /testfs reiserfs $NPROC
-./mongo.pl ext2     $DEVICE /testfs ext2    $NPROC
-./mongo_compare  ./results/ext2.tbl ./results/reiserfs.tbl ./results/html/ext2_vs_reiserfs
diff --git a/testcases/kernel/fs/mongo/summ.c b/testcases/kernel/fs/mongo/summ.c
deleted file mode 100644
index c5712a4e3..000000000
--- a/testcases/kernel/fs/mongo/summ.c
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Copyright 2000 by Hans Reiser, licensing governed by reiserfs/README
- */
-
-#include <stdio.h>
-#include <stdlib.h>
-char str[100];
-
-int main(int argc, char **argv)
-{
-	char c, *p;
-	int sum = 0, n = 0;
-
-	p = str;
-	while ((c = getchar()) != EOF) {
-		if (c != '\n') {
-			*p++ = c;
-		} else {
-			*p = '\0';
-			n = atol(str);
-			sum += n;
-			printf("%i\n", sum);
-			p = str;
-			*p = '\0';
-		}
-	}
-}
diff --git a/testcases/kernel/fs/mongo/test.sh b/testcases/kernel/fs/mongo/test.sh
deleted file mode 100755
index 5ec4e3139..000000000
--- a/testcases/kernel/fs/mongo/test.sh
+++ /dev/null
@@ -1,109 +0,0 @@
-#!/bin/sh
-#To exectute this you need mongo filesystem utility.
-#Run this inside the mongo directory.
-#mongo utility can be found in www.namesys.com/benchmarks/mongo-xxx.tgz
-#Description-this script tests the mongo utility which actulally give the time ie cpu time
-#Real time etc on reiserfile system and jfs filesystem.
-#created by prakash.banu@wipro.com
-#
-#   This program is free software;  you can redistribute it and/or modify
-#   it under the terms of the GNU General Public License as published by
-#   the Free Software Foundation; either version 2 of the License, or
-#   (at your option) any later version.
-#
-#   This program is distributed in the hope that it will be useful,
-#   but WITHOUT ANY WARRANTY;  without even the implied warranty of
-#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
-#   the GNU General Public License for more details.
-#
-#   You should have received a copy of the GNU General Public License
-#   along with this program;  if not, write to the Free Software
-#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-#
-
-LOG_DIR=$PWD
-TEST_DIR=testdir
-
-
-   		#should be root  to execute this script .
-	if [ $(id -ru) -ne 0 ]; then
-		echo "This script must be run as root"
-		exit
-	fi
-		#set the PATH variable if its not done .
-export PATH=$PATH:/sbin
-lsmod |grep reiserfs
-
-	if [ $? -ne 0 ]; then
-		echo "inserting reiserfs and its dependencies"
-	fi
-modprobe reiserfs
-	if [ $? -ne 0 ]; then
-		echo "check wheather reiserfs  is been compiled in the kernel"
-	fi
-
-lsmod |grep loop
-	if [ $? -ne 0 ]; then
-		echo "inserting loopback device module"
-	fi
-modprobe loop
-	if [ $? -ne 0 ]; then
-		echo "check wheather loopback device option is been compiled in the kernel"
-	fi
-
-	#run the mongo test on reiserfs file system type
-reiserfs()
-{
-cat > fs.sh <<EOF
-echo "performing mongo on reiserfs"
-dd if=/dev/zero of=reiserfs  bs=8k count=10240 > /dev/null 2>&1
-losetup /dev/loop0 reiserfs
-mkdir -p $TEST_DIR
-./mongo.pl LOG=/tmp/logfile1 file_size=10000 bytes=100000 fstype=reiserfs dev=/dev/loop0 dir=$TEST_DIR RUN   log=$LOG_DIR/reiserlog > /dev/null 2>&1
-
-echo "RESULTS LOGGED IN $LOG_DIR/reiserlog"
-export PATH=$PATH:/sbin
-losetup -d /dev/loop0
-
-EOF
-}
-
-
-#To run on jfs file system type
-JFS()
-{
-cat >> fs.sh <<EOF
-echo "performing mongo on jfs file system"
-mkdir -p $TEST_DIR
-dd if=/dev/zero of=jfs  bs=8k count=10240 > /dev/null 2>&1
-losetup /dev/loop0 jfs
-./mongo.pl LOG=/tmp/logfile1 file_size=10000 bytes=100000 fstype=jfs dev=/dev/loop0 dir=$TEST_DIR   RUN log=$LOG_DIR/jfslog
-
-echo "RESULTS LOGGED IN $LOG_DIR/jfslog"
-export PATH=$PATH:/sbin
-losetup -d /dev/loop0
-echo "rm -rf ./fs.sh" >> ./fs.sh 2>&1
-EOF
-}
-
-
-echo -ne "TEST ON REISERFS?[y/N]:"
-read ker
-
-case $ker in
-y|Y)     reiserfs
-esac
-
-echo -ne "TEST ON JFS[y/N]: "
-read ker
-
-case $ker in
-y|Y)     JFS
-esac
-
-echo "THIS MAY TAKE SOME MINUTES"
-sh fs.sh
-
-#performing cleanup
-#losetup -d /dev/loop0
-rm -rf $TEST_DIR
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
