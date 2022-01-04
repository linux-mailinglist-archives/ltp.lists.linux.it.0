Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B777483D04
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 08:38:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0126C3C9029
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 08:38:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A396C3C8FE2
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 08:38:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2C3A91400F92
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 08:38:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C9DB8212BA;
 Tue,  4 Jan 2022 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1641281883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkXdfSZDtBA0Qlq4Iv34sJcZV7zkRuoCtZeRRFvvt+A=;
 b=ZzhYxh6+uT/Jo4BmzY6L/wRjotYwjDIRAeKKUL1Rka1WjES/UL21og5w0dl4+Zrk3Y1C7P
 BzWx7Si3oBsdcI10CM6fGUQG2fgzJkWrQCGIli2yAVH2FtnrXURuBN2K8q4x3IdNkkfV9s
 N28Egl9sWUDTa7PplCENcfIycOqwxH4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8174913AB2;
 Tue,  4 Jan 2022 07:38:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJihGlv502FMVgAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 04 Jan 2022 07:38:03 +0000
To: ltp@lists.linux.it
Date: Tue,  4 Jan 2022 08:37:54 +0100
Message-Id: <20220104073754.721-3-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104073754.721-1-andrea.cervesato@suse.com>
References: <20220104073754.721-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] Update ltp-aio-stress suites using new options
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/ltp-aio-stress.part1 | 147 +++++++++++++++++------------------
 runtest/ltp-aio-stress.part2 |  65 +++++++---------
 2 files changed, 101 insertions(+), 111 deletions(-)

diff --git a/runtest/ltp-aio-stress.part1 b/runtest/ltp-aio-stress.part1
index a770a40ae..656e71872 100644
--- a/runtest/ltp-aio-stress.part1
+++ b/runtest/ltp-aio-stress.part1
@@ -1,79 +1,74 @@
 #DESCRIPTION:ltp A-sync IO Stress IO tests
 #
-# aio-stress [-s size] [-r size] [-a size] [-d num] [-b num]
-#                 [-i num] [-t num] [-c num] [-C size] [-nxhlvOS ]
-#                 file1 [file2 ...]
-#       -a size in KB at which to align buffers
-#       -b max number of iocbs to give io_submit at once
-#       -c number of io contexts per file
-#       -C offset between contexts, default 2MB
-#       -s size in MB of the test file(s), default 1024MB
-#       -r record size in KB used for each io, default 64KB
-#       -d number of pending aio requests for each file, default 64
-#       -i number of ios per file sent before switching
-#          to the next file, default 8
-#       -O Use O_DIRECT (not available in 2.4 kernels),
-#       -S Use O_SYNC for writes
-#       -o add an operation to the list: write=0, read=1,
-#          random write=2, random read=3.
-#          repeat -o to specify multiple ops: -o 0 -o 1 etc.
-#       -m shm use ipc shared memory for io buffers instead of malloc
-#       -m shmfs mmap a file in /dev/shm for io buffers
-#       -n no fsyncs between write stage and read stage
-#       -l print io_submit latencies after each stage
-#       -t number of threads to run
-#       -v verification of bytes written
-#       -x turn off thread stonewalling
-#       -h this message
+# -f       Number of files to generate
+# -b       Max number of iocbs to give io_submit at once
+# -c       Number of io contexts per file
+# -g       Offset between contexts (default 2M)
+# -s       Size in MB of the test file(s) (default 1024M)
+# -r       Record size in KB used for each io (default 64K)
+# -d       Number of pending aio requests for each file (default 64)
+# -e       Number of I/O per file sent before switching to the next file (default 8)
+# -a       Total number of ayncs I/O the program will run, default is run until Cntl-C
+# -O       Use O_DIRECT (not available in 2.4 kernels)
+# -S       Use O_SYNC for writes
+# -o       Add an operation to the list: write=0, read=1, random write=2, random read=3
+# -m       SHM use ipc shared memory for io buffers instead of malloc
+# -n       No fsyncs between write stage and read stage
+# -l       Print io_submit latencies after each stage
+# -L       Print io completion latencies after each stage
+# -t       Number of threads to run
+# -u       Unlink files after completion
+# -v       Verification of bytes written
+# -x       Turn off thread stonewalling
 #
