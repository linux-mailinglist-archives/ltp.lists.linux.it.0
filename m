Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EEDB1DF1
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A75E3C2077
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 559FA3C1860
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 20485103AAD1
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3AF2BB604;
 Fri, 13 Sep 2019 12:58:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Sep 2019 14:58:21 +0200
Message-Id: <20190913125823.17314-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190913125823.17314-1-pvorel@suse.cz>
References: <20190913125823.17314-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/3] shell: Add tst_is_num()
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

Using grep -E, which more portable than using awk or anything else.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt | 6 ++++++
 testcases/lib/tst_test.sh       | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index a735b43bb..2d118578f 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -2259,6 +2259,12 @@ Checking for integers
 tst_is_int "$FOO"
 -------------------------------------------------------------------------------
 
+Checking for integers and floating point numbers
+++++++++++++++++++++++++++++++++++++++++++++++++
+# returns zero if passed an integer or floating point number parameter, non-zero otherwise
+tst_is_num "$FOO"
+-------------------------------------------------------------------------------
+
 Obtaining random numbers
 ++++++++++++++++++++++++
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index e0b24c6b9..ca63745fd 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) Linux Test Project, 2014-2018
+# Copyright (c) Linux Test Project, 2014-2019
 # Author: Cyril Hrubis <chrubis@suse.cz>
 #
 # LTP test library for shell.
@@ -344,6 +344,11 @@ tst_is_int()
 	return $?
 }
 
+tst_is_num()
+{
+	echo "$1" | grep -Eq '^[-+]?[0-9]+\.?[0-9]*$'
+}
+
 tst_usage()
 {
 	if [ -n "$TST_USAGE" ]; then
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
