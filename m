Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC30DC53B
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:45:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CE9C3C239F
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Oct 2019 14:45:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3ED163C226E
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B487A6020A4
 for <ltp@lists.linux.it>; Fri, 18 Oct 2019 14:45:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70139B3CF;
 Fri, 18 Oct 2019 12:45:25 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: ltp@lists.linux.it
Date: Fri, 18 Oct 2019 14:45:01 +0200
Message-Id: <20191018124502.25599-5-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191018124502.25599-1-cfamullaconrad@suse.de>
References: <20191018124502.25599-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/5] Add newlib shell test for
 tst_multiply_timeout()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Simple test for different kinds of calls from tst_multiply_timeout()
---
 lib/newlib_tests/shell/test_timeout_mul.sh | 43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh

diff --git a/lib/newlib_tests/shell/test_timeout_mul.sh b/lib/newlib_tests/shell/test_timeout_mul.sh
new file mode 100755
index 000000000..6682e5d66
--- /dev/null
+++ b/lib/newlib_tests/shell/test_timeout_mul.sh
@@ -0,0 +1,43 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2019 Clemens Famulla-Conrad <cfamullaconrad@suse.de>
+
+TST_TESTFUNC=do_test
+. tst_test.sh
+
+
+call_it()
+{
+	local SAVE_MUL=${LTP_TIMEOUT_MUL}
+	$1
+	eval "exp_value=\$$2"
+	if [ "$exp_value" -ne "$3" ]; then
+		tst_brk TBROK "LTP_TIMEOUT_MUL=$SAVE_MUL $1 ($exp_value != $3)"
+	else
+		tst_res TPASS "LTP_TIMEOUT_MUL=$SAVE_MUL $1 ($exp_value == $3)"
+	fi
+}
+
+do_test()
+{
+	LTP_TIMEOUT_MUL=2
+	local sec=1
+
+	call_it 'tst_multiply_timeout sec' 'sec' 2
+
+	sec=1
+	LTP_TIMEOUT_MUL="1.5"
+	call_it 'tst_multiply_timeout sec' 'sec' 2
+
+	sec=1
+	LTP_TIMEOUT_MUL=0.5
+	call_it 'tst_multiply_timeout sec' 'sec' 1
+
+	sec=1
+	LTP_TIMEOUT_MUL=2
+	call_it 'tst_multiply_timeout sec' 'sec' 2
+	call_it 'tst_multiply_timeout sec' 'sec' 4
+	call_it 'tst_multiply_timeout sec' 'sec' 8
+}
+
+tst_run
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
