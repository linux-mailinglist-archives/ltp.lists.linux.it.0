Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6426220AA64
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 04:11:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC5493C58CB
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jun 2020 04:11:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4DB6F3C58C5
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 04:11:37 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id F02421A00F48
 for <ltp@lists.linux.it>; Fri, 26 Jun 2020 04:11:36 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5051F20B7188;
 Thu, 25 Jun 2020 19:11:34 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5051F20B7188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1593137495;
 bh=FHSClY2SUcQRvZXJcVlK6my/2wMKs0fYNvAPHkdJ95E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IxBTOqgwCQJabNCUdYhxp7Cs9cGrEqgXS3GjLNNr/KEQ5AeZk+3zmHXrCGUPwjoTk
 KrOgJLSUNubvoSt7uIXAl1pbbVZeW30PROtnzDTAmj7WK7BMwA+IiYwrTTW+xaQBA4
 xODZKMsl2ojhowuTCmn0JjGTruc2U8UEs3fsmbps=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com, pvorel@suse.cz, nramas@linux.microsoft.com,
 ltp@lists.linux.it
Date: Thu, 25 Jun 2020 22:11:25 -0400
Message-Id: <20200626021126.56760-2-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626021126.56760-1-t-josne@linux.microsoft.com>
References: <20200626021126.56760-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 1/2] IMA: Add a test to verify measurment of keys
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
Cc: balajib@linux.microsoft.com, linux-integrity@vger.kernel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add a testcase that verifies that the IMA subsystem has correctly
measured keys added to keyrings specified in the IMA policy file.

Additionally, add support for handling a new IMA template descriptor,
namely ima-buf[1], in the IMA measurement tests.

[1]: https://www.kernel.org/doc/html/latest/security/IMA-templates.html#use

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 runtest/ima                                   |  1 +
 .../integrity/ima/datafiles/keycheck.policy   |  1 +
 .../security/integrity/ima/tests/ima_keys.sh  | 72 +++++++++++++++++++
 .../integrity/ima/tests/ima_measurements.sh   | 36 +---------
 .../integrity/ima/tests/ima_policy.sh         |  1 -
 .../security/integrity/ima/tests/ima_setup.sh | 35 +++++++++
 6 files changed, 110 insertions(+), 36 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_keys.sh

diff --git a/runtest/ima b/runtest/ima
index f3ea88cf0..309d47420 100644
--- a/runtest/ima
+++ b/runtest/ima
@@ -3,4 +3,5 @@ ima_measurements ima_measurements.sh
 ima_policy ima_policy.sh
 ima_tpm ima_tpm.sh
 ima_violations ima_violations.sh
+ima_keys ima_keys.sh
 evm_overlay evm_overlay.sh
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy b/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
new file mode 100644
index 000000000..3f1934a3d
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
@@ -0,0 +1 @@
+measure func=KEY_CHECK keyrings=.ima|.evm|.builtin_trusted_keys|.blacklist template=ima-buf
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_keys.sh b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
new file mode 100755
index 000000000..94eb15e09
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/tests/ima_keys.sh
@@ -0,0 +1,72 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Microsoft Corporation
+# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
+#
+# Verify that keys are measured correctly based on policy.
+
+TST_NEEDS_CMDS="grep mktemp cut sed tr"
+TST_CNT=1
+TST_NEEDS_DEVICE=1
+
+. ima_setup.sh
+
+# Based on https://lkml.org/lkml/2019/12/13/564.
+# (450d0fd51564 - "IMA: Call workqueue functions to measure queued keys")
+test1()
+{
+	local keyrings keycheck_lines keycheck_line templates test_file="file.txt"
+
+	tst_res TINFO "verifying key measurement for keyrings and templates specified in IMA policy file"
+
+	[ -f $IMA_POLICY ] || tst_brk TCONF "missing $IMA_POLICY"
+
+	[ -r $IMA_POLICY ] || tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required)"
+
+	keycheck_lines=$(grep "func=KEY_CHECK" $IMA_POLICY)
+	if [ -z "$keycheck_lines" ]; then
+		tst_brk TCONF "ima policy does not specify \"func=KEY_CHECK\""
+	fi
+
+	keycheck_line=$(echo "$keycheck_lines" | grep "keyrings" | head -n1)
+
+	if [ -z "$keycheck_line" ]; then
+		tst_brk TCONF "ima policy does not specify a keyrings to check"
+	fi
+
+	keyrings=$(echo "$keycheck_line" | tr " " "\n" | grep "keyrings" | \
+		sed "s/\./\\\./g" | cut -d'=' -f2)
+	if [ -z "$keyrings" ]; then
+		tst_brk TCONF "ima policy has a keyring key-value specifier, but no specified keyrings"
+	fi
+
+	templates=$(echo "$keycheck_line" | tr " " "\n" | grep "template" | \
+		cut -d'=' -f2)
+
+	success=true
+
+	grep -E "($templates)*($keyrings)" $ASCII_MEASUREMENTS | while read line
+	do
+		local digest expected_digest algorithm
+
+		digest=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f2)
+		algorithm=$(echo "$line" | cut -d' ' -f4 | cut -d':' -f1)
+		keyring=$(echo "$line" | cut -d' ' -f5)
+
+		echo "$line" | cut -d' ' -f6 | xxd -r -p > $test_file
+
+		expected_digest="$(compute_digest $algorithm $test_file)" || \
+			tst_brk TCONF "cannot compute digest for $algorithm"
+
+		if [ "$digest" != "$expected_digest" ]; then
+			$success=false
+			tst_res TFAIL "incorrect digest was found for the ($keyring) keyring"
+		fi
+	done
+
+	if $success; then
+		tst_res TPASS "specified keyrings were measured correctly"
+	fi
+}
+
+tst_run
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
index 54237d688..04d8e6353 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_measurements.sh
@@ -28,7 +28,7 @@ setup()
 	# parse digest index
 	# https://www.kernel.org/doc/html/latest/security/IMA-templates.html#use
 	case "$template" in
