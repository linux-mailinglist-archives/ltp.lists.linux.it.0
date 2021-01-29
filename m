Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA580308D8A
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:31 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 72DC13C7812
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 20:42:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id ECC503C100E
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B69C5601D5D
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 20:42:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AA75B11A;
 Fri, 29 Jan 2021 19:42:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 29 Jan 2021 20:41:43 +0100
Message-Id: <20210129194144.31299-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129194144.31299-1-pvorel@suse.cz>
References: <20210129194144.31299-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [RFC PATCH v2 5/6] tst_test.sh: Run _tst_setup_timer after
 $TST_SETUP
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

Postpone starting timer a bit after the execution allow to setup
timer in test setup. This is useful if test length depends on input
decided during setup.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v2.

Hi,

I'm ok, if you consider this risky.
Next commit can be then changed to have TST_TIMEOUT=-1.

Kind regards,
Petr

 doc/test-writing-guidelines.txt | 5 ++++-
 testcases/lib/tst_test.sh       | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index f3a55cf26..61dccd400 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2398,7 +2398,10 @@ simply by setting right '$TST_NEEDS_FOO'.
 | 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be int >= 1,
                        or -1 (special value to disable timeout), default is 300.
                        Variable is meant be set in tests, not by user.
-                       It's equivalent of `tst_test.timeout` in C.
+                       It's equivalent of `tst_test.timeout` in C, but (unlike
+                       the C API) it can be set also in the setup function.
+                       This is useful if test length depends on input decided
+                       during setup.
 |=============================================================================
 
 NOTE: Network tests (see testcases/network/README.md) use additional variables
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 69f007d89..4fa1674cd 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -552,8 +552,6 @@ tst_run()
 			tst_brk TCONF "test requires kernel $TST_MIN_KVER+"
 	fi
 
-	_tst_setup_timer
-
 	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
 	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
@@ -594,6 +592,8 @@ tst_run()
 		fi
 	fi
 
+	_tst_setup_timer
+
 	#TODO check that test reports some results for each test function call
 	while [ $TST_ITERATIONS -gt 0 ]; do
 		if [ -n "$TST_TEST_DATA" ]; then
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
