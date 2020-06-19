Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 929A7201B31
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 21:25:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D331E3C5F13
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 21:25:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 9DCA13C0887
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 21:25:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 26ED71000A6A
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 21:25:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AFB1AACA3;
 Fri, 19 Jun 2020 19:25:50 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 19 Jun 2020 21:25:42 +0200
Message-Id: <20200619192542.20113-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [RFC PATCH 1/1] tst_test.sh: Print tst_{res, brk} into stdout
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

This allows printing messages on functions which output is redirected
into variable or used in eval. Also this change unifies the behavior
with C new API, which printed into stderr from the beginning.

Hope this change does not bring any regression.

Legacy API kept printing into stdout (legacy C API also prints to
stdout).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

some examples:

Before:
/opt/ltp/testcases/bin/tst_net.sh: line 885: 33mTCONF:: command not found
/opt/ltp/testcases/bin/tst_net.sh: eval: line 888: syntax error near unexpected token `('
/opt/ltp/testcases/bin/tst_net.sh: eval: line 888: `tst_rhost_run 1 TCONF: 'rsh' not found tst_rhost_run 1 TINFO: AppArmor enabled, this may affect test results tst_rhost_run 1 TINFO: it can be disabled with TST_DISABLE_APPARMOR=1 (requires super/root) tst_rhost_run 1 TINFO: loaded AppArmor profiles: none Summary: passed 0 failed 0 skipped 1 warnings 1'

With this patch:
tst_rhost_run 1 TCONF: 'rsh' not found
/opt/ltp/testcases/bin/tst_net.sh: line 885: Summary:: command not found
tst_rhost_run 1 TCONF: 'rsh' not found
/opt/ltp/testcases/bin/tst_net.sh: line 888: Summary:: command not found
tst_rhost_run 1 TINFO: Network config (local -- remote):
tst_rhost_run 1 TINFO: ltp_ns_veth2 --
tst_rhost_run 1 TINFO: 10.0.0.2/24 -- 10.0.0.1/24
tst_rhost_run 1 TINFO: fd00:1:1:1::2/64 -- fd00:1:1:1::1/64
tst_rhost_run 1 TCONF: 'rsh' not found
tst_rhost_run 1 TINFO: timeout per run is 0h 5m 0s
tst_rhost_run 1 TCONF: 'rsh' not found

Kind regards,
Petr

 testcases/lib/tst_test.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 1cf724cbe..2e637b25b 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) Linux Test Project, 2014-2019
+# Copyright (c) Linux Test Project, 2014-2020
 # Author: Cyril Hrubis <chrubis@suse.cz>
 #
 # LTP test library for shell.
@@ -102,9 +102,9 @@ tst_res()
 
 	_tst_inc_res "$res"
 
-	printf "$TST_ID $TST_COUNT "
-	tst_print_colored $res "$res: "
-	echo "$@"
+	printf "$TST_ID $TST_COUNT " >&2
+	tst_print_colored $res "$res: " >&2
+	echo "$@" >&2
 }
 
 tst_brk()
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
