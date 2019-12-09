Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D91111715E
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 17:19:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1332B3C2354
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Dec 2019 17:19:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A83573C22D5
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 17:19:26 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 55DC31401B51
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 17:19:24 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0595EB18C
 for <ltp@lists.linux.it>; Mon,  9 Dec 2019 16:19:24 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  9 Dec 2019 17:19:18 +0100
Message-Id: <20191209161918.2411991-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Fix check for non-mounted device
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

1) unset TST_DEVICE if acquiring failed
2) do not try to umount the device in this case

Maybe sometimes missing $device in tst_umount()
is error, but mostly at least in case of df01.sh
it's not, therefore return without warning.

This fixes error:

df01 1 TBROK: Failed to acquire device
grep: Unmatched [, [^, [:, [., or [=
grep: Unmatched [, [^, [:, [., or [=
df01 1 TINFO: The tst_device    0  TINFO  :  Found free device 0 '/dev/loop0'
Test device='/dev/loop0'
tst_device    0  TINFO  :  Formatting /dev/loop0 with ext2 opts='' extra opts='' is not mounted, skipping umount

Fixes: 5c846a0f6 shell: Add $TST_DEVICE as default parameter to tst_umount

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 70c1ef2e3..f772857eb 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -273,6 +273,8 @@ tst_umount()
 	local device="${1:-$TST_DEVICE}"
 	local i=0
 
+	[ -z "$device" ] && return
+
 	if ! grep -q "$device" /proc/mounts; then
 		tst_res TINFO "The $device is not mounted, skipping umount"
 		return
@@ -546,6 +548,7 @@ tst_run()
 		TST_DEVICE=$(tst_device acquire)
 
 		if [ ! -b "$TST_DEVICE" -o $? -ne 0 ]; then
+			unset TST_DEVICE
 			tst_brk TBROK "Failed to acquire device"
 		fi
 
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
