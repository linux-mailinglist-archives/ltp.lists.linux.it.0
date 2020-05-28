Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF21E5DDB
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 128C73C31D1
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:06:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 2E6C93C31E5
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 39206232A23
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:06:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DF8EAC6C
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:06:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 28 May 2020 13:05:54 +0200
Message-Id: <20200528110554.10179-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528110554.10179-1-pvorel@suse.cz>
References: <20200528110554.10179-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.5 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 URI_NOVOWEL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 2/2] LVM: Drop legacy scripts and runtest files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

These scripts were unmaintained and there is replacement added in
45289e498 ("Add LVM support scripts").

lvm.part{1,2} are in replaced by lvm.local generated before running,
thus fix better to particular SUT.

ltpfslvm.sh / ltpfsnolvm.sh are replaced by lvmtest.sh.

We lose testing of legacy filesystems: MS-DOS, ReiserFS, Minix, JFS
and ramdisk (not supported by new API).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/ltp-run-files.txt     |   4 +-
 runtest/lvm.part1         | 217 --------------------------------------
 runtest/lvm.part2         |  72 -------------
 testscripts/ltpfslvm.sh   | 200 -----------------------------------
 testscripts/ltpfsnolvm.sh | 150 --------------------------
 5 files changed, 1 insertion(+), 642 deletions(-)
 delete mode 100644 runtest/lvm.part1
 delete mode 100644 runtest/lvm.part2
 delete mode 100755 testscripts/ltpfslvm.sh
 delete mode 100755 testscripts/ltpfsnolvm.sh

diff --git a/doc/ltp-run-files.txt b/doc/ltp-run-files.txt
index c29086987..70ad6c5a0 100644
--- a/doc/ltp-run-files.txt
+++ b/doc/ltp-run-files.txt
@@ -56,9 +56,7 @@ if run network tests flag is passed these additional tests are run
  - nfs
 
 To test filesystem with LVM
-- ltpfslvm.sh
-w/o LVM
-- ltpfsnolvm.sh
+- testscripts/lvmtest.sh
 
 Device Mapper tests
  - ltpdmmapper.sh
