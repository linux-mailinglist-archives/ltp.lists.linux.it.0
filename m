Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D03961DAD3E
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 10:26:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C0C03C4E2F
	for <lists+linux-ltp@lfdr.de>; Wed, 20 May 2020 10:26:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CFFA63C4DFC
 for <ltp@lists.linux.it>; Wed, 20 May 2020 10:26:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EE7F41A017D9
 for <ltp@lists.linux.it>; Wed, 20 May 2020 10:26:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ED3FDABE4;
 Wed, 20 May 2020 08:26:16 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 20 May 2020 10:26:06 +0200
Message-Id: <20200520082607.25776-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] tst_test.sh: Fix calling not yet loaded
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
starting the actual test code (after tst_run start).

Fixes: e7dc14caa ("tst_test.sh: Run cleanup even setup is not defined")

Suggested-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v2->v3:
* simplify setup, inspired by Joerg

Kind regards,
Petr

 testcases/lib/tst_test.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 8d24b4abf..4f966df17 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -28,7 +28,9 @@ _tst_do_exit()
 	local ret=0
 	TST_DO_EXIT=1
 
-	if [ -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
+	if [ -n "$TST_RUN_STARTED" -a -n "$TST_CLEANUP" -a \
+		-z "$TST_NO_CLEANUP" ]; then
+
 		$TST_CLEANUP
 	fi
 
@@ -495,6 +497,8 @@ tst_run()
 	local _tst_max
 	local _tst_name
 
+	TST_RUN_STARTED=1
+
 	if [ -n "$TST_TEST_PATH" ]; then
 		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s/[="} \t\/:`].*//'); do
 			case "$_tst_i" in
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