-ADS1000 aio-stress -I500  -o2 -S -r4   $TMPDIR/file1
-ADS1001 aio-stress -I500  -o2 -S -r8   $TMPDIR/file1
-ADS1002 aio-stress -I500  -o2 -S -r16  $TMPDIR/file1
-ADS1003 aio-stress -I500  -o2 -S -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1004 aio-stress -I500  -o2 -S -r64   $TMPDIR/junkfile $TMPDIR/file2
-ADS1005 aio-stress -I500  -o3 -S -r4    $TMPDIR/junkfile $TMPDIR/file2
-ADS1006 aio-stress -I500  -o3 -S -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1007 aio-stress -I500  -o3 -S -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1008 aio-stress -I500  -o3 -S -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1009 aio-stress -I500  -o3 -S -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1010 aio-stress -I500  -o3 -S -r128 -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1011 aio-stress -I500  -o3 -S -r256 -t8  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1012 aio-stress -I500  -o3 -S -r512 -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1013 aio-stress -I500  -o2 -O -r4    -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1014 aio-stress -I500  -o2 -O -r8         $TMPDIR/file1 $TMPDIR/file2
-ADS1015 aio-stress -I500  -o2 -O -r16        $TMPDIR/file1 $TMPDIR/file2
-ADS1016 aio-stress -I500  -o2 -O -r32   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1017 aio-stress -I500  -o2 -O -r64   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1018 aio-stress -I500  -o3 -O -r4    -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1019 aio-stress -I500  -o3 -O -r8    -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1020 aio-stress -I500  -o3 -O -r16   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1021 aio-stress -I500  -o3 -O -r32   -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1022 aio-stress -I500  -o3 -O -r64   -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1023 aio-stress -I500  -o3 -O -r128  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1024 aio-stress -I500  -o3 -O -r256  -t8  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1025 aio-stress -I500  -o3 -O -r512  -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1026 aio-stress -I500  -o0 -S -r4    -t8  $TMPDIR/junkfile $TMPDIR/file2       $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1027 aio-stress -I500  -o0 -S -r8           $TMPDIR/file2
-ADS1028 aio-stress -I500  -o0 -S -r16          $TMPDIR/file2
-ADS1029 aio-stress -I500  -o0 -S -r32   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1030 aio-stress -I500  -o0 -S -r64   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1031 aio-stress -I500  -o1 -S -r4    -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1032 aio-stress -I500  -o1 -S -r8    -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1033 aio-stress -I500  -o1 -S -r16   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1034 aio-stress -I500  -o1 -S -r32   -t4    $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1035 aio-stress -I500  -o1 -S -r64   -t4    $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1036 aio-stress -I500  -o1 -S -r128  -t4    $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1037 aio-stress -I500  -o1 -S -r256  -t8  $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1038 aio-stress -I500  -o1 -S -r512  -t8  -x $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1039 aio-stress -I500  -o1 -O -r4    -t8  -x  $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1040 aio-stress -I500  -o1 -O -r8    -t2  -x $TMPDIR/junkfile $TMPDIR/file2
-ADS1041 aio-stress -I500  -o1 -O -r16   -t2  -x  $TMPDIR/junkfile $TMPDIR/file2
-ADS1042 aio-stress -I500  -o1 -O -r32   -t2   $TMPDIR/junkfile $TMPDIR/file2
-ADS1043 aio-stress -I500  -o1 -O -r64   -t2   $TMPDIR/junkfile $TMPDIR/file2
-ADS1044 aio-stress -I500  -o1 -O -r4    -t4   $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8
-ADS1045 aio-stress -I500  -o1 -O -r8    -t4   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1046 aio-stress -I500  -o1 -O -r16   -t4   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1047 aio-stress -I500  -o1 -O -r32   -t8   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1048 aio-stress -I500  -o1 -O -r64   -t8   $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1049 aio-stress -I500  -o1 -O -r128  -t8   $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1050 aio-stress -I500  -o1 -O -r256  -t2   $TMPDIR/junkfile $TMPDIR/file2
+ADS1000 aio-stress -a500  -o2 -S -r4 -f1
+ADS1001 aio-stress -a500  -o2 -S -r8 -f1
+ADS1002 aio-stress -a500  -o2 -S -r16 -f1
+ADS1003 aio-stress -a500  -o2 -S -r32 -t2 -f2
+ADS1004 aio-stress -a500  -o2 -S -r64 -f2
+ADS1005 aio-stress -a500  -o3 -S -r4 -f2
+ADS1006 aio-stress -a500  -o3 -S -r8 -f2
+ADS1007 aio-stress -a500  -o3 -S -r16 -f2
+ADS1008 aio-stress -a500  -o3 -S -r32 -f4
+ADS1009 aio-stress -a500  -o3 -S -r64 -t4 -f4
+ADS1010 aio-stress -a500  -o3 -S -r128 -t4 -f4
+ADS1011 aio-stress -a500  -o3 -S -r256 -t8 -f8
+ADS1012 aio-stress -a500  -o3 -S -r512 -t8 -f8
+ADS1013 aio-stress -a500  -o2 -O -r4 -t8 -f8
+ADS1014 aio-stress -a500  -o2 -O -r8 -f2
+ADS1015 aio-stress -a500  -o2 -O -r16 -f2
+ADS1016 aio-stress -a500  -o2 -O -r32 -t2 -f2
+ADS1017 aio-stress -a500  -o2 -O -r64 -t2 -f2
+ADS1018 aio-stress -a500  -o3 -O -r4 -t2 -f2
+ADS1019 aio-stress -a500  -o3 -O -r8 -t2 -f2
+ADS1020 aio-stress -a500  -o3 -O -r16 -t2 -f2
+ADS1021 aio-stress -a500  -o3 -O -r32 -t4 -f4
+ADS1022 aio-stress -a500  -o3 -O -r64 -t4 -f4
+ADS1023 aio-stress -a500  -o3 -O -r128 -t4 -f4
+ADS1024 aio-stress -a500  -o3 -O -r256 -t8 -f8
+ADS1025 aio-stress -a500  -o3 -O -r512 -t8 -f8
+ADS1026 aio-stress -a500  -o0 -S -r4 -t8 -f8
+ADS1027 aio-stress -a500  -o0 -S -r8 -f1
+ADS1028 aio-stress -a500  -o0 -S -r16 -f1
+ADS1029 aio-stress -a500  -o0 -S -r32 -t2 -f2
+ADS1030 aio-stress -a500  -o0 -S -r64 -t2 -f2
+ADS1031 aio-stress -a500  -o1 -S -r4 -t2 -f1
+ADS1032 aio-stress -a500  -o1 -S -r8 -t2 -f1
+ADS1033 aio-stress -a500  -o1 -S -r16 -t2 -f2
+ADS1034 aio-stress -a500  -o1 -S -r32 -t4 -f4
+ADS1035 aio-stress -a500  -o1 -S -r64 -t4 -f4
+ADS1036 aio-stress -a500  -o1 -S -r128 -t4 -f4
+ADS1037 aio-stress -a500  -o1 -S -r256 -t8 -f8
+ADS1038 aio-stress -a500  -o1 -S -r512 -t8 -f8
+ADS1039 aio-stress -a500  -o1 -O -r4 -t8 -f8
+ADS1040 aio-stress -a500  -o1 -O -r8 -t2 -f2
+ADS1041 aio-stress -a500  -o1 -O -r16 -t2 -f2
+ADS1042 aio-stress -a500  -o1 -O -r32 -t2 -f2
+ADS1043 aio-stress -a500  -o1 -O -r64 -t2 -f2
+ADS1044 aio-stress -a500  -o1 -O -r4 -t4 -f4
+ADS1045 aio-stress -a500  -o1 -O -r8 -t4 -f4
+ADS1046 aio-stress -a500  -o1 -O -r16 -t4 -f4
+ADS1047 aio-stress -a500  -o1 -O -r32 -t8 -f8
+ADS1048 aio-stress -a500  -o1 -O -r64 -t8 -f8
+ADS1049 aio-stress -a500  -o1 -O -r128 -t8 -f8
+ADS1050 aio-stress -a500  -o1 -O -r256 -t2 -f2
diff --git a/runtest/ltp-aio-stress.part2 b/runtest/ltp-aio-stress.part2
index 3a60e23e9..e1b837a39 100644
--- a/runtest/ltp-aio-stress.part2
+++ b/runtest/ltp-aio-stress.part2
@@ -1,38 +1,33 @@
 #DESCRIPTION:ltp A-sync IO Stress IO tests
 #
