Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E972D344D82
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 18:37:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56CD23C94ED
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Mar 2021 18:37:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A10DE3C8FFF
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 18:37:25 +0100 (CET)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 20CC420090C
 for <ltp@lists.linux.it>; Mon, 22 Mar 2021 18:37:23 +0100 (CET)
Received: from localhost.localdomain (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id D7F1820B5680;
 Mon, 22 Mar 2021 10:37:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D7F1820B5680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1616434642;
 bh=tdGJSpOdd+gNYUBE8bMuVd7jMmyGBCn5ESFEGuTl1p4=;
 h=From:To:Cc:Subject:Date:From;
 b=oirmxqTOkw5+q4GobYuRoKIm0QQv3qx6zGhzLn9hgM8NzcVt864Nd3LA4raCAnmkj
 9rvfliNq/P9TKZgRl2RpW8L4Vz8JDTUbaTxCh/9WNhHyi8bMH0JvD3ZMU/OQoezO5s
 WkAu8LSRDnghrPBAGP6Z9oh7sGH6/B74N8Oyz1w4=
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com
Date: Mon, 22 Mar 2021 10:37:09 -0700
Message-Id: <20210322173709.22150-1-nramas@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4] IMA: Allow only ima-buf template for key
 measurement
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
 .../kernel/security/integrity/ima/README.md   |  9 +++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 20 ++++++++++++++++---
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index 8f2249767..1aaa734a3 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -28,6 +28,15 @@ policy allowed in the kernel configuration:
 ```
 CONFIG_IMA_READ_POLICY=y
 ```
+If the IMA key tests are executed on Linux kernel v5.6 through v5.10,
+`ima-buf` template should be specified in the IMA policy rule for
+key measurement. For example,
+`measure func=KEY_CHECK keyrings=key_import_test template=ima-buf`
+
+If the IMA key tests are executed on Linux kernel v5.11 or later,
+`template=ima-buf` is optional in the IMA policy rule for key measurement.
+For example,
+`measure func=KEY_CHECK keyrings=key_import_test`
 
 ### IMA kexec test
 
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
index c9eef4b68..b9bef4feb 100755
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
@@ -28,12 +27,23 @@ cleanup()
 	tst_is_num $KEYRING_ID && keyctl clear $KEYRING_ID
 }
 
+check_policy_template()
+{
+	while read line; do
+	if ( echo $line | grep -q 'template=') && ( ! echo $line | grep -q 'template=ima-buf' ); then
+		tst_res TCONF "only template=ima-buf can be specified for KEY_CHECK"
+		return 1
+	fi
+	done < $TST_TMPDIR/policy.txt
+	return 0
+}
+
 check_keys_policy()
 {
 	local pattern="$1"
 
 	if ! grep -E "$pattern" $TST_TMPDIR/policy.txt; then
-		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK, $TEMPLATE_BUF"
+		tst_res TCONF "IMA policy must specify $pattern, $FUNC_KEYCHECK"
 		return 1
 	fi
 	return 0
@@ -49,6 +59,8 @@ test1()
 
 	tst_res TINFO "verify key measurement for keyrings and templates specified in IMA policy"
 
+	check_policy_template || return
+
 	check_keys_policy "$pattern" > $tmp_file || return
 	keycheck_lines=$(cat $tmp_file)
 	keyrings=$(for i in $keycheck_lines; do echo "$i" | grep "keyrings" | \
@@ -101,6 +113,8 @@ test2()
 
 	tst_res TINFO "verify measurement of certificate imported into a keyring"
 
+	check_policy_template || return
+
 	check_keys_policy "$pattern" >/dev/null || return
 
 	KEYRING_ID=$(keyctl newring $keyring_name @s) || \
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
