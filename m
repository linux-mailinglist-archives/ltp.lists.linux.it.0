Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CB22BE7F
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 09:00:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E90603C6239
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 09:00:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5F5333C1CB7
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 09:00:45 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2D7FC20007A
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 09:00:44 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11B59ACB5;
 Fri, 24 Jul 2020 07:00:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 24 Jul 2020 09:00:38 +0200
Message-Id: <20200724070038.29491-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724070038.29491-1-pvorel@suse.cz>
References: <20200724070038.29491-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v4 2/2] IMA: Add test for kexec cmdline measurement
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
Cc: balajib@linux.microsoft.com,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Lachlan Sneff <t-josne@linux.microsoft.com>

IMA policy can be set to measure the command line passed in the kexec
system call. Add a testcase that verifies that the IMA subsystem
correctly measure the cmdline specified during a kexec.

Note that this test does not actually reboot.

Ideally, test shouldn't even require an image, since it doesn't actually
reboot, but the IMA cmdline measurement occurs after the image is parsed
and verified, so we must pass a valid kernel image.

There is a possibility of putting together a dummy kernel image that has
the right headers and appears to be signed correctly, but doesn't
actually contain any code, but, after investigating that possibility, it
appears to be quite difficult (and would require a dummy kernel for each
arch).

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

sent version with few my fixes.
@Mimi: could you please have a quick look? (I know you reviewed previous
version.)

Kind regards,
Petr

 runtest/ima                                   |   1 +
 .../kernel/security/integrity/ima/README.md   |  11 ++
 .../security/integrity/ima/tests/ima_kexec.sh | 100 ++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_kexec.sh

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
index 732cd912f..f28bc8e8c 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -36,6 +36,17 @@ CONFIG_SYSTEM_TRUSTED_KEYS="/etc/keys/ima-local-ca.pem"
 
 Test also requires loaded policy with `func=KEY_CHECK`, see example in `keycheck.policy`.
 
+### IMA kexec test
+
+This test requires that the ima policy contains:
+```
+measure func=KEXEC_CMDLINE
+```
+
+Even though the test does not actually reboot, it does require a valid,
+signed kernel image (defined with `$IMA_KEXEC_IMAGE` environment variable,
+default `/boot/vmlinuz-$(uname r)`).
+
 ## EVM tests
 
 `evm_overlay.sh` requires a builtin IMA appraise tcb policy (e.g. `ima_policy=appraise_tcb`
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
new file mode 100755
index 000000000..15bbca03d
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/tests/ima_kexec.sh
@@ -0,0 +1,100 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Microsoft Corporation
+# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
+#
+# Verify that kexec cmdline is measured correctly.
+
+TST_NEEDS_CMDS="grep kexec sed tr xargs"
+TST_CNT=1
+TST_NEEDS_DEVICE=1
+
+. ima_setup.sh
+
+IMA_KEXEC_IMAGE="${IMA_KEXEC_IMAGE:-/boot/vmlinuz-$(uname -r)}"
+
+measure() {
+	local algorithm digest expected_digest found
+	local temp_file="file.txt" temp_file2="file2.txt"
+
+	echo -n "$1" > $temp_file
+	grep "kexec-cmdline" $ASCII_MEASUREMENTS > $temp_file2
+
+	while read found
+	do
+		algorithm=$(echo "$found" | cut -d' ' -f4 | cut -d':' -f1)
+		digest=$(echo "$found" | cut -d' ' -f4 | cut -d':' -f2)
+
+		expected_digest=$(compute_digest $algorithm $temp_file)
+
+		if [ "$digest" = "$expected_digest" ]; then
+			return 0
+		fi
+	done < $temp_file2
+
+	return 1
+}
+
+# Test that the kexec cmdline is measured correctly.
+# NOTE: This does *not* actually reboot.
+test1() {
+	if [ ! -f "$IMA_KEXEC_IMAGE" ]; then
+		tst_brk TCONF "Kernel image not found ('$IMA_KEXEC_IMAGE'), specify it in \$IMA_KEXEC_IMAGE"
+	fi
+
+	# Strip the `BOOT_IMAGE=...` part from the cmdline.
+	local cmdline="$(sed 's/BOOT_IMAGE=[^ ]* //' /proc/cmdline)"
+
+	if ! kexec -sl $IMA_KEXEC_IMAGE --reuse-cmdline; then
+		tst_res TCONF "kexec failed: $?"
+
+		local sb_status="$(bootctl status 2>/dev/null | grep 'Secure Boot' \
+			| tr -d ' ' | sed 's/SecureBoot:*//')"
+
+		if [ "$sb_status" = "enabled" ]; then
+			tst_res TINFO "secure boot is enabled, the specified kernel image may not be signed"
+		fi
+
+		return
+	fi
+
+	kexec -su
+
+	if ! measure "$cmdline"; then
+		tst_res TFAIL "unable to find a correct entry in the IMA log"
+
+		check_policy_readable
+
+		if ! grep "measure func=KEXEC_CMDLINE" $IMA_POLICY >/dev/null; then
+			tst_brk TCONF "The IMA policy does not specify 'measure func=KEXEC_CMDLINE', see IMA test README"
+		fi
+
+		return
+	fi
+
+	cmdline="foo"
+	if ! kexec -sl $IMA_KEXEC_IMAGE --append=$cmdline; then
+		tst_brk TCONF "kexec failed: $?"
+	fi
+
+	kexec -su
+
+	if ! measure "$cmdline"; then
+		tst_brk TFAIL "unable to find a correct entry in the IMA log"
+	fi
+
+	cmdline="bar"
+	if ! kexec -sl $IMA_KEXEC_IMAGE --command-line=$cmdline; then
+		tst_brk TCONF "kexec failed: $?"
+	fi
+
+	kexec -su
+
+	if ! measure "$cmdline"; then
+		tst_brk TFAIL "unable to find a correct entry in the IMA log"
+	fi
+
+	tst_res TPASS "kexec cmdline was measured correctly"
+}
+
+tst_run
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
