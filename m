Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66961229F80
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:47:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 296D23C7F60
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 20:47:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 27B213C1D5C
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:47:50 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 932CA1A00FAB
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 20:47:49 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9DB1E20B4908;
 Wed, 22 Jul 2020 11:47:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9DB1E20B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1595443668;
 bh=KgDhk3pb5g9v+6urunGPeZ2gYMKw/7DWtt31eUbTvJc=;
 h=From:To:Cc:Subject:Date:From;
 b=KAq5fY0P34zD34/KdGSmEs49b3TPZa1K7nMOC521pSteTkDi75hQg06iEsJ8gkqGr
 RG2mqPRHOnJU9cPUPzgziKZd+vDmqOFmdF/hniatgMiyyIz7A/Q8p954rYym1j0pxc
 R5gi/o32wVQe+dhPcH9N+7Y0HjKS14cqSFJy8YXM=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: zohar@linux.ibm.com,
	pvorel@suse.cz,
	ltp@lists.linux.it
Date: Wed, 22 Jul 2020 14:47:39 -0400
Message-Id: <20200722184739.19460-1-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] IMA: Add test for kexec cmdline measurement
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
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
 balajib@linux.microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

IMA policy can be set to measure the command line passed in the kexec system call.
There needs to be a test to validate this kexec command line measurement.

Add a testcase that verifies that the IMA subsystem has correctly
measured the cmdline specified during a kexec.

Note that this test does not actually reboot.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 runtest/ima                                   |   1 +
 .../kernel/security/integrity/ima/README.md   |  11 ++
 .../security/integrity/ima/tests/ima_kexec.sh | 121 ++++++++++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 testcases/kernel/security/integrity/ima/tests/ima_kexec.sh

diff --git a/runtest/ima b/runtest/ima
index 309d47420..5f4b4a7a1 100644
--- a/runtest/ima
+++ b/runtest/ima
@@ -4,4 +4,5 @@ ima_policy ima_policy.sh
 ima_tpm ima_tpm.sh
 ima_violations ima_violations.sh
 ima_keys ima_keys.sh
+ima_kexec ima_kexec.sh
 evm_overlay evm_overlay.sh
diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index db8819a99..926eb8478 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -30,6 +30,17 @@ measure func=KEY_CHECK keyrings=key_import_test template=ima-buf
 
 The test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
 
+### IMA kexec test
+
+This test requires that the ima policy contains:
+```
+measure func=KEXEC_CMDLINE
+```
+
+Even though the test does not actually reboot, it does require a valid,
+signed kernel image. By default, the test will look in `/boot/vmlinuz-$(uname r)`,
+but if no image is accessible there, a valid image be must be placed at `/tmp/Image`.
+
 ## EVM tests
 
 `evm_overlay.sh` requires a builtin IMA appraise tcb policy (e.g. `ima_policy=appraise_tcb`
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
new file mode 100644
index 000000000..7e3ecaec8
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
@@ -0,0 +1,121 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Microsoft Corporation
+# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
+#
+# Verify that kexec cmdline is measured correctly.
+
+TST_NEEDS_CMDS="kexec sed xargs printf grep tr"
+TST_CNT=1
+TST_NEEDS_DEVICE=1
+
+. ima_setup.sh
+
+# Since the test is executed inside some sort of
+# separate shell, *most* environment variables are
+# not accessible, so there's no way to set it from
+# the outside.
+#
+# `/boot/vmlinuz-$(uname-r)` is where the image is
+# located on many systems, but not all. Therefore,
+# if the image is not located there, require the
+# user to copy it to `/tmp/Image`.
+#
+# Ideally, this test shouldn't even require an image,
+# since it doesn't actually reboot, but the IMA cmdline
+# measurement occurs after the image is parsed and
+# verified, so we must pass a valid kernel image. There
+# is a possiblity of putting together a "faux" kernel
+# image that has the right headers and appears to be
+# signed correctly, but doesn't actually contain any
+# code, but, after investigating that possiblity, it
+# appears to be quite difficult (and would require a
+# new faux kernel for each arch).
+IMAGE="/boot/vmlinuz-$(uname -r)"
+if [ ! -f $IMAGE ]; then
+    IMAGE="/tmp/Image"
+fi
+
+measure() {
+    local found temp_file="file.txt" temp_file2="file2.txt" algorithm \
+        digest expected_digest
+
+    echo -n "$1" > $temp_file
+    grep "kexec-cmdline" $ASCII_MEASUREMENTS > $temp_file2
+
+    while read found
+    do
+        algorithm=$(echo "$found" | cut -d' ' -f4 | cut -d':' -f1)
+        digest=$(echo "$found" | cut -d' ' -f4 | cut -d':' -f2)
+
+        expected_digest=$(compute_digest $algorithm $temp_file)
+
+        if [ "$digest" = "$expected_digest" ]; then
+            return 0
+        fi
+    done < $temp_file2
+
+    return 1
+}
+
+# Test that the kexec cmdline is measured correctly.
+# NOTE: This does *not* actually reboot.
+test1() {
+    # Strip the `BOOT_IMAGE=...` part from the cmdline.
+    local cmdline="$(sed 's/BOOT_IMAGE=[^ ]* //' /proc/cmdline)"
+
+    if ! kexec -sl $IMAGE --reuse-cmdline; then
+        tst_res TCONF "kexec failed: $?"
+
+        local sb_status="$(bootctl status 2>/dev/null | grep 'Secure Boot' \
+            | tr -d ' ' | sed 's/SecureBoot:*//')"
+
+        if [ "$sb_status" = "enabled" ]; then
+            tst_res TINFO "secure boot is enabled, the specified kernel image may not be signed"
+        fi
+
+        return
+    fi
+
+    kexec -su
+
+    if ! measure "$cmdline"; then
+        tst_res TFAIL "unable to find a correct entry in the IMA log"
+
+        if [ ! -r $IMA_POLICY ]; then
+            tst_brk TCONF "cannot read IMA policy (CONFIG_IMA_READ_POLICY=y required) to give contextual information"
+        fi
+
+        if ! grep "measure func=KEXEC_CMDLINE" $IMA_POLICY >/dev/null; then
+            tst_brk TCONF "The IMA policy does not specify 'measure func=KEXEC_CMDLINE', see IMA test README"
+        fi
+
+        return
+    fi
+
+    cmdline="foo"
+    if ! kexec -sl $IMAGE --append=$cmdline; then
+        tst_brk TCONF "kexec failed: $?"
+    fi
+
+    kexec -su
+
+    if ! measure "$cmdline"; then
+        tst_brk TFAIL "unable to find a correct entry in the IMA log"
+    fi
+
+    cmdline="bar"
+    if ! kexec -sl $IMAGE --command-line=$cmdline; then
+        tst_brk TCONF "kexec failed: $?"
+    fi
+
+    kexec -su
+
+    if ! measure "$cmdline"; then
+        tst_brk TFAIL "unable to find a correct entry in the IMA log"
+    fi
+
+    tst_res TPASS "kexec cmdline was measured correctly"
+}
+
+tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
