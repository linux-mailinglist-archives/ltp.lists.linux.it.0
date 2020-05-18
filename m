Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 654301D7925
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 15:01:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 21F753C003A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 15:01:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 0CCA73C1D8A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 15:01:43 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C17A9201170
 for <ltp@lists.linux.it>; Mon, 18 May 2020 15:01:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 747FFAF3B;
 Mon, 18 May 2020 13:01:44 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 May 2020 15:01:32 +0200
Message-Id: <20200518130132.19312-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518130132.19312-1-pvorel@suse.cz>
References: <20200518130132.19312-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_test.sh: Warn about setup/cleanup function
 not loaded
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Inspired by regression fixed by previous commit.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_test.sh | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index aa74ad761..cd5bdeae7 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -30,7 +30,11 @@ _tst_do_exit()
 
 	if [ -n "$TST_SETUP_STARTED" -a -n "$TST_RUN_STARTED" -a \
 		-n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
-		$TST_CLEANUP
+		if type "$TST_CLEANUP" >/dev/null 2>&1; then
+			$TST_CLEANUP
+		else
+			tst_res TWARN "cleanup function set (TST_SETUP='$TST_CLEANUP'), but not found (test bug)"
+		fi
 	fi
 
 	if [ "$TST_NEEDS_DEVICE" = 1 -a "$TST_DEVICE_FLAG" = 1 ]; then
@@ -585,6 +589,11 @@ tst_run()
 	if [ -n "$TST_SETUP" ]; then
 		TST_SETUP_STARTED=1
 		$TST_SETUP
+		if type "$TST_SETUP" >/dev/null 2>&1; then
+			$TST_SETUP
+		else
+			tst_res TWARN "setup function set (TST_SETUP='$TST_SETUP'), but not found (test bug)"
+		fi
 	fi
 
 	#TODO check that test reports some results for each test function call
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
