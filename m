Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 142F08723C
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDA123C1CFA
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 08:30:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 32A1C3C183A
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:12 +0200 (CEST)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4D3CF200AE7
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 08:30:09 +0200 (CEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 23:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326543066"
Received: from yixin-dev.sh.intel.com ([10.239.161.25])
 by orsmga004.jf.intel.com with ESMTP; 08 Aug 2019 23:30:05 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Fri,  9 Aug 2019 14:19:56 +0800
Message-Id: <20190809062000.8671-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH ltp 1/5] runtest/scsi_debug.part1: remove duplicated
 test for reiserfs filesystem
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

gf2** and rwtest0{1..5} are duplicated in this runtest file for reiserfs
filesystem, remove them

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 runtest/scsi_debug.part1 | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/runtest/scsi_debug.part1 b/runtest/scsi_debug.part1
index 5d0aed722..ce1470288 100644
--- a/runtest/scsi_debug.part1
+++ b/runtest/scsi_debug.part1
@@ -143,39 +143,3 @@ rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:r
 rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/msdos/rwtest03%f
 rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/msdos/rwtest04%f
 rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/msdos/rwtest05%f
-# Check the Reiserfs filesystem
-gf201 growfiles -W gf201 -d /test/growfiles/reiser -b -e 1 -u -i 0 -L 20 -w -C 1 -l -I r -T 10 glseek20 glseek20.2
-gf202 growfiles -W gf202 -d /test/growfiles/reiser -b -e 1 -L 10 -i 100 -I p -S 2 -u -f gf03_
-gf203 growfiles -W gf203 -d /test/growfiles/reiser -b -e 1 -g 1 -i 1 -S 150 -u -f gf05_
-gf204 growfiles -W gf204 -d /test/growfiles/reiser -b -e 1 -g 4090 -i 500 -t 39000 -u -f gf06_
-gf205 growfiles -W gf205 -d /test/growfiles/reiser -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -u -f gf07_
-gf206 growfiles -W gf206 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 g_rand10 g_rand10.2
-gf207 growfiles -W gf207 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 -I p g_rand13 g_rand13.2
-gf208 growfiles -W gf208 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -R 0--2 -i 0 -L 30 -C 1 g_rand11 g_rand11.2
-gf209 growfiles -W gf209 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -R 0--1 -i 0 -L 30 -C 1 -I p g_rand12 g_rand12.2
-gf210 growfiles -W gf210 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I l g_lio14 g_lio14.2
-gf211 growfiles -W gf211 -d /test/growfiles/reiser -b -e 1 -u -r 1-5000 -i 0 -L 30 -C 1 -I L g_lio15 g_lio15.2
-gf212 mkfifo gffifo17; growfiles -W gf212 -d /test/growfiles/reiser -b -e 1 -u -i 0 -L 30 gffifo17
-gf213 mkfifo gffifo18; growfiles -W gf213 -d /test/growfiles/reiser -b -e 1 -u -i 0 -L 30 -I r -r 1-4096 gffifo18
-gf214 growfiles -W gf214 -d /test/growfiles/reiser -b -e 1 -u -i 0 -L 20 -w -l -C 1 -T 10 glseek19 glseek19.2
-gf215 growfiles -W gf215 -d /test/growfiles/reiser -b -e 1 -u -r 1-49600 -I r -u -i 0 -L 120 Lgfile1
-gf216 growfiles -W gf216 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -u -g 4090 -T 100 -t 408990 -l -C 10 -c 1000 -S 10 -f Lgf02_
-gf217 growfiles -W gf217 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -u -g 5000 -T 100 -t 499990 -l -C 10 -c 1000 -S 10 -f Lgf03_
-gf218 growfiles -W gf218 -d /test/growfiles/reiser -b -e 1 -i 0 -L 120 -w -u -r 10-5000 -I r -T 10 -l -S 2 -f Lgf04_
-gf219 growfiles -W gf219 -d /test/growfiles/reiser -b -e 1 -g 5000 -i 500 -t 49900 -T10 -c9 -I p -o O_RDWR,O_CREAT,O_TRUNC -u -f gf08i_
-gf220 growfiles -W gf220 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1-256000:512 -R 512-256000 -T 4 gfbigio-$$
-gf221 growfiles -W gf221 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 gf-bld-$$
-gf222 growfiles -W gf222 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 -T 10 -t 20480 gf-bldf-$$
-gf223 growfiles -W gf223 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 512-64000:1024 -R 1-384000 -T 4 gf-inf-$$
-gf224 growfiles -W gf224 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -g 20480 gf-jbld-$$
-gf225 growfiles -W gf225 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 1024000-2048000:2048 -R 4095-2048000 -T 1 gf-large-gs-$$
-gf226 growfiles -W gf226 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -r 128-32768:128 -R 512-64000 -T 4 gfsmallio-$$
-gf227 growfiles -W gf227 -d /test/growfiles/reiser -b -D 0 -w -g 8b -C 1 -b -i 1000 -u gfsparse-1-$$
-gf228 growfiles -W gf228 -d /test/growfiles/reiser -b -D 0 -w -g 16b -C 1 -b -i 1000 -u gfsparse-2-$$
-gf229 growfiles -W gf229 -d /test/growfiles/reiser -b -D 0 -r 1-4096 -R 0-33554432 -i 0 -L 60 -C 1 -u gfsparse-3-$$
-gf230 growfiles -W gf230 -d /test/growfiles/reiser -D 0 -b -i 0 -L 60 -u -B 1000b -e 1 -o O_RDWR,O_CREAT,O_SYNC -g 20480 -T 10 -t 20480 gf-sync-$$
-rwtest01 export LTPROOT; rwtest -N rwtest01 -c -q -i 60s  -f sync 10%25000:rw-sync-$$ 500b:/test/growfiles/reiser/rwtest06%f
-rwtest02 export LTPROOT; rwtest -N rwtest02 -c -q -i 60s  -f buffered 10%25000:rw-buffered-$$ 500b:/test/growfiles/reiser/rwtest07%f
-rwtest03 export LTPROOT; rwtest -N rwtest03 -c -q -i 60s -n 2  -f buffered -s mmread,mmwrite -m random -Dv 10%25000:mm-buff-$$ 500b:/test/growfiles/reiser/rwtest08%f
-rwtest04 export LTPROOT; rwtest -N rwtest04 -c -q -i 60s -n 2  -f sync -s mmread,mmwrite -m random -Dv 10%25000:mm-sync-$$ 500b:/test/growfiles/reiser/rwtest09%f
-rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:/test/growfiles/reiser/rwtest10%f
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
