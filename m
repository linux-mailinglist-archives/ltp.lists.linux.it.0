Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE32722C1
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 13:40:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4237B3C2A2F
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Sep 2020 13:40:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6CD3C3C29BF
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 13:39:59 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EEA8B6000E8
 for <ltp@lists.linux.it>; Mon, 21 Sep 2020 13:39:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 536F9ACC2;
 Mon, 21 Sep 2020 11:40:34 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 21 Sep 2020 13:40:25 +0200
Message-Id: <20200921114026.11184-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] runtest/smoketest: Add smoketest
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

This runtest file is meant to be used for infrastructure checks i.e. to
test LTP integration with various frameworks. The testcases were choosen
so that the testrun is fast and also represents reasonable subset of
different LTP testcases, e.g. binary, shell, etc.

The primary reason we are adding this is that we want to get rid of
quickhit, which has been misused for this purpose.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: "Bird, Tim" <Tim.Bird@sony.com>
CC: Petr Vorel <pvorel@suse.cz>
---
 runtest/smoketest | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 runtest/smoketest

diff --git a/runtest/smoketest b/runtest/smoketest
new file mode 100644
index 000000000..218827a12
--- /dev/null
+++ b/runtest/smoketest
@@ -0,0 +1,15 @@
+# The purpose of this file is to have a quick integration test for various
+# test frameworks that integrate LTP testsuite.
+
+access01 access01
+chdir01 chdir01
+fork01 fork01
+time01 time01
+wait02 wait02
+write01 write01
+symlink01 symlink01
+stat04 symlink01 -T stat04
+utime01A symlink01 -T utime01
+rename01A symlink01 -T rename01
+splice02 seq 1 20 | splice02
+route4-change-dst route-change-dist.sh
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
