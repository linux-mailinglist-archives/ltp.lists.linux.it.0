Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BFCD96C7
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED55D3C1445
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 18:16:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 761903C2095
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:59 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2A6FE1A013DF
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 18:15:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D8D8CB374;
 Wed, 16 Oct 2019 16:15:55 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: pvorel@suse.cz,
	liwang@redhat.com,
	ltp@lists.linux.it
Date: Wed, 16 Oct 2019 18:15:19 +0200
Message-Id: <20191016161519.11256-4-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191016161519.11256-1-cfamullaconrad@suse.de>
References: <1571225126.8494.1.camel@suse.de>
 <20191016161519.11256-1-cfamullaconrad@suse.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/4] Add newlib shell test for
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
 lib/newlib_tests/shell/test_timeout_mul.sh | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100755 lib/newlib_tests/shell/test_timeout_mul.sh

diff --git a/lib/newlib_tests/shell/test_timeout_mul.sh b/lib/newlib_tests/shell/test_timeout_mul.sh
new file mode 100755
index 000000000..8397df25c
--- /dev/null
+++ b/lib/newlib_tests/shell/test_timeout_mul.sh
@@ -0,0 +1,54 @@
+#!/bin/bash
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
+	if [ "${!2}" -ne "$3" ]; then
+		tst_brk TBROK "LTP_TIMEOUT_MUL=$SAVE_MUL $1 (${!2} != $3)"
+	else
+		tst_res TPASS "LTP_TIMEOUT_MUL=$SAVE_MUL $1 (${!2} == $3)"
+	fi
+}
+
+do_test()
+{
+	LTP_TIMEOUT_MUL=2
+	local sec=1
+
+        call_it 'tst_multiply_timeout sec' 'sec' 2
+        call_it 'tst_multiply_timeout foo 1000' 'foo' 2000
+
+	sec=1
+        call_it 'tst_multiply_timeout sec 500' 'sec' 1000
+
+	sec=1
+	LTP_TIMEOUT_MUL="1.5"
+        call_it 'tst_multiply_timeout sec' 'sec' 2
+
+	sec=1
+	LTP_TIMEOUT_MUL=0.5
+        call_it 'tst_multiply_timeout sec' 'sec' 1
+
+	sec=1
+	LTP_TIMEOUT_MUL=1.5
+        call_it 'tst_multiply_timeout sec 5' 'sec' 10
+
+	sec=1
+	LTP_TIMEOUT_MUL=0.5
+        call_it 'tst_multiply_timeout sec 5' 'sec' 5
+
+	sec=1
+	LTP_TIMEOUT_MUL=2
+        call_it 'tst_multiply_timeout sec' 'sec' 2
+        call_it 'tst_multiply_timeout sec' 'sec' 4
+        call_it 'tst_multiply_timeout sec' 'sec' 8
+}
+
+tst_run;
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