diff --git a/runtest/lvm.part1 b/runtest/lvm.part1
deleted file mode 100644
index b2e9c0551..000000000
--- a/runtest/lvm.part1
+++ /dev/null
@@ -1,217 +0,0 @@
-#DESCRIPTION:lvm filesystem tests
-# Check the MSDOS filesystem
-gf102 growfiles -W gf102 -d /test/growfiles/msdos -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf103 growfiles -W gf103 -d /test/growfiles/msdos -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf104 growfiles -W gf104 -d /test/growfiles/msdos -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf105 growfiles -W gf105 -d /test/growfiles/msdos -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf116 growfiles -W gf116 -d /test/growfiles/msdos -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf117 growfiles -W gf117 -d /test/growfiles/msdos -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf118 growfiles -W gf118 -d /test/growfiles/msdos -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf119 growfiles -W gf119 -d /test/growfiles/msdos -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf112 mkfifo /test/growfiles/msdos/gffifo17; growfiles -W gf112 -b -e 1 -u -i 0 -L 30 /test/growfiles/msdos/gffifo17
-gf113 mkfifo /test/growfiles/msdos/gffifo18; growfiles -W gf113 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/msdos/gffifo18
-gf101 growfiles -W gf101 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/msdos/glseek20 /test/growfiles/msdos/glseek20.2
-gf106 growfiles -W gf106 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/msdos/g_rand10 /test/growfiles/msdos/g_rand10.2
-gf107 growfiles -W gf107 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/msdos/g_rand13 /test/growfiles/msdos/g_rand13.2
-gf108 growfiles -W gf108 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/msdos/g_rand11 /test/growfiles/msdos/g_rand11.2
-gf109 growfiles -W gf109 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/msdos/g_rand12 /test/growfiles/msdos/g_rand12.2
-gf110 growfiles -W gf110 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/msdos/g_lio14 /test/growfiles/msdos/g_lio14.2
-gf111 growfiles -W gf111 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/msdos/g_lio15 /test/growfiles/msdos/g_lio15.2
-gf114 growfiles -W gf114 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/msdos/glseek19 /test/growfiles/msdos/glseek19.2
-gf115 growfiles -W gf115 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/msdos/Lgfile1
-gf120 growfiles -W gf120 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/msdos/gfbigio-$$
-gf121 growfiles -W gf121 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/msdos/gf-bld-$$
-gf122 growfiles -W gf122 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/msdos/gf-bldf-$$
-gf123 growfiles -W gf123 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/msdos/gf-inf-$$
-gf124 growfiles -W gf124 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/msdos/gf-jbld-$$
-gf125 growfiles -W gf125 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/msdos/gf-large-gs-$$
-gf126 growfiles -W gf126 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/msdos/gfsmallio-$$
-gf127 growfiles -W gf127 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/msdos/gfsparse-1-$$
-gf128 growfiles -W gf128 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/msdos/gfsparse-2-$$
-gf129 growfiles -W gf129 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/msdos/gfsparse-3-$$
-gf130 growfiles -W gf130 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/msdos/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/msdos/rwtest01%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/msdos/rwtest02%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/msdos/rwtest03%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/msdos/rwtest04%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/msdos/rwtest05%f
-# Check the Reiserfs filesystem
-gf202 growfiles -W gf202 -d /test/growfiles/reiser -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf203 growfiles -W gf203 -d /test/growfiles/reiser -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf204 growfiles -W gf204 -d /test/growfiles/reiser -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf205 growfiles -W gf205 -d /test/growfiles/reiser -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf216 growfiles -W gf216 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf217 growfiles -W gf217 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf218 growfiles -W gf218 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf219 growfiles -W gf219 -d /test/growfiles/reiser -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf212 mkfifo /test/growfiles/reiser/gffifo17; growfiles -W gf212 -b -e 1 -u -i 0 -L 30 /test/growfiles/reiser/gffifo17
-gf213 mkfifo /test/growfiles/reiser/gffifo18; growfiles -W gf213 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/reiser/gffifo18
-gf201 growfiles -W gf201 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/reiser/glseek20 /test/growfiles/reiser/glseek20.2
-gf206 growfiles -W gf206 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/reiser/g_rand10 /test/growfiles/reiser/g_rand10.2
-gf207 growfiles -W gf207 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/reiser/g_rand13 /test/growfiles/reiser/g_rand13.2
-gf208 growfiles -W gf208 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/reiser/g_rand11 /test/growfiles/reiser/g_rand11.2
-gf209 growfiles -W gf209 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/reiser/g_rand12 /test/growfiles/reiser/g_rand12.2
-gf210 growfiles -W gf210 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/reiser/g_lio14 /test/growfiles/reiser/g_lio14.2
-gf211 growfiles -W gf211 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/reiser/g_lio15 /test/growfiles/reiser/g_lio15.2
-gf214 growfiles -W gf214 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/reiser/glseek19 /test/growfiles/reiser/glseek19.2
-gf215 growfiles -W gf215 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/reiser/Lgfile1
-gf220 growfiles -W gf220 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/reiser/gfbigio-$$
-gf221 growfiles -W gf221 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/reiser/gf-bld-$$
-gf222 growfiles -W gf222 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/reiser/gf-bldf-$$
-gf223 growfiles -W gf223 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/reiser/gf-inf-$$
-gf224 growfiles -W gf224 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/reiser/gf-jbld-$$
-gf225 growfiles -W gf225 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/reiser/gf-large-gs-$$
-gf226 growfiles -W gf226 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/reiser/gfsmallio-$$
-gf227 growfiles -W gf227 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/reiser/gfsparse-1-$$
-gf228 growfiles -W gf228 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/reiser/gfsparse-2-$$
-gf229 growfiles -W gf229 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/reiser/gfsparse-3-$$
-gf230 growfiles -W gf230 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/reiser/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/reiser/rwtest06%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/reiser/rwtest07%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/reiser/rwtest08%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/reiser/rwtest09%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/reiser/rwtest10%f
-# Check the EXT2 filesystem
-gf302 growfiles -W gf302 -d /test/growfiles/ext2 -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf303 growfiles -W gf303 -d /test/growfiles/ext2 -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf304 growfiles -W gf304 -d /test/growfiles/ext2 -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf305 growfiles -W gf305 -d /test/growfiles/ext2 -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf316 growfiles -W gf316 -d /test/growfiles/ext2 -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf317 growfiles -W gf317 -d /test/growfiles/ext2 -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf318 growfiles -W gf318 -d /test/growfiles/ext2 -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf319 growfiles -W gf319 -d /test/growfiles/ext2 -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf312 mkfifo /test/growfiles/ext2/gffifo17; growfiles -W gf312 -d /test/growfiles/ext2 -b -e 1 -u -i 0 -L 30 /test/growfiles/ext2/gffifo17
-gf313 mkfifo /test/growfiles/ext2/gffifo18; growfiles -W gf313 -d /test/growfiles/ext2 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/ext2/gffifo18
-gf301 growfiles -W gf301 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/ext2/glseek20 /test/growfiles/ext2/glseek20.2
-gf306 growfiles -W gf306 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/ext2/g_rand10 /test/growfiles/ext2/g_rand10.2
-gf307 growfiles -W gf307 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/ext2/g_rand13 /test/growfiles/ext2/g_rand13.2
-gf308 growfiles -W gf308 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/ext2/g_rand11 /test/growfiles/ext2/g_rand11.2
-gf309 growfiles -W gf309 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/ext2/g_rand12 /test/growfiles/ext2/g_rand12.2
-gf310 growfiles -W gf310 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/ext2/g_lio14 /test/growfiles/ext2/g_lio14.2
-gf311 growfiles -W gf311 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/ext2/g_lio15 /test/growfiles/ext2/g_lio15.2
-gf314 growfiles -W gf314 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/ext2/glseek19 /test/growfiles/ext2/glseek19.2
-gf315 growfiles -W gf315 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/ext2/Lgfile1
-gf320 growfiles -W gf320 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/ext2/gfbigio-$$
-gf321 growfiles -W gf321 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/ext2/gf-bld-$$
-gf322 growfiles -W gf322 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/ext2/gf-bldf-$$
-gf323 growfiles -W gf323 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/ext2/gf-inf-$$
-gf324 growfiles -W gf324 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/ext2/gf-jbld-$$
-gf325 growfiles -W gf325 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/ext2/gf-large-gs-$$
-gf326 growfiles -W gf326 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/ext2/gfsmallio-$$
-gf327 growfiles -W gf327 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/ext2/gfsparse-1-$$
-gf328 growfiles -W gf328 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/ext2/gfsparse-2-$$
-gf329 growfiles -W gf329 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/ext2/gfsparse-3-$$
-gf330 growfiles -W gf330 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/ext2/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/ext2/rwtest11%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/ext2/rwtest12%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/ext2/rwtest13%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/ext2/rwtest14%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/ext2/rwtest15%f
-# Check an NFS filesystem
-gf402 growfiles -W gf402 -d /test/growfiles/nfs -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf403 growfiles -W gf403 -d /test/growfiles/nfs -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf404 growfiles -W gf404 -d /test/growfiles/nfs -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf405 growfiles -W gf405 -d /test/growfiles/nfs -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf416 growfiles -W gf416 -d /test/growfiles/nfs -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf417 growfiles -W gf417 -d /test/growfiles/nfs -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf418 growfiles -W gf418 -d /test/growfiles/nfs -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf419 growfiles -W gf419 -d /test/growfiles/nfs -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf412 mkfifo /test/growfiles/nfs/gffifo17; growfiles -W gf412 -b -e 1 -u -i 0 -L 30 /test/growfiles/nfs/gffifo17
-gf413 mkfifo /test/growfiles/nfs/gffifo18; growfiles -W gf413 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/nfs/gffifo18
-gf401 growfiles -W gf401 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/nfs/glseek20 /test/growfiles/nfs/glseek20.2
-gf406 growfiles -W gf406 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/nfs/g_rand10 /test/growfiles/nfs/g_rand10.2
-gf407 growfiles -W gf407 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/nfs/g_rand13 /test/growfiles/nfs/g_rand13.2
-gf408 growfiles -W gf408 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/nfs/g_rand11 /test/growfiles/nfs/g_rand11.2
-gf409 growfiles -W gf409 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/nfs/g_rand12 /test/growfiles/nfs/g_rand12.2
-gf410 growfiles -W gf410 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/nfs/g_lio14 /test/growfiles/nfs/g_lio14.2
-gf411 growfiles -W gf411 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/nfs/g_lio15 /test/growfiles/nfs/g_lio15.2
-gf414 growfiles -W gf414 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/nfs/glseek19 /test/growfiles/nfs/glseek19.2
-gf415 growfiles -W gf415 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/nfs/Lgfile1
-gf420 growfiles -W gf420 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/nfs/gfbigio-$$
-gf421 growfiles -W gf421 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/nfs/gf-bld-$$
-gf422 growfiles -W gf422 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/nfs/gf-bldf-$$
-gf423 growfiles -W gf423 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/nfs/gf-inf-$$
-gf424 growfiles -W gf424 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/nfs/gf-jbld-$$
-gf425 growfiles -W gf425 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/nfs/gf-large-gs-$$
-gf426 growfiles -W gf426 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/nfs/gfsmallio-$$
-gf427 growfiles -W gf427 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/nfs/gfsparse-1-$$
-gf428 growfiles -W gf428 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/nfs/gfsparse-2-$$
-gf429 growfiles -W gf429 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/nfs/gfsparse-3-$$
-gf430 growfiles -W gf430 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/nfs/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/nfs/rwtest16%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/nfs/rwtest17%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/nfs/rwtest18%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/nfs/rwtest19%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/nfs/rwtest20%f
-# Check a Ram Disk filesystem
-gf502 growfiles -W gf502 -d /test/growfiles/ramdisk -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf503 growfiles -W gf503 -d /test/growfiles/ramdisk -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf504 growfiles -W gf504 -d /test/growfiles/ramdisk -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf505 growfiles -W gf505 -d /test/growfiles/ramdisk -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf516 growfiles -W gf516 -d /test/growfiles/ramdisk -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf517 growfiles -W gf517 -d /test/growfiles/ramdisk -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf518 growfiles -W gf518 -d /test/growfiles/ramdisk -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf519 growfiles -W gf519 -d /test/growfiles/ramdisk -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf512 mkfifo /test/growfiles/ramdisk/gffifo17; growfiles -W gf512 -b -e 1 -u -i 0 -L 30 /test/growfiles/ramdisk/gffifo17
-gf513 mkfifo /test/growfiles/ramdisk/gffifo18; growfiles -W gf513 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/ramdisk/gffifo18
-gf501 growfiles -W gf501 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/ramdisk/glseek20 /test/growfiles/ramdisk/glseek20.2
-gf506 growfiles -W gf506 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/ramdisk/g_rand10 /test/growfiles/ramdisk/g_rand10.2
-gf507 growfiles -W gf507 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/ramdisk/g_rand13 /test/growfiles/ramdisk/g_rand13.2
-gf508 growfiles -W gf508 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/ramdisk/g_rand11 /test/growfiles/ramdisk/g_rand11.2
-gf509 growfiles -W gf509 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/ramdisk/g_rand12 /test/growfiles/ramdisk/g_rand12.2
-gf510 growfiles -W gf510 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/ramdisk/g_lio14 /test/growfiles/ramdisk/g_lio14.2
-gf511 growfiles -W gf511 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/ramdisk/g_lio15 /test/growfiles/ramdisk/g_lio15.2
-gf514 growfiles -W gf514 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/ramdisk/glseek19 /test/growfiles/ramdisk/glseek19.2
-gf515 growfiles -W gf515 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/ramdisk/Lgfile1
-gf520 growfiles -W gf520 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/ramdisk/gfbigio-$$
-gf521 growfiles -W gf521 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/ramdisk/gf-bld-$$
-gf522 growfiles -W gf522 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/ramdisk/gf-bldf-$$
-gf523 growfiles -W gf523 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/ramdisk/gf-inf-$$
-gf524 growfiles -W gf524 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/ramdisk/gf-jbld-$$
-gf525 growfiles -W gf525 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/ramdisk/gf-large-gs-$$
-gf526 growfiles -W gf526 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/ramdisk/gfsmallio-$$
-gf527 growfiles -W gf527 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/ramdisk/gfsparse-1-$$
-gf528 growfiles -W gf528 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/ramdisk/gfsparse-2-$$
-gf529 growfiles -W gf529 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/ramdisk/gfsparse-3-$$
-gf530 growfiles -W gf530 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/ramdisk/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/ramdisk/rwtest21%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/ramdisk/rwtest22%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/ramdisk/rwtest23%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/ramdisk/rwtest24%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/ramdisk/rwtest25%f
-# Check the MINIX filesystem
-gf602 growfiles -W gf602 -d /test/growfiles/minix -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf603 growfiles -W gf603 -d /test/growfiles/minix -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf604 growfiles -W gf604 -d /test/growfiles/minix -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf605 growfiles -W gf605 -d /test/growfiles/minix -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf616 growfiles -W gf616 -d /test/growfiles/minix -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf617 growfiles -W gf617 -d /test/growfiles/minix -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf618 growfiles -W gf618 -d /test/growfiles/minix -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf619 growfiles -W gf619 -d /test/growfiles/minix -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf612 mkfifo /test/growfiles/minix/gffifo17; growfiles -W gf612 -b -e 1 -u -i 0 -L 30 /test/growfiles/minix/gffifo17
-gf613 mkfifo /test/growfiles/minix/gffifo18; growfiles -W gf613 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/minix/gffifo18
-gf601 growfiles -W gf601 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/minix/glseek20 /test/growfiles/minix/glseek20.2
-gf606 growfiles -W gf606 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/minix/g_rand10 /test/growfiles/minix/g_rand10.2
-gf607 growfiles -W gf607 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/minix/g_rand13 /test/growfiles/minix/g_rand13.2
-gf608 growfiles -W gf608 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/minix/g_rand11 /test/growfiles/minix/g_rand11.2
-gf609 growfiles -W gf609 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/minix/g_rand12 /test/growfiles/minix/g_rand12.2
-gf610 growfiles -W gf610 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/minix/g_lio14 /test/growfiles/minix/g_lio14.2
-gf611 growfiles -W gf611 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/minix/g_lio15 /test/growfiles/minix/g_lio15.2
-gf614 growfiles -W gf614 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/minix/glseek19 /test/growfiles/minix/glseek19.2
-gf615 growfiles -W gf615 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/minix/Lgfile1
-gf620 growfiles -W gf620 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/minix/gfbigio-$$
-gf621 growfiles -W gf621 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/minix/gf-bld-$$
-gf622 growfiles -W gf622 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/minix/gf-bldf-$$
-gf623 growfiles -W gf623 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/minix/gf-inf-$$
-gf624 growfiles -W gf624 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/minix/gf-jbld-$$
-gf625 growfiles -W gf625 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/minix/gf-large-gs-$$
-gf626 growfiles -W gf626 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/minix/gfsmallio-$$
-gf627 growfiles -W gf627 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/minix/gfsparse-1-$$
-gf628 growfiles -W gf628 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/minix/gfsparse-2-$$
-gf629 growfiles -W gf629 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/minix/gfsparse-3-$$
-gf630 growfiles -W gf630 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/minix/gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/minix/rwtest26%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/minix/rwtest27%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/minix/rwtest28%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/minix/rwtest29%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/minix/rwtest30%f
diff --git a/runtest/lvm.part2 b/runtest/lvm.part2
deleted file mode 100644
index f0dbf3277..000000000
--- a/runtest/lvm.part2
+++ /dev/null
@@ -1,72 +0,0 @@
-# Check the EXT3 filesystem
-gf702 growfiles -W gf702 -d /test/growfiles/ext3 -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf703 growfiles -W gf703 -d /test/growfiles/ext3 -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf704 growfiles -W gf704 -d /test/growfiles/ext3 -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf705 growfiles -W gf705 -d /test/growfiles/ext3 -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf716 growfiles -W gf716 -d /test/growfiles/ext3 -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf717 growfiles -W gf717 -d /test/growfiles/ext3 -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf718 growfiles -W gf718 -d /test/growfiles/ext3 -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf719 growfiles -W gf719 -d /test/growfiles/ext3 -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf712 mkfifo gffifo17; growfiles -W gf712 -d /test/growfiles/ext3 -b -e 1 -u -i 0 -L 30 gffifo17
-gf713 mkfifo gffifo18; growfiles -W gf713 -d /test/growfiles/ext3 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 gffifo18
-gf701 growfiles -W gf701 -d /test/growfiles/ext3 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 glseek20 glseek20.2
-gf706 growfiles -W gf706 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 g_rand10 g_rand10.2
-gf707 growfiles -W gf707 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p g_rand13 g_rand13.2
-gf708 growfiles -W gf708 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 g_rand11 g_rand11.2
-gf709 growfiles -W gf709 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p g_rand12 g_rand12.2
-gf710 growfiles -W gf710 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l g_lio14 g_lio14.2
-gf711 growfiles -W gf711 -d /test/growfiles/ext3 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L g_lio15 g_lio15.2
-gf714 growfiles -W gf714 -d /test/growfiles/ext3 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 glseek19 glseek19.2
-gf715 growfiles -W gf715 -d /test/growfiles/ext3 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 Lgfile1
-gf720 growfiles -W gf720 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 gfbigio-$$
-gf721 growfiles -W gf721 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 gf-bld-$$
-gf722 growfiles -W gf722 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 gf-bldf-$$
-gf723 growfiles -W gf723 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 gf-inf-$$
-gf724 growfiles -W gf724 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 gf-jbld-$$
-gf725 growfiles -W gf725 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 gf-large-gs-$$
-gf726 growfiles -W gf726 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 gfsmallio-$$
-gf727 growfiles -W gf727 -d /test/growfiles/ext3 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u gfsparse-1-$$
-gf728 growfiles -W gf728 -d /test/growfiles/ext3 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u gfsparse-2-$$
-gf729 growfiles -W gf729 -d /test/growfiles/ext3 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u gfsparse-3-$$
-gf730 growfiles -W gf730 -d /test/growfiles/ext3 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/ext3/rwtest11%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/ext3/rwtest12%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/ext3/rwtest13%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/ext3/rwtest14%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/ext3/rwtest15%f
-# Check the JFS filesystem
-gf802 growfiles -W gf802 -d /test/growfiles/jfs -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf803 growfiles -W gf803 -d /test/growfiles/jfs -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf804 growfiles -W gf804 -d /test/growfiles/jfs -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf805 growfiles -W gf805 -d /test/growfiles/jfs -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf816 growfiles -W gf816 -d /test/growfiles/jfs -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf817 growfiles -W gf817 -d /test/growfiles/jfs -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf818 growfiles -W gf818 -d /test/growfiles/jfs -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf819 growfiles -W gf819 -d /test/growfiles/jfs -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf812 mkfifo /test/growfiles/jfs/gffifo17; growfiles -W gf812 -b -e 1 -u -i 0 -L 30 /test/growfiles/jfs/gffifo17
-gf813 mkfifo /test/growfiles/jfs/gffifo18; growfiles -W gf813 -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 /test/growfiles/jfs/gffifo18
-gf801 growfiles -W gf801 -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 /test/growfiles/jfs/glseek20 /test/growfiles/jfs/glseek20.2
-gf806 growfiles -W gf806 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 /test/growfiles/jfs/g_rand10 /test/growfiles/jfs/g_rand10.2
-gf807 growfiles -W gf807 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p /test/growfiles/jfs/g_rand13 /test/growfiles/jfs/g_rand13.2
-gf808 growfiles -W gf808 -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 /test/growfiles/jfs/g_rand11 /test/growfiles/jfs/g_rand11.2
-gf809 growfiles -W gf809 -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p /test/growfiles/jfs/g_rand12 /test/growfiles/jfs/g_rand12.2
-gf810 growfiles -W gf810 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l /test/growfiles/jfs/g_lio14 /test/growfiles/jfs/g_lio14.2
-gf811 growfiles -W gf811 -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L /test/growfiles/jfs/g_lio15 /test/growfiles/jfs/g_lio15.2
-gf814 growfiles -W gf814 -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 /test/growfiles/jfs/glseek19 /test/growfiles/jfs/glseek19.2
-gf815 growfiles -W gf815 -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 /test/growfiles/jfs/Lgfile1
-gf820 growfiles -W gf820 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 /test/growfiles/jfs/gfbigio-$$
-gf821 growfiles -W gf821 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/jfs/gf-bld-$$
-gf822 growfiles -W gf822 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 /test/growfiles/jfs/gf-bldf-$$
-gf823 growfiles -W gf823 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 /test/growfiles/jfs/gf-inf-$$
-gf824 growfiles -W gf824 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 /test/growfiles/jfs/gf-jbld-$$
-gf825 growfiles -W gf825 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 /test/growfiles/jfs/gf-large-gs-$$
-gf826 growfiles -W gf826 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 /test/growfiles/jfs/gfsmallio-$$
-gf827 growfiles -W gf827 -b -D 0 -w -g 8b -C 1 -b -i 1000 -u /test/growfiles/jfs/gfsparse-1-$$
-gf828 growfiles -W gf828 -b -D 0 -w -g 16b -C 1 -b -i 1000 -u /test/growfiles/jfs/gfsparse-2-$$
-gf829 growfiles -W gf829 -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u /test/growfiles/jfs/gfsparse-3-$$
-gf830 growfiles -W gf830 -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 /test/growfiles/jfs/gf-sync-$$
-rwtest11 export LTPROOT; rwtest -N rwtest11 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/jfs/rwtest11%f
-rwtest12 export LTPROOT; rwtest -N rwtest12 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/jfs/rwtest12%f
-rwtest13 export LTPROOT; rwtest -N rwtest13 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/jfs/rwtest13%f
-rwtest14 export LTPROOT; rwtest -N rwtest14 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/jfs/rwtest14%f
-rwtest15 export LTPROOT; rwtest -N rwtest15 -c -q -i 50 -T 64b 500b:/test/growfiles/jfs/rwtest15%f
diff --git a/testscripts/ltpfslvm.sh b/testscripts/ltpfslvm.sh
deleted file mode 100755
index a90d06574..000000000
--- a/testscripts/ltpfslvm.sh
+++ /dev/null
@@ -1,200 +0,0 @@
-#!/bin/sh
-# This script should be run prior to running executing the filesystem tests.
-# valid devices need to be passed for Device Mapper to work correctly
-# 03/14/03 mridge@us.ibm.com added instance and time command line options
-# 05/16/03 changed script paths
-# 05/20/03 Added instructions on setup and warnings
-# 05/03/2004 hien1@us.ibm.com  Added resize2fs and resize_reiserfs after extend and reduce LVs
-# 05/03/2004 Moved the mount after resizing
-# 05/03/2004 Modified /dev/ram to /dev/ram0
-
-cd `dirname $0`
-export LTPROOT=${PWD}
-echo $LTPROOT | grep testscripts > /dev/null 2>&1
-if [ $? -eq 0 ]; then
- cd ..
- export LTPROOT=${PWD}
-fi
-
-export TMPBASE="/tmp"
-
-
-usage()
-{
-	cat <<-END >&2
-	usage: ${0##*/} [ -a part1 ] [ -b part2 ] [ -c part3 ]
-                [ -d part4 ] [ -n nfsmount ]
-	defaults:
-	part1=$part1
-	part2=$part2
-	part3=$part3
-	part4=$part4
-        nfsmount=$nfsmount
-	ltproot=$TPROOT
-	tmpdir=$TMPBASE
-
-	example: ${0##*/} -a hdc1 -b hdc2 -c hdc3 -d hdc4 -n mytesthost:/testmountdir
-
-        fdisk needs to be run and the 4 HD partitions marked as 0x8e -- Linux LVM
-
-        - If this is run on a 2.4 kernel system then LVM must be configured and the kernel rebuilt. In a 2.5 environment
-        you must configure Device Mapper and install LVM2 from www.systina.com for the testcase to run correctly.
-
-        - These operations are destructive so do NOT point the tests to partitions where the data shouldn't be overwritten.
-        Once these tests are started all data in the partitions you point to will be destroyed.
-
-	END
-exit
-}
-
-while getopts :a:b:c:d:e:n:v: arg
-do      case $arg in
-		a)	part1=$OPTARG;;
-                b)      part2=$OPTARG;;
-                c)      part3=$OPTARG;;
-                d)      part4=$OPTARG;;
-                n)      nfsmount=$OPTARG;;
-                v)      verb=$OPTARG;;
-
-                \?)     echo "************** Help Info: ********************"
-                        usage;;
-        esac
-done
-
-if [ ! -n "$part1"  ]; then
-  echo "Missing 1st partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part2" ]; then
-  echo "Missing 2nd partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part3" ]; then
-  echo "Missing 3rd partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part4" ]; then
-  echo "Missing 4th partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$nfsmount" ]; then
-  echo "Missing NFS partition. You must pass an NFS mount point for testing"
-  usage;
-  exit
-fi
-
-export PATH="${PATH}:${LTPROOT}/testcases/bin"
-
-
-mkdir /test                   >/dev/null 2>&1
-mkdir /test/growfiles         >/dev/null 2>&1
-mkdir /test/growfiles/ext2    >/dev/null 2>&1
-mkdir /test/growfiles/msdos   >/dev/null 2>&1
-mkdir /test/growfiles/reiser  >/dev/null 2>&1
-mkdir /test/growfiles/minix   >/dev/null 2>&1
-mkdir /test/growfiles/nfs     >/dev/null 2>&1
-mkdir /test/growfiles/jfs     >/dev/null 2>&1
-mkdir /test/growfiles/ramdisk >/dev/null 2>&1
-
-vgscan
-vgchange -a y
-
-pvcreate -v /dev/$part1 /dev/$part2 /dev/$part3 /dev/$part4
-vgcreate -v ltp_test_vg1 /dev/$part1 /dev/$part2
-vgcreate -v ltp_test_vg2 /dev/$part3 /dev/$part4
-vgcfgbackup -v
-lvcreate -v -L 100 ltp_test_vg1 -n ltp_test_lv1
-lvcreate -v -L 100 ltp_test_vg1 -n ltp_test_lv2 -i 2
-lvcreate -v -L 100 ltp_test_vg2 -n ltp_test_lv3
-lvcreate -v -L 100 ltp_test_vg2 -n ltp_test_lv4
-
-mkfs -V -t ext2     /dev/ltp_test_vg1/ltp_test_lv1
-mkfs -V -t msdos    /dev/ltp_test_vg1/ltp_test_lv2
-mkreiserfs          /dev/ltp_test_vg2/ltp_test_lv3 <yesenter.txt
-mkfs -V -t minix    /dev/ltp_test_vg2/ltp_test_lv4
-
-### there is no /dev/ram - has /dev/ram0 ... /dev/ram15
-mkfs -V -t ext3        /dev/ram0
-
-
-lvmdiskscan -v
-lvscan      -v
-vgdisplay   -v
-lvextend -v -l +5000 /dev/ltp_test_vg1/ltp_test_lv1
-lvreduce -v -f -l -20 /dev/ltp_test_vg1/ltp_test_lv1
-
-### Need to be resize to get LV to the correct size
-resize2fs -f /dev/ltp_test_vg1/ltp_test_lv1
-lvextend -v -l +5000 /dev/ltp_test_vg1/ltp_test_lv2
-lvreduce -v -f -l -20 /dev/ltp_test_vg1/ltp_test_lv2
-
-### Need to be resize to get LV to the correct size
-resize_reiserfs -f /dev/ltp_test_vg1/ltp_test_lv2
-lvextend -v -l +20 /dev/ltp_test_vg2/ltp_test_lv3
-lvreduce -v -f -l -20 /dev/ltp_test_vg2/ltp_test_lv3
-lvextend -v -l +20 /dev/ltp_test_vg2/ltp_test_lv4
-lvreduce -v -f -l -20 /dev/ltp_test_vg2/ltp_test_lv4
-
-vgreduce -v /dev/ltp_test_vg1 /dev/$part2
-vgextend -v /dev/ltp_test_vg1 /dev/$part2
-vgck -v
-
-### Move mount filesystems to the last since resize can't work on a mounted filesystem.
-mount -v -t nfs $nfsmount               /test/growfiles/nfs
-mount -v /dev/ltp_test_vg1/ltp_test_lv1 /test/growfiles/ext2
-mount -v /dev/ltp_test_vg1/ltp_test_lv2 /test/growfiles/msdos
-mount -v /dev/ltp_test_vg2/ltp_test_lv3 /test/growfiles/reiser
-mount -v /dev/ltp_test_vg2/ltp_test_lv4 /test/growfiles/minix
-mount -v /dev/ram                       /test/growfiles/ramdisk
-
-echo "************ Running tests "
-sort -R ${LTPROOT}/runtest/lvm.part1 -o ${TMPBASE}/lvm.part1
-
-${LTPROOT}/bin/ltp-pan -e -S -a lvmpart1 -n lvmpart1 -l lvmlogfile -f ${TMPBASE}/lvm.part1 &
-
-wait $!
-
-
-
-umount -v -t nfs $nfsmount
-umount -v /dev/ltp_test_vg1/ltp_test_lv1
-umount -v /dev/ltp_test_vg1/ltp_test_lv2
-umount -v /dev/ltp_test_vg2/ltp_test_lv3
-umount -v /dev/ltp_test_vg2/ltp_test_lv4
-umount -v /dev/ram
-
-lvremove -f -v /dev/ltp_test_vg1/ltp_test_lv1
-lvremove -f -v /dev/ltp_test_vg1/ltp_test_lv2
-lvremove -f -v /dev/ltp_test_vg2/ltp_test_lv3
-lvremove -f -v /dev/ltp_test_vg2/ltp_test_lv4
-
-lvscan -v
-vgchange -a n
-vgremove -v /dev/ltp_test_vg1
-vgremove -v /dev/ltp_test_vg2
-
-mkfs -V -t ext3     /dev/$part4
-mkfs -V -t jfs /dev/$part1  <yesenter.txt
-
-mount -v -t ext3   /dev/$part4         /test/growfiles/ext3
-mount -v -t jfs    /dev/hdc1           /test/growfiles/jfs
-
-echo "************ Running EXT3 & JFS tests...  "
-sort -R ${LTPROOT}/runtest/lvm.part2 -o ${TMPBASE}/lvm.part2
-
-${LTPROOT}/bin/ltp-pan -e -S -a lvmpart2 -n lvmpart2 -l lvmlogfile -f ${TMPBASE}/lvm.part2 &
-
-wait $!
-
-umount -v /dev/$part1
-umount -v /dev/$part4
-
-
diff --git a/testscripts/ltpfsnolvm.sh b/testscripts/ltpfsnolvm.sh
deleted file mode 100755
index 26dac0108..000000000
--- a/testscripts/ltpfsnolvm.sh
+++ /dev/null
@@ -1,150 +0,0 @@
-#!/bin/sh
-# This script should be run prior to running executing the filesystem tests.
-# valid devices need to be passed for Device Mapper to work correctly
-# 03/14/03 mridge@us.ibm.com added instance and time command line options
-# 05/16/03 changed script paths
-# 05/20/03 Added instructions on setup and warnings
-
-cd `dirname $0`
-export LTPROOT=${PWD}
-echo $LTPROOT | grep testscripts > /dev/null 2>&1
-if [ $? -eq 0 ]; then
- cd ..
- export LTPROOT=${PWD}
-fi
-
-export TMPBASE="/tmp"
-
-
-usage()
-{
-	cat <<-END >&2
-	usage: ${0##*/} [ -a part1 ] [ -b part2 ] [ -c part3 ]
-                [ -d part4 ] [ -n nfsmount ]
-	defaults:
-	part1=$part1
-	part2=$part2
-	part3=$part3
-	part4=$part4
-        nfsmount=$nfsmount
-	ltproot=$TPROOT
-	tmpdir=$TMPBASE
-
-	example: ${0##*/} -a hdc1 -b hdc2 -c hdc3 -d hdc4 -n mytesthost:/testmountdir
-
-        fdisk needs to be run and the 4 HD partitions marked as 0x8e -- Linux LVM
-
-        - If this is run on a 2.4 kernel system then LVM must be configured and the kernel rebuilt. In a 2.5 environment
-        you must configure Device Mapper and install LVM2 from www.systina.com for the testcase to run correctly.
-
-        - These operations are destructive so do NOT point the tests to partitions where the data shouldn't be overwritten.
-        Once these tests are started all data in the partitions you point to will be destroyed.
-
-	END
-exit
-}
-
-while getopts :a:b:c:d:e:n:v: arg
-do      case $arg in
-		a)	part1=$OPTARG;;
-                b)      part2=$OPTARG;;
-                c)      part3=$OPTARG;;
-                d)      part4=$OPTARG;;
-                n)      nfsmount=$OPTARG;;
-                v)      verb=$OPTARG;;
-
-                \?)     echo "************** Help Info: ********************"
-                        usage;;
-        esac
-done
-
-if [ ! -n "$part1"  ]; then
-  echo "Missing 1st partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part2" ]; then
-  echo "Missing 2nd partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part3" ]; then
-  echo "Missing 3rd partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$part4" ]; then
-  echo "Missing 4th partition. You must pass 4 partitions for testing"
-  usage;
-  exit
-fi
-
-if [ ! -n "$nfsmount" ]; then
-  echo "Missing NFS partition. You must pass an NFS mount point for testing"
-  usage;
-  exit
-fi
-
-export PATH="${PATH}:${LTPROOT}/testcases/bin"
-
-
-mkdir /test                   >/dev/null 2>&1
-mkdir /test/growfiles         >/dev/null 2>&1
-mkdir /test/growfiles/ext2    >/dev/null 2>&1
-mkdir /test/growfiles/ext3    >/dev/null 2>&1
-mkdir /test/growfiles/msdos   >/dev/null 2>&1
-mkdir /test/growfiles/reiser  >/dev/null 2>&1
-mkdir /test/growfiles/minix   >/dev/null 2>&1
-mkdir /test/growfiles/nfs     >/dev/null 2>&1
-mkdir /test/growfiles/jfs     >/dev/null 2>&1
-mkdir /test/growfiles/ramdisk >/dev/null 2>&1
-
-mkfs -V -t ext2     /dev/$part1
-mkfs -V -t msdos    /dev/$part2
-mkreiserfs          /dev/$part3
-mkfs -V -t minix    /dev/$part4
-
-
-mount -v -t nfs $nfsmount               /test/growfiles/nfs
-mount -v /dev/$part1                    /test/growfiles/ext2
-mount -v /dev/$part2                    /test/growfiles/msdos
-mount -v /dev/$part3                    /test/growfiles/reiser
-mount -v /dev/$part4                    /test/growfiles/minix
-mount -v /dev/ram                       /test/growfiles/ramdisk
-
-echo "************ Running tests "
-sort -R ${LTPROOT}/../runtest/lvm.part1 -o ${TMPBASE}/lvm.part1
-
-${LTPROOT}/../bin/ltp-pan -e -S -a lvmpart1 -n lvmpart1 -l lvmlogfile -f ${TMPBASE}/lvm.part1 &
-
-wait $!
-
-
-
-umount -v -t nfs $nfsmount
-umount -v /dev/$part1
-umount -v /dev/$part2
-umount -v /dev/$part3
-umount -v /dev/$part4
-umount -v /dev/ram
-
-mkfs -V -t ext3     /dev/$part4
-mkfs -V -t jfs /dev/$part1  <yesenter.txt
-
-mount -v -t ext3   /dev/$part4         /test/growfiles/ext3
-mount -v -t jfs    /dev/$part1         /test/growfiles/jfs
-
-echo "************ Running EXT3 & JFS tests...  "
-sort -R ${LTPROOT}/../runtest/lvm.part2 -o ${TMPBASE}/lvm.part2
-
-${LTPROOT}/../bin/ltp-pan -e -S -a lvmpart2 -n lvmpart2 -l lvmlogfile -f ${TMPBASE}/lvm.part2 &
-
-wait $!
-
-umount -v /dev/$part1
-umount -v /dev/$part4
-
-
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
