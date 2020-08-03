Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C39323AC11
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 20:00:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53ACB3C4AE8
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 20:00:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 40C523C3346
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:59:45 +0200 (CEST)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 049896012A4
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 19:59:44 +0200 (CEST)
Received: from localhost.localdomain (c-73-187-218-229.hsd1.pa.comcast.net
 [73.187.218.229])
 by linux.microsoft.com (Postfix) with ESMTPSA id 61DB520B490D;
 Mon,  3 Aug 2020 10:59:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 61DB520B490D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1596477583;
 bh=t37vbbkV2z9+1aMrcwUrVpxll3W/L7/rzcbHNTTSmC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V0AjKALYTQMAEcYk/uzo86I7p6zrRRImwK9tfAGXvHlVdbhuFQfCEWuaxdgjNgW6F
 +dqtlD2o6Y+lTJ1pL/ItFyNNIC8NXxmjQXFG2HkLtyriFcJAFV+21R6n96+orVYklX
 Jr9jHMt5jl/JPIrEx0FNC/M2Os2N7pIaTKY8rwoI=
From: Lachlan Sneff <t-josne@linux.microsoft.com>
To: pvorel@suse.cz,
	zohar@linux.ibm.com,
	ltp@lists.linux.it
Date: Mon,  3 Aug 2020 13:59:03 -0400
Message-Id: <20200803175904.40269-3-t-josne@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803175904.40269-1-t-josne@linux.microsoft.com>
References: <20200803175904.40269-1-t-josne@linux.microsoft.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_PASS,SPF_PASS,
 USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] IMA: Refactor datafiles directory
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
Cc: tytyhicks@linux.microsoft.com, balajib@linux.microsoft.com,
 nramas@linux.microsoft.com, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The IMA datafiles directory is structured so that it cannot be directly
expanded to include datafiles for tests other than `ima_policy.sh`.

Move the contents of the IMA datafiles directory into an IMA
datafiles/policy directory.

Signed-off-by: Lachlan Sneff <t-josne@linux.microsoft.com>
---
 .../security/integrity/ima/datafiles/Makefile     |  6 ++----
 .../integrity/ima/datafiles/policy/Makefile       | 15 +++++++++++++++
 .../ima/datafiles/{ => policy}/kexec.policy       |  0
 .../ima/datafiles/{ => policy}/keycheck.policy    |  0
 .../ima/datafiles/{ => policy}/measure.policy     |  0
 .../datafiles/{ => policy}/measure.policy-invalid |  0
 6 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/kexec.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/keycheck.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy (100%)
 rename testcases/kernel/security/integrity/ima/datafiles/{ => policy}/measure.policy-invalid (100%)

diff --git a/testcases/kernel/security/integrity/ima/datafiles/Makefile b/testcases/kernel/security/integrity/ima/datafiles/Makefile
index 369407112..3772e9a03 100644
--- a/testcases/kernel/security/integrity/ima/datafiles/Makefile
+++ b/testcases/kernel/security/integrity/ima/datafiles/Makefile
@@ -24,8 +24,6 @@ top_srcdir		?= ../../../../../..
 
 include	$(top_srcdir)/include/mk/env_pre.mk
 
-INSTALL_DIR		:= testcases/data/ima_policy
+SUBDIRS			:= policy
 
-INSTALL_TARGETS		:= measure.policy-invalid *.policy
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
+include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile b/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
new file mode 100644
index 000000000..84d1424c6
--- /dev/null
+++ b/testcases/kernel/security/integrity/ima/datafiles/policy/Makefile
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Microsoft Corporation
+# Author: Lachlan Sneff <t-josne@linux.microsoft.com>
+#
+# IMA datafiles/policy Makefile
+
+top_srcdir		?= ../../../../../../..
+
+include	$(top_srcdir)/include/mk/env_pre.mk
+
+INSTALL_DIR		:= testcases/data/ima_policy
+
+INSTALL_TARGETS		:= measure.policy-invalid *.policy
+
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
diff --git a/testcases/kernel/security/integrity/ima/datafiles/kexec.policy b/testcases/kernel/security/integrity/ima/datafiles/policy/kexec.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/kexec.policy
rename to testcases/kernel/security/integrity/ima/datafiles/policy/kexec.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/keycheck.policy b/testcases/kernel/security/integrity/ima/datafiles/policy/keycheck.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/keycheck.policy
rename to testcases/kernel/security/integrity/ima/datafiles/policy/keycheck.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy b/testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy
rename to testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy
diff --git a/testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid b/testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy-invalid
similarity index 100%
rename from testcases/kernel/security/integrity/ima/datafiles/measure.policy-invalid
rename to testcases/kernel/security/integrity/ima/datafiles/policy/measure.policy-invalid
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
