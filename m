Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C91A63D74E
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 14:56:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D810A3CC520
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 14:56:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9681A3CC50E
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 14:56:28 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CFE64600915
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 14:56:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 838551F8D4;
 Wed, 30 Nov 2022 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1669816586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PC3v8B1NR3qRPLLTTb0Bh++BDwYkQrKpzQMHtpfcr8k=;
 b=fDey3Vwr+HVT5rwWbmJRnaTj8fA+LVymFzUJMPhaoL71WhXolZgSgDqw7TfHjIy6ENy9DK
 /8Lzsmw3rQKtyeuE/GfkGCeWiKK8BxijaArcTY1e1AkLrh/bFhC73hZF/KEQKaEW+RY9te
 Rj1BnVhkVyiaI8xST0L6ebrpVKMJYCM=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B65613A70;
 Wed, 30 Nov 2022 13:56:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oHdHFAphh2PlbQAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Wed, 30 Nov 2022 13:56:26 +0000
To: ltp@lists.linux.it
Date: Wed, 30 Nov 2022 14:54:51 +0100
Message-Id: <20221130135451.28399-3-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221130135451.28399-1-andrea.cervesato@suse.com>
References: <20221130135451.28399-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v10 2/2] Merge ltp-aio-stress part2 with part1
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

ltp-aio-stress.part[12] have been merged due to tests duplication and
new ltp-aio-stress test rewrite that doesn't require $TMPDIR parameter
anymore.

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 runtest/ltp-aio-stress       | 55 +++++++++++++++++++++++++
 runtest/ltp-aio-stress.part1 | 79 ------------------------------------
 runtest/ltp-aio-stress.part2 | 38 -----------------
 3 files changed, 55 insertions(+), 117 deletions(-)
 create mode 100644 runtest/ltp-aio-stress
 delete mode 100644 runtest/ltp-aio-stress.part1
 delete mode 100644 runtest/ltp-aio-stress.part2

diff --git a/runtest/ltp-aio-stress b/runtest/ltp-aio-stress
new file mode 100644
index 000000000..4b0b81ce2
--- /dev/null
+++ b/runtest/ltp-aio-stress
@@ -0,0 +1,55 @@
+# ltp A-sync IO Stress IO tests
+ADS1000 aio-stress -o2 -r4 -f1
+ADS1001 aio-stress -o2 -r8 -f1
+ADS1002 aio-stress -o2 -r16 -f1
+ADS1003 aio-stress -o2 -r32 -t2 -f2
+ADS1004 aio-stress -o2 -r64 -f2
+ADS1005 aio-stress -o3 -r4 -f2
+ADS1006 aio-stress -o3 -r8 -f2
+ADS1007 aio-stress -o3 -r16 -f2
+ADS1008 aio-stress -o3 -r32 -f4
+ADS1009 aio-stress -o3 -r64 -t4 -f4
+ADS1010 aio-stress -o3 -r128 -t4 -f4
+ADS1011 aio-stress -o3 -r256 -t8 -f8
+ADS1012 aio-stress -o3 -r512 -t8 -f8
+ADS1013 aio-stress -o2 -O -r4 -t8 -f8
+ADS1014 aio-stress -o2 -O -r8 -f2
+ADS1015 aio-stress -o2 -O -r16 -f2
+ADS1016 aio-stress -o2 -O -r32 -t2 -f2
+ADS1017 aio-stress -o2 -O -r64 -t2 -f2
+ADS1018 aio-stress -o3 -O -r4 -t2 -f2
+ADS1019 aio-stress -o3 -O -r8 -t2 -f2
+ADS1020 aio-stress -o3 -O -r16 -t2 -f2
+ADS1021 aio-stress -o3 -O -r32 -t4 -f4
+ADS1022 aio-stress -o3 -O -r64 -t4 -f4
+ADS1023 aio-stress -o3 -O -r128 -t4 -f4
+ADS1024 aio-stress -o3 -O -r256 -t8 -f8
+ADS1025 aio-stress -o3 -O -r512 -t8 -f8
+ADS1026 aio-stress -o0 -r4 -t8 -f8
+ADS1027 aio-stress -o0 -r8 -f1
+ADS1028 aio-stress -o0 -r16 -f1
+ADS1029 aio-stress -o0 -r32 -t2 -f2
+ADS1030 aio-stress -o0 -r64 -t2 -f2
+ADS1031 aio-stress -o1 -r4 -t2 -f1
+ADS1032 aio-stress -o1 -r8 -t2 -f1
+ADS1033 aio-stress -o1 -r16 -t2 -f2
+ADS1034 aio-stress -o1 -r32 -t4 -f4
+ADS1035 aio-stress -o1 -r64 -t4 -f4
+ADS1036 aio-stress -o1 -r128 -t4 -f4
+ADS1037 aio-stress -o1 -r256 -t8 -f8
+ADS1038 aio-stress -o1 -r512 -t8 -f8
+ADS1039 aio-stress -o1 -O -r4 -t8 -f8
+ADS1040 aio-stress -o1 -O -r8 -t2 -f2
+ADS1041 aio-stress -o1 -O -r16 -t2 -f2
+ADS1042 aio-stress -o1 -O -r32 -t2 -f2
+ADS1043 aio-stress -o1 -O -r64 -t2 -f2
+ADS1044 aio-stress -o1 -O -r4 -t4 -f4
+ADS1045 aio-stress -o1 -O -r8 -t4 -f4
+ADS1046 aio-stress -o1 -O -r16 -t4 -f4
+ADS1047 aio-stress -o1 -O -r32 -t8 -f8
+ADS1048 aio-stress -o1 -O -r64 -t8 -f8
+ADS1049 aio-stress -o1 -O -r128 -t8 -f8
+ADS1050 aio-stress -o1 -O -r256 -t2 -f2
+ADS1051 aio-stress -o3 -r8 -t2 -f2
+ADS1052 aio-stress -o3 -r16 -t2 -f2
+ADS1053 aio-stress -o3 -r32 -t4 -f4
diff --git a/runtest/ltp-aio-stress.part1 b/runtest/ltp-aio-stress.part1
deleted file mode 100644
index a770a40ae..000000000
--- a/runtest/ltp-aio-stress.part1
+++ /dev/null
@@ -1,79 +0,0 @@
-#DESCRIPTION:ltp A-sync IO Stress IO tests
-#
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
-#
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
diff --git a/runtest/ltp-aio-stress.part2 b/runtest/ltp-aio-stress.part2
deleted file mode 100644
index 3a60e23e9..000000000
--- a/runtest/ltp-aio-stress.part2
+++ /dev/null
@@ -1,38 +0,0 @@
-#DESCRIPTION:ltp A-sync IO Stress IO tests
-#
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
-#
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
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
