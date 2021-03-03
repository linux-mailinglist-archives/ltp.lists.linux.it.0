Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 104FE32BA60
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 21:33:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB6AA3C585A
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Mar 2021 21:33:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 147AD3C569D
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 21:33:01 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 29190600D94
 for <ltp@lists.linux.it>; Wed,  3 Mar 2021 21:33:00 +0100 (CET)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id D33BA20B83EA;
 Wed,  3 Mar 2021 12:32:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D33BA20B83EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1614803578;
 bh=h4q9fAxS+MFSgu5p/zIGjIyIrAME+eYN6saW0Oul8qo=;
 h=From:To:Cc:Subject:Date:From;
 b=P4SvIF4PZ6d0XUb5kY8v4QP4MTya8vbrC1YWy1o2EuL7iD+f11GbxBUf56XvVll/I
 nCmJRVFm/UnWE2Lne9LbxHWDiR3rS398HHH8WGGFesMA2fNVnUFeq46/8rIBaX9jH8
 20+0M43yX7PL4P5UQUakY/dHIMARpRVVY56eNTPk=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Wed,  3 Mar 2021 12:32:54 -0800
Message-Id: <20210303203254.12856-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] IMA: Allow only ima-buf template for key measurement
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
Cc: tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ima-buf is the default IMA template used for all buffer measurements.
Therefore, IMA policy rule for measuring keys need not specify
an IMA template.  But if a template is specified for key measurement
rule then it must be only ima-buf.

Update keys tests to not require a template to be specified for
key measurement rule, but if a template is specified verify it is
only ima-buf.

Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
---
 .../security/integrity/ima/tests/ima_keys.sh     | 10 +++++++---
 .../security/integrity/ima/tests/ima_setup.sh    | 16 ++++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index c9eef4b68..8b214b413 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -15,8 +15,7 @@ TST_CLEANUP=cleanup
 . ima_setup.sh
 
 FUNC_KEYCHECK='func=KEY_CHECK'
-TEMPLATE_BUF='template=ima-buf'
-REQUIRED_POLICY="^measure.*($FUNC_KEYCHECK.*$TEMPLATE_BUF|$TEMPLATE_BUF.*$FUNC_KEYCHECK)"
+REQUIRED_POLICY="^measure.*$FUNC_KEYCHECK"
 
 setup()
 {
@@ -33,9 +32,10 @@ check_keys_policy()
 	local pattern="$1"
 
 	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
-		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
+		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
 		return 1
 	fi
+
 	return 0
 }
 
@@ -49,6 +49,8 @@ test1()
 
 	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
 
+	check_policy_template "template=ima-buf" $FUNC_KEYCHECK || return
+
 	check_keys_policy "$pattern" > $tmp_file || return
 	keycheck_lines=$(cat $tmp_file)
 	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
@@ -101,6 +103,8 @@ test2()
 
 	tst_res TINFO "verify measurement of certificate imported into a keyring"
 
+	check_policy_template "template=ima-buf" $FUNC_KEYCHECK || return
+
 	check_keys_policy "$pattern" >/dev/null || return
 
 	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 59a7ffeac..01ebec2b6 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -107,6 +107,22 @@ check_ima_policy_cmdline()
 	return 1
 }
 
+check_policy_template()
+{
+	local template="$1"
+	local func="$2"
+	grep -E "template=" $TST_TMPDIR/policy.txt | while read line
+	do
+		ima_template=$(echo $line | grep $template)
+		if [ -z "$ima_template" ]; then
+			tst_res TCONF "Only $template can be specified for $func"
+			return 1
+		fi
+	done
+
+	return 0
+}
+
 require_ima_policy_cmdline()
 {
 	local policy="$1"
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
