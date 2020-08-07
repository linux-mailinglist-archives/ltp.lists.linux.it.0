Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5523F3F6
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D0EE43C322E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2F72D3C2334
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 922A1140183C
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76FE5AD0B;
 Fri,  7 Aug 2020 20:47:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 22:46:52 +0200
Message-Id: <20200807204652.5928-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200807204652.5928-1-pvorel@suse.cz>
References: <20200807204652.5928-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/4] IMA/ima_keys.sh: Enhance policy checks
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
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reuse policy check code.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../security/integrity/ima/tests/ima_keys.sh  | 39 ++++++++++++-------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index 30950904e..5735568ee 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -9,27 +9,41 @@
 TST_NEEDS_CMDS="cmp cut grep sed tr xxd"
 TST_CNT=2
 TST_NEEDS_DEVICE=1
+TST_SETUP="setup"
 
 . ima_setup.sh
 
+KEYCHECK_POLICY='func=KEY_CHECK'
+
+setup()
+{
+	require_ima_policy_content "^measure.*$KEYCHECK_POLICY"
+}
+
+check_keys_policy()
+{
+	local pattern="$1"
+
+	pattern="^measure.*($KEYCHECK_POLICY.*$pattern|$pattern.*$KEYCHECK_POLICY)"
+	if ! check_ima_policy_content "$pattern" '-E'; then
+		tst_res TCONF "IMA policy does not specify '$pattern'"
+		return 1
+	fi
+	return 0
+}
+
+
 # Based on https://lkml.org/lkml/2019/12/13/564.
 # (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
 test1()
 {
-	local keyrings keycheck_lines keycheck_line templates
-	local pattern="func=KEY_CHECK"
+	local keycheck_line keyrings templates
+	local pattern='keyrings=[^[:space:]]+'
 	local test_file="file.txt"
 
 	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
 
-	require_ima_policy_content "$pattern"
-	keycheck_lines=$(check_ima_policy_content "$pattern" "")
-	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
-
-	if [ -z "$keycheck_line" ]; then
-		tst_res TCONF "IMA policy does not specify a keyrings to check"
-		return
-	fi
+	keycheck_line=$(check_keys_policy "$pattern") || return
 
 	keyrings=$(echo "$keycheck_line" | tr " " "\n" | grep "keyrings" | \
 		sed "s/\./\\\./g" | cut -d'=' -f2)
@@ -73,14 +87,13 @@ test2()
 
 	local cert_file="$TST_DATAROOT/x509_ima.der"
 	local keyring_name="key_import_test"
+	local pattern="keyrings=[^[:space:]]*$keyring_name"
 	local temp_file="file.txt"
 	local keyring_id
 
 	tst_res TINFO "verify measurement of certificate imported into a keyring"
 
-	if ! check_ima_policy_content "^measure.*func=KEY_CHECK.*keyrings=.*$keyring_name"; then
-		tst_brk TCONF "IMA policy does not contain $keyring_name keyring"
-	fi
+	check_keys_policy "$pattern" >/dev/null || return
 
 	keyctl new_session > /dev/null
 
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
