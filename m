Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DF203145
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 10:02:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 462D23C6AED
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 10:02:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C83573C05A2
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 10:01:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EA3CB20119C
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 10:01:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4E2EB22BA
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 08:01:55 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Sat, 20 Jun 2020 00:08:52 +0200
Message-Id: <20200619220853.12610-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619220853.12610-1-pvorel@suse.cz>
References: <20200619220853.12610-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 4/5] net/test: Add basic testing for tst_rhost_run
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Regression test for use of nested single quotes
(fixed in previous commit).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/net/tst_rhost_run.sh | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100755 lib/newlib_tests/shell/net/tst_rhost_run.sh

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
new file mode 100755
index 000000000..4c034a4ac
--- /dev/null
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -0,0 +1,25 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2020 Petr Vorel <pvorel@suse.cz>
+
+TST_TESTFUNC=do_test
+PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
+. tst_net.sh
+
+do_test()
+{
+	local file="/etc/fstab"
+
+	tst_rhost_run -c 'which grep > /dev/null' || \
+		tst_res TCONF "grep not found on rhost"
+
+	tst_rhost_run -c "[ -f $file ]" || \
+		tst_res TCONF "$file not found on rhost"
+
+	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
+	tst_rhost_run -s -c "grep -q '[^ ]' $file"
+
+	tst_res TPASS "tst_rhost_run is working"
+}
+
+tst_run
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