-# aio-stress [-s size] [-r size] [-a size] [-d num] [-b num]
-#                 [-i num] [-t num] [-c num] [-C size] [-nxhlvOS ]
-#                 file1 [file2 ...]
-#       -a size in KB at which to align buffers
-#       -b max number of iocbs to give io_submit at once
-#       -c number of io contexts per file
-#       -C offset between contexts, default 2MB
-#       -s size in MB of the test file(s), default 1024MB
-#       -r record size in KB used for each io, default 64KB
-#       -d number of pending aio requests for each file, default 64
-#       -i number of ios per file sent before switching
-#          to the next file, default 8
-#       -O Use O_DIRECT (not available in 2.4 kernels),
-#       -S Use O_SYNC for writes
-#       -o add an operation to the list: write=0, read=1,
-#          random write=2, random read=3.
-#          repeat -o to specify multiple ops: -o 0 -o 1 etc.
-#       -m shm use ipc shared memory for io buffers instead of malloc
-#       -m shmfs mmap a file in /dev/shm for io buffers
-#       -n no fsyncs between write stage and read stage
-#       -l print io_submit latencies after each stage
-#       -t number of threads to run
-#       -v verification of bytes written
-#       -x turn off thread stonewalling
-#       -h this message
+# -f       Number of files to generate
+# -b       Max number of iocbs to give io_submit at once
+# -c       Number of io contexts per file
+# -g       Offset between contexts (default 2M)
+# -s       Size in MB of the test file(s) (default 1024M)
+# -r       Record size in KB used for each io (default 64K)
+# -d       Number of pending aio requests for each file (default 64)
+# -e       Number of I/O per file sent before switching to the next file (default 8)
+# -a       Total number of ayncs I/O the program will run, default is run until Cntl-C
+# -O       Use O_DIRECT (not available in 2.4 kernels)
+# -S       Use O_SYNC for writes
+# -o       Add an operation to the list: write=0, read=1, random write=2, random read=3
+# -m       SHM use ipc shared memory for io buffers instead of malloc
+# -n       No fsyncs between write stage and read stage
+# -l       Print io_submit latencies after each stage
+# -L       Print io completion latencies after each stage
+# -t       Number of threads to run
+# -u       Unlink files after completion
+# -v       Verification of bytes written
+# -x       Turn off thread stonewalling
 #