-	ima|ima-ng|ima-sig) DIGEST_INDEX=4 ;;
+	ima|ima-ng|ima-sig|ima-buf) DIGEST_INDEX=4 ;;
 	*)
 		# using ima_template_fmt kernel parameter
 		local IFS="|"
@@ -46,40 +46,6 @@ setup()
 		"Cannot find digest index (template: '$template')"
 }
 
-# TODO: find support for rmd128 rmd256 rmd320 wp256 wp384 tgr128 tgr160
-compute_digest()
-{
-	local algorithm="$1"
-	local file="$2"
-	local digest
-
-	digest="$(${algorithm}sum $file 2>/dev/null | cut -f1 -d ' ')"
-	if [ -n "$digest" ]; then
-		echo "$digest"
-		return 0
-	fi
-
-	digest="$(openssl $algorithm $file 2>/dev/null | cut -f2 -d ' ')"
-	if [ -n "$digest" ]; then
-		echo "$digest"
-		return 0
-	fi
-
-	# uncommon ciphers
-	local arg="$algorithm"
-	case "$algorithm" in
-	tgr192) arg="tiger" ;;
-	wp512) arg="whirlpool" ;;
-	esac
-
-	digest="$(rdigest --$arg $file 2>/dev/null | cut -f1 -d ' ')"
-	if [ -n "$digest" ]; then
-		echo "$digest"
-		return 0
-	fi
-	return 1
-}
-
 ima_check()
 {
 	local delimiter=':'
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
index 6286277b4..244cf081d 100755
--- a/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_policy.sh
@@ -23,7 +23,6 @@ check_policy_writable()
 
 setup()
 {
-	IMA_POLICY="$IMA_DIR/policy"
 	check_policy_writable
 
 	VALID_POLICY="$TST_DATAROOT/measure.policy"
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
index 58a12eda3..8ae477c1c 100644
--- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
+++ b/testcases/kernel/security/integrity/ima/tests/ima_setup.sh
@@ -20,6 +20,40 @@ SYSFS="/sys"
 UMOUNT=
 TST_FS_TYPE="ext3"
 
+# TODO: find support for rmd128 rmd256 rmd320 wp256 wp384 tgr128 tgr160
+compute_digest()
+{
+	local algorithm="$1"
+	local file="$2"
+	local digest
+
+	digest="$(${algorithm}sum $file 2>/dev/null | cut -f1 -d ' ')"
+	if [ -n "$digest" ]; then
+		echo "$digest"
+		return 0
+	fi
+
+	digest="$(openssl $algorithm $file 2>/dev/null | cut -f2 -d ' ')"
+	if [ -n "$digest" ]; then
+		echo "$digest"
+		return 0
+	fi
+
+	# uncommon ciphers
+	local arg="$algorithm"
+	case "$algorithm" in
+	tgr192) arg="tiger" ;;
+	wp512) arg="whirlpool" ;;
+	esac
+
+	digest="$(rdigest --$arg $file 2>/dev/null | cut -f1 -d ' ')"
+	if [ -n "$digest" ]; then
+		echo "$digest"
+		return 0
+	fi
+	return 1
+}
+
 check_ima_policy()
 {
 	local policy="$1"
@@ -85,6 +119,7 @@ ima_setup()
 	[ -d "$IMA_DIR" ] || tst_brk TCONF "IMA not enabled in kernel"
 	ASCII_MEASUREMENTS="$IMA_DIR/ascii_runtime_measurements"
 	BINARY_MEASUREMENTS="$IMA_DIR/binary_runtime_measurements"
+	IMA_POLICY="$IMA_DIR/policy"
 
 	print_ima_config
 
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
