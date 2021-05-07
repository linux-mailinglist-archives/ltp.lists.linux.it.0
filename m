Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98672376A90
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 21:14:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E30B3C9892
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 21:14:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EB8B83C563C
 for <ltp@lists.linux.it>; Fri,  7 May 2021 21:14:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 762B2601211
 for <ltp@lists.linux.it>; Fri,  7 May 2021 21:14:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D4A1B164;
 Fri,  7 May 2021 19:14:22 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 May 2021 21:14:14 +0200
Message-Id: <20210507191414.14795-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507191414.14795-1-pvorel@suse.cz>
References: <20210507191414.14795-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/3] IMA: Add test for dm-crypt measurement
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Tushar Sugandhi <tusharsu@linux.microsoft.com>

New functionality is being added to IMA to measure data provided by
kernel components. With this feature, IMA policy can be set to enable
measuring data provided by device-mapper targets. Currently one such
device-mapper target - dm-crypt, is being updated to use this
functionality. This new functionality needs test automation in LTP.

Add a testcase which verifies that the IMA subsystem correctly measures
the data coming from a device-mapper target - dm-crypt.

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Tushar Sugandhi <tusharsu@linux.microsoft.com>
[ pvorel: rebased: removed template=ima-buf, added policy example, cleanup ]
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
The same as in v3.

 .../kernel/security/integrity/ima/README.md   | 20 ++++++++
 .../security/integrity/ima/datafiles/Makefile |  2 +-
 .../ima/datafiles/ima_dm_crypt/Makefile       | 11 +++++
 .../ima_dm_crypt/ima_dm_crypt.policy          |  1 +
 .../integrity/ima/tests/ima_dm_crypt.sh       | 47 +++++++++++++++++++
 5 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/Makefile
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/ima_dm_crypt.policy
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

diff --git a/testcases/kernel/security/integrity/ima/README.md b/testcases/kernel/security/integrity/ima/README.md
index 5b261a191..767d98a22 100644
--- a/testcases/kernel/security/integrity/ima/README.md
+++ b/testcases/kernel/security/integrity/ima/README.md
@@ -65,6 +65,26 @@ CONFIG_SECURITY_SELINUX=y
 CONFIG_IMA_READ_POLICY=y
 ```
 
+### IMA DM target (dm-crypt) measurement test
+
+To enable IMA to measure device-mapper target - dm-crypt,
+`ima_dm_crypt.sh` requires a readable IMA policy, as well as
+a loaded measure policy with `func=CRITICAL_DATA data_sources=dm-crypt`,
+see example in `ima_dm_crypt.policy`.
+
+As well as what's required for the IMA tests, dm-crypt measurement test require
+reading the IMA policy allowed in the kernel configuration:
+```
+CONFIG_IMA_READ_POLICY=y
+```
+
+The following kernel configuration is also required. It enables compiling
+the device-mapper target module dm-crypt, which allows to create a device
+that transparently encrypts the data on it.
+```
+CONFIG_DM_CRYPT
+```
+
 ## EVM tests
 
 `evm_overlay.sh` requires a builtin IMA appraise tcb policy (e.g. `ima_policy=appraise_tcb`
diff --git a/testcases/kernel/security/integrity/ima/datafiles/Makefile b/testcases/kernel/security/integrity/ima/datafiles/Makefile
index 280175b17..eef857c41 100644
--- a/testcases/kernel/security/integrity/ima/datafiles/Makefile
+++ b/testcases/kernel/security/integrity/ima/datafiles/Makefile
@@ -26,6 +26,6 @@ top_srcdir	?= ../../../../../..
 
 include	$(top_srcdir)/include/mk/env_pre.mk
 
-SUBDIRS	:= ima_kexec ima_keys ima_policy ima_selinux
+SUBDIRS	:= ima_dm_crypt ima_kexec ima_keys ima_policy
 
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/Makefile b/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/Makefile
new file mode 100644
index 000000000..d9efdce3f
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2021
+
+top_srcdir	?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_dm_crypt
+INSTALL_TARGETS	:= *.policy
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/ima_dm_crypt.policy b/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/ima_dm_crypt.policy
new file mode 100644
index 000000000..226b6a4b7
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_dm_crypt/ima_dm_crypt.policy
@@ -0,0 +1 @@
+measure func=CRITICAL_DATA data_sources=dm-crypt template=ima-buf
diff --git a/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
new file mode 100755
index 000000000..5c4842245
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh
@@ -0,0 +1,47 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Microsoft Corporation
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+# Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
+#
+# Verify that DM target dm-crypt are measured correctly based on policy.
+#
+# fdd1ffe8a812 ("selinux: include a consumer of the new IMA critical data hook")
+# from v5.12
+
+TST_NEEDS_CMDS="dmsetup"
+TST_NEEDS_DEVICE=1
+TST_SETUP=setup
+TST_CLEANUP=cleanup
+
+. ima_setup.sh
+
+POLICY_FUNC='func=CRITICAL_DATA'
+PATTERN='data_sources=[^[:space:]]+'
+REQUIRED_POLICY="^measure.*($FUNC.*$PATTERN|$PATTERN.*$FUNC)"
+POLICY_FILE="$TST_TMPDIR/policy.txt"
+
+setup()
+{
+	require_ima_policy_content "$REQUIRED_POLICY" '-E' > $POLICY_FILE
+	require_valid_policy_template $FUNC $POLICY_FILE
+}
+
+cleanup()
+{
+	[ "$dmsetup_run" ] || return
+	dmsetup remove test-crypt
+}
+
+test1()
+{
+	local input_digest="039d8ff71918608d585adca3e5aab2e3f41f84d6"
+	local key="faf453b4ee938cff2f0d2c869a0b743f59125c0a37f5bcd8f1dbbd911a78abaa"
+
+	tst_res TINFO "verifying dm-crypt target measurement"
+
+	ROD dmsetup create test-crypt --table "0 1953125 crypt aes-xts-plain64 $key 0 /dev/loop0 0 1 allow_discards"
+	check_policy_measurement $policy $POLICY_FILE $input_digest
+}
+
+tst_run
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
