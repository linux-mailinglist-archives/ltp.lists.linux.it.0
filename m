Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34315897F9
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:38:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC2F03C1CF7
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 09:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0FAF53C1C8A
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:38:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1D6FD200C86
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 09:38:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8EB4DAFA4;
 Mon, 12 Aug 2019 07:38:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 09:38:37 +0200
Message-Id: <20190812073837.18016-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] zram01: Improve error detection
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

* print dd stderr, if any
* TBROK when detected size is 0
* TBROK if actually used memory is 0, this fixes division by 0:

Sometimes free reports no memory use by zram, which leads to division by 0:
zram01 8 TINFO: zram used 0M, zram disk sizes 104857600M
/opt/ltp/testcases/bin/zram01.sh: line 87: 100 * 104857600 / 0: division by 0 (error token is "0")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Not sure what is a small memory which should be detected. 100 KB?
Maybe we could TBROK on 0 and TWARN on some small value.

I found this problem on ppc64le, but I can reproduce it on intel VM.
zram driver gets into some broken state, so next run of this test it
does not work at all:
can't set 'lzo' to /sys/block/zram0/comp_algorithm

after reboot it's shows it's no space error, but test works (huh):
zram01 7 TINFO: fill zram0...
zram01 7 TWARN: dd error: dd: error writing 'zram0/file': No space left on device
zram01 7 TINFO: zram0 can be filled with '20628' KB
zram01 7 TINFO: fill zram1...
zram01 7 TWARN: dd error: dd: error writing 'zram1/file': No space left on device
zram01 7 TINFO: zram1 can be filled with '20140' KB
zram01 7 TINFO: fill zram2...
zram01 7 TWARN: dd error: dd: error writing 'zram2/file': No space left on device
zram01 7 TINFO: zram2 can be filled with '24724' KB
zram01 7 TINFO: fill zram3...
zram01 7 TWARN: dd error: dd: error writing 'zram3/file': No space left on device
zram01 7 TINFO: zram3 can be filled with '24724' KB
zram01 7 TINFO: zram used 92M, zram disk sizes 104857600M
zram01 7 TPASS: compression ratio: 1139756.52:1
zram01 8 TINFO: zram cleanup

Thus there are error messages from zram_cleanup. Do we want to suppress
them? (I'd keep it).
sh: echo: I/O error

Kind regards,
Petr
---
 testcases/kernel/device-drivers/zram/zram01.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/kernel/device-drivers/zram/zram01.sh b/testcases/kernel/device-drivers/zram/zram01.sh
index b3ed5170d..a06c0dc17 100755
--- a/testcases/kernel/device-drivers/zram/zram01.sh
+++ b/testcases/kernel/device-drivers/zram/zram01.sh
@@ -67,9 +67,11 @@ zram_fill_fs()
 		while true; do
 			dd conv=notrunc if=/dev/zero of=zram${i}/file \
 				oflag=append count=1 bs=1024 status=none \
-				> /dev/null 2>&1 || break
+				2>err.txt || break
 			b=$(($b + 1))
 		done
+		[ -s err.txt ] && tst_resm TWARN "dd error: $(cat err.txt)"
+		[ $b -eq 0 ] && tst_brkm TBROK "cannot fill zram"
 		tst_resm TINFO "zram$i can be filled with '$b' KB"
 	done
 
@@ -82,6 +84,8 @@ zram_fill_fs()
 		total_size=$(($total_size + $s))
 	done
 
+	[ $used_mem -eq 0 ] && tst_brkm TBROK "no memory used by zram"
+
 	tst_resm TINFO "zram used ${used_mem}M, zram disk sizes ${total_size}M"
 
 	local v=$((100 * $total_size / $used_mem))
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
