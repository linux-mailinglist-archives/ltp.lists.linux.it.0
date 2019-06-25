Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF435276C
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:02:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD8383C1425
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jun 2019 11:02:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C72B63C12A1
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:02:47 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 66A2C600131
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 11:02:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C52F0308FBAF
 for <ltp@lists.linux.it>; Tue, 25 Jun 2019 09:02:45 +0000 (UTC)
Received: from dustball.brq.redhat.com (unknown [10.43.17.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB0C96085B;
 Tue, 25 Jun 2019 09:02:42 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 25 Jun 2019 11:02:39 +0200
Message-Id: <64e3837429239829860f1df5d8145c12078a799f.1561451809.git.jstancek@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 25 Jun 2019 09:02:45 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] lib: make save_restore '?' prefix ignore also errors
 from open/read
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

Prefix '?' was meant to silently ignore non-existing paths.
However there are some /proc files which exist, but trigger
error only after open/read:
  # ls -la /proc/sys/vm/nr_hugepages
  -rw-r--r--. 1 root root 0 Jun 25 04:17 /proc/sys/vm/nr_hugepages
  # cat /proc/sys/vm/nr_hugepages
  cat: /proc/sys/vm/nr_hugepages: Operation not supported

This leads to unavoidable TBROK. Extend '?' flag to cover also open/read.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 doc/test-writing-guidelines.txt | 9 +++++----
 lib/tst_sys_conf.c              | 6 ++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index c6d4e001d72b..d0b7417f2cc8 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -1515,10 +1515,11 @@ and restored at the end of the test. Only first line of a specified
 file is saved and restored.
 
 Pathnames can be optionally prefixed to specify how strictly (during
-'store') are handled files that don't exist:
-  (no prefix) - test ends with TCONF
-  '?'         - test prints info message and continues
-  '!'         - test ends with TBROK
+'store') are handled errors:
+  (no prefix) - test ends with TCONF, if file doesn't exist
+  '?'         - test prints info message and continues,
+                if file doesn't exist or open/read fails
+  '!'         - test ends with TBROK, if file doesn't exist
 
 'restore' is always strict and will TWARN if it encounters any error.
 
diff --git a/lib/tst_sys_conf.c b/lib/tst_sys_conf.c
index e767856ec148..bbe469936c99 100644
--- a/lib/tst_sys_conf.c
+++ b/lib/tst_sys_conf.c
@@ -66,6 +66,9 @@ int tst_sys_conf_save(const char *path)
 
 	fp = fopen(path, "r");
 	if (fp == NULL) {
+		if (flag == '?')
+			return 1;
+
 		tst_brk(TBROK | TERRNO, "Failed to open FILE '%s' for reading",
 			path);
 		return 1;
@@ -75,6 +78,9 @@ int tst_sys_conf_save(const char *path)
 	fclose(fp);
 
 	if (ret == NULL) {
+		if (flag == '?')
+			return 1;
+
 		tst_brk(TBROK | TERRNO, "Failed to read anything from '%s'",
 			path);
 	}
-- 
1.8.3.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
