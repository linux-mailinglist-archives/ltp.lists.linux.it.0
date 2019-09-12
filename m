Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EECD3B1589
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 22:46:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73FD83C20AE
	for <lists+linux-ltp@lfdr.de>; Thu, 12 Sep 2019 22:46:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id B9D6B3C0428
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 22:46:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 57D171400DFB
 for <ltp@lists.linux.it>; Thu, 12 Sep 2019 22:46:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9462CB601;
 Thu, 12 Sep 2019 20:46:45 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 Sep 2019 22:46:39 +0200
Message-Id: <20190912204639.1080-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] shell/tst_res: Return exit value
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

this is a preparation for route shell test v5.
Simple patch, hope there are no bad consequences,
side effects of this change.

return 1 after tst_res TCONF "'$cmd' not found"
in tst_check_cmds() could be now deleted,
but I kept it as it's more readable.

 testcases/lib/tst_test.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0b24c6b9..8ac5e35a2 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -93,6 +93,9 @@ _tst_inc_res()
 	esac
 }
 
+# exit code:
+# 0: TINFO, TPASS
+# 1: TBROK, TCONF, TFAIL, TWARN
 tst_res()
 {
 	local res=$1
@@ -106,6 +109,7 @@ tst_res()
 	printf "$TST_ID $TST_COUNT "
 	tst_print_colored $res "$res: "
 	echo "$@"
+	[ "$res" = TINFO -o "$res" = TPASS ]
 }
 
 tst_brk()
@@ -139,6 +143,7 @@ ROD()
 	fi
 }
 
+# exit code: 0 on TPASS, 1: TFAIL
 EXPECT_PASS()
 {
 	tst_rod "$@"
@@ -149,6 +154,7 @@ EXPECT_PASS()
 	fi
 }
 
+# exit code: 0 on TPASS, 1: TFAIL
 EXPECT_FAIL()
 {
 	# redirect stderr since we expect the command to fail
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
