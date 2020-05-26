Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC6E1E2FC0
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 22:09:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1C833C32E2
	for <lists+linux-ltp@lfdr.de>; Tue, 26 May 2020 22:09:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id EB5B93C325B
 for <ltp@lists.linux.it>; Tue, 26 May 2020 22:09:12 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 31C251400E6F
 for <ltp@lists.linux.it>; Tue, 26 May 2020 22:09:11 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8AE57AC6C;
 Tue, 26 May 2020 20:09:13 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 May 2020 22:09:04 +0200
Message-Id: <20200526200904.27264-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_test.sh: Fix TST_NEEDS_DEVICE=1 implies
 TST_NEEDS_TMPDIR=1
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

e5dd9c0e7 set TST_TMPDIR=1 instead, which is wrong, because variable
holds path to the test temporary directory. That broke IMA/EVM tests
running on tmpfs (which creates loop device via TST_NEEDS_DEVICE=1):

/opt/ltp/testcases/bin/ima_measurements.sh: 107: cd: can't cd to 1

which also broke umount in cleanup()
umount: /root/mntpoint: target is busy.
ima_measurements 1 TINFO: umount(/dev/loop14) failed, try 1 ...
ima_measurements 1 TINFO: Likely gvfsd-trash is probing newly mounted
fs, kill it to speed up tests.
umount: /root/mntpoint: target is busy.

Fixes: e5dd9c0e7 ("shell: TST_NEEDS_DEVICE implies TST_TMPDIR")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 8d24b4abf..1cf724cbe 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -550,7 +550,7 @@ tst_run()
 
 	_tst_setup_timer
 
-	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_TMPDIR=1
+	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
 	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
 		if [ -z "$TMPDIR" ]; then
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
