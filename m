Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CB1D9054
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:52:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09DEA3C3146
	for <lists+linux-ltp@lfdr.de>; Tue, 19 May 2020 08:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B46533C4E7A
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:52:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1A5AA60344D
 for <ltp@lists.linux.it>; Tue, 19 May 2020 08:51:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 859DEAC46;
 Tue, 19 May 2020 06:52:09 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 19 May 2020 08:52:00 +0200
Message-Id: <20200519065201.23295-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] tst_test.sh: Fix calling not yet loaded
 cleanup function
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

e7dc14caa introduced a regression for new API network tests (these using
tst_net.sh), which use network namespaces and have cleanup function:

$ PATH="/opt/ltp/testcases/bin:$PATH" tcp_ipsec.sh -6 -A rfc4543_256 \
  -p esp_aead -m tunnel -s 100:1000:65535:R65535
tcp_ipsec 1 TCONF: Must be super/root for this test!
/opt/ltp/testcases/bin/tst_test.sh: line 32: tst_ipsec_cleanup: command not found

This is caused by tst_brk called in tst_net.sh test preparation (happen
just after loading tst_net.sh, that's why cleanup function haven't been
defined yet. This would require to load tst_net.sh just before tst_run.

But because tst_net.sh doesn't have it's own cleanup function
(tst_cleanup_rhost is always called in _tst_do_exit in tst_test.sh
regardless of setup/cleanup functions), we can assume that only after
starting the actual test code (i.e. running either setup or test
function) it's meaningful to run cleanup function.

This is effectively a revert of e7dc14caa + adding $TST_SETUP_STARTED.

Fixes: e7dc14caa ("tst_test.sh: Run cleanup even setup is not defined")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v1->v2:
* fixed condition (or: $TST_SETUP_STARTED" -o -n "$TST_RUN_STARTED") (Joerg)

Kind regards,
Petr

 testcases/lib/tst_test.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 8d24b4abf..e76a31509 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -28,7 +28,8 @@ _tst_do_exit()
 	local ret=0
 	TST_DO_EXIT=1
 
-	if [ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
+	if [ -n "$TST_SETUP_STARTED" -o -n "$TST_RUN_STARTED" ] && \
+		[ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
 		$TST_CLEANUP
 	fi
 
@@ -582,6 +583,7 @@ tst_run()
 	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
 
 	if [ -n "$TST_SETUP" ]; then
+		TST_SETUP_STARTED=1
 		$TST_SETUP
 	fi
 
@@ -592,9 +594,11 @@ tst_run()
 			_tst_max=$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc -c) +1))
 			for _tst_i in $(seq $_tst_max); do
 				_tst_data="$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$_tst_i)"
+				TST_RUN_STARTED=1
 				_tst_run_tests "$_tst_data"
 			done
 		else
+			TST_RUN_STARTED=1
 			_tst_run_tests
 		fi
 		TST_ITERATIONS=$((TST_ITERATIONS-1))
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
