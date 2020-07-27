Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB922FC31
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:31:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE0453C27D0
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Jul 2020 00:31:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4ECBA3C26BF
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 6C24560137E
 for <ltp@lists.linux.it>; Tue, 28 Jul 2020 00:30:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 258DBAC37;
 Mon, 27 Jul 2020 22:31:02 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 28 Jul 2020 00:30:38 +0200
Message-Id: <20200727223041.13110-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727223041.13110-1-pvorel@suse.cz>
References: <20200727223041.13110-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/4] IMA: Rename helper to
 require_ima_policy_cmdline
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
Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 balajib@linux.microsoft.com, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

To be clear we check /proc/cmdline. There will be another helper
function require_ima_policy_content().

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
New in v5.

 testcases/kernel/security/integrity/ima/tests/evm_overlay.sh    | 2 +-
 .../kernel/security/integrity/ima/tests/ima_measurements.sh     | 2 +-
 testcases/kernel/security/integrity/ima/tests/ima_setup.sh      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh b/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
index ac209e430..9d86778b6 100755
--- a/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
+++ b/testcases/kernel/security/integrity/ima/tests/evm_overlay.sh
@@ -19,7 +19,7 @@ setup()
 	[ -f "$EVM_FILE" ] || tst_brk TCONF "EVM not enabled in kernel"
 	[ $(cat $EVM_FILE) -eq 1 ] || tst_brk TCONF "EVM not enabled for this boot"
 
-	check_ima_policy "appraise_tcb"
+	require_ima_policy_cmdline "appraise_tcb"
 
 	lower="$TST_MNTPOINT/lower"
 	upper="$TST_MNTPOINT/upper"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
index 04d8e6353..9a7500c76 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
@@ -15,7 +15,7 @@ TST_NEEDS_DEVICE=1
 
 setup()
 {
-	check_ima_policy "tcb"
+	require_ima_policy_cmdline "tcb"
 
 	TEST_FILE="$PWD/test.txt"
 	POLICY="$IMA_DIR/policy"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 8ae477c1c..975ce9cbb 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -54,7 +54,7 @@ compute_digest()
 	return 1
 }
 
-check_ima_policy()
+require_ima_policy_cmdline()
 {
 	local policy="$1"
 	local i
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
