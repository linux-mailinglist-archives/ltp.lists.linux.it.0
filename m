Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D95923F3FC
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4207A3C31F0
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Aug 2020 22:47:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BB2023C31E2
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7BD681A01475
 for <ltp@lists.linux.it>; Fri,  7 Aug 2020 22:47:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 13EF6ACA9;
 Fri,  7 Aug 2020 20:47:18 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  7 Aug 2020 22:46:50 +0200
Message-Id: <20200807204652.5928-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200807204652.5928-1-pvorel@suse.cz>
References: <20200807204652.5928-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/4] IMA: Refactor datafiles directory
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

The IMA datafiles directory is structured so that it cannot be directly
expanded to include datafiles for tests other than `ima_policy.sh`
as it's installed into /opt/ltp/testcases/data/ima_policy.

Also not all policies are meant to be for ima_policy.sh, thus
move policies into their own directories based on the test which they
belong to. Rename policy directory to ima_policy to follow the
pattern that directory in sources match the installed directory.

Reported-by: Lachlan Sneff <t-josne@linux.microsoft.com>
Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
[ pvorel: based on Lachlan's patch, rewritten ]
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
I rewritten this patch, but used Lachlan's Signed-off-by and copyright
for his changes in datafiles/Makefile.

Kind regards,
Petr

 .../kernel/security/integrity/ima/datafiles/Makefile  | 10 +++++-----
 .../integrity/ima/datafiles/ima_kexec/Makefile        | 11 +++++++++++
 .../ima/datafiles/{ => ima_kexec}/kexec.policy        |  0
 .../integrity/ima/datafiles/ima_keys/Makefile         | 11 +++++++++++
 .../ima/datafiles/{ => ima_keys}/keycheck.policy      |  0
 .../integrity/ima/datafiles/ima_policy/Makefile       | 11 +++++++++++
 .../ima/datafiles/{ => ima_policy}/measure.policy     |  0
 .../datafiles/{ => ima_policy}/measure.policy-invalid |  0
 8 files changed, 38 insertions(+), 5 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_kexec}/kexec.policy (100%)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_keys}/keycheck.policy (100%)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => ima_policy}/measure.policy-invalid (100%)

diff --git a/testcases/kernel/security/integrity/ima/datafiles/Makefile b/testcases/kernel/security/integrity/ima/datafiles/Makefile
index 369407112..6857ccfee 100644
--- a/testcases/kernel/security/integrity/ima/datafiles/Makefile
+++ b/testcases/kernel/security/integrity/ima/datafiles/Makefile
@@ -1,6 +1,8 @@
 #
 #    testcases/kernel/security/integrity/ima/policy testcases Makefile.
 #
+#    Copyright (c) Linux Test Project, 2019-2020
+#    Copyright (c) 2020 Microsoft Corporation
 #    Copyright (C) 2009, Cisco Systems Inc.
 #
 #    This program is free software; you can redistribute it and/or modify
@@ -20,12 +22,10 @@
 # Ngie Cooper, July 2009
 #
 
-top_srcdir		?= ../../../../../..
+top_srcdir	?= ../../../../../..
 
 include	$(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_DIR		:= testcases/data/ima_policy
+SUBDIRS	:= ima_*
 
-INSTALL_TARGETS		:= measure.policy-invalid *.policy
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile b/testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile
new file mode 100644
index 000000000..5e0d632a7
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_kexec/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2020
+
+top_srcdir	?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_kexec
+INSTALL_TARGETS	:= *.policy
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/kexec.policy b/testcases/kernel/security/integrity/ima/datafiles/ima_kexec/kexec.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/kexec.policy
rename to testcases/kernel/security/integrity/ima/datafiles/ima_kexec/kexec.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile b/testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile
new file mode 100644
index 000000000..452321843
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_keys/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2020
+
+top_srcdir	?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_keys
+INSTALL_TARGETS	:= *.policy
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy b/testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
rename to testcases/kernel/security/integrity/ima/datafiles/ima_keys/keycheck.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile b/testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile
new file mode 100644
index 000000000..953e21556
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/ima_policy/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) Linux Test Project, 2020
+
+top_srcdir	?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_policy
+INSTALL_TARGETS	:= *.policy-invalid *.policy
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy b/testcases/kernel/security/integrity/ima/datafiles/ima_policy/measure.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy
rename to testcases/kernel/security/integrity/ima/datafiles/ima_policy/measure.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid b/testcases/kernel/security/integrity/ima/datafiles/ima_policy/measure.policy-invalid
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid
rename to testcases/kernel/security/integrity/ima/datafiles/ima_policy/measure.policy-invalid
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