-ADS2001 aio-stress -I500  -o2 -S -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2002 aio-stress -I500  -o3 -S -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2003 aio-stress -I500  -o3 -S -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2004 aio-stress -I500  -o3 -S -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2005 aio-stress -I500  -o3 -S -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2006 aio-stress -I500  -o2 -O -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2007 aio-stress -I500  -o3 -O -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2008 aio-stress -I500  -o3 -O -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2009 aio-stress -I500  -o3 -O -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2010 aio-stress -I500  -o3 -O -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
+ADS2001 aio-stress -a500  -o2 -S -r32  -t2 -f2
+ADS2002 aio-stress -a500  -o3 -S -r8   -t2 -f2
+ADS2003 aio-stress -a500  -o3 -S -r16  -t2 -f2
+ADS2004 aio-stress -a500  -o3 -S -r32  -t4 -f4
+ADS2005 aio-stress -a500  -o3 -S -r64  -t4 -f4
+ADS2006 aio-stress -a500  -o2 -O -r32  -t2 -f2
+ADS2007 aio-stress -a500  -o3 -O -r8   -t2 -f2
+ADS2008 aio-stress -a500  -o3 -O -r16  -t2 -f2
+ADS2009 aio-stress -a500  -o3 -O -r32  -t4 -f4
+ADS2010 aio-stress -a500  -o3 -O -r64  -t4 -f4
-- 
2.34.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
