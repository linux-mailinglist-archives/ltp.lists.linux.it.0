Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECA31A9C31
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 181CB3C2B26
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Apr 2020 13:27:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1A2A13C2B04
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A00C8140165B
 for <ltp@lists.linux.it>; Wed, 15 Apr 2020 13:26:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 93AABADE8;
 Wed, 15 Apr 2020 11:26:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 15 Apr 2020 13:26:30 +0200
Message-Id: <20200415112635.14144-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415112635.14144-1-pvorel@suse.cz>
References: <20200415112635.14144-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 4/9] controllers: Fix linking with -fno-common
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

by moving definitions to libcontrollers.c and adding extern declarations
to libcontrollers.h.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../controllers/cpuctl/cpuctl_def_task01.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task02.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task03.c    |  2 --
 .../controllers/cpuctl/cpuctl_def_task04.c    |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test01.c |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test02.c |  1 -
 .../kernel/controllers/cpuctl/cpuctl_test03.c |  2 --
 .../kernel/controllers/cpuctl/cpuctl_test04.c |  2 --
 .../libcontrollers/libcontrollers.c           | 11 ++++++++
 .../libcontrollers/libcontrollers.h           | 28 +++++++------------
 10 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_def_task01.c b/testcases/kernel/controllers/cpuctl/cpuctl_def_task01.c
index 90119e4ad..578c60c89 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_def_task01.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_def_task01.c
@@ -81,8 +81,6 @@ extern void cleanup(void)
 	/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_def_task02.c b/testcases/kernel/controllers/cpuctl/cpuctl_def_task02.c
index dc1546e88..658c6fd3f 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_def_task02.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_def_task02.c
@@ -76,8 +76,6 @@ extern void cleanup(void)
 	/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_def_task03.c b/testcases/kernel/controllers/cpuctl/cpuctl_def_task03.c
index 92b451793..a700ca515 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_def_task03.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_def_task03.c
@@ -76,8 +76,6 @@ extern void cleanup(void)
 	/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_def_task04.c b/testcases/kernel/controllers/cpuctl/cpuctl_def_task04.c
index 108e576e1..1726f810d 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_def_task04.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_def_task04.c
@@ -76,8 +76,6 @@ extern void cleanup(void)
 	/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_test01.c b/testcases/kernel/controllers/cpuctl/cpuctl_test01.c
index d7be1c80c..8f6d11de0 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_test01.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_test01.c
@@ -79,8 +79,6 @@ extern void cleanup(void)
 	tst_exit();		/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_test02.c b/testcases/kernel/controllers/cpuctl/cpuctl_test02.c
index 2a5cd4a11..52ad8aa2f 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_test02.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_test02.c
@@ -78,7 +78,6 @@ extern void cleanup(void)
 }
 
 int migrate_task();
-volatile int timer_expired = 0;
 
 int main(void)
 {
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_test03.c b/testcases/kernel/controllers/cpuctl/cpuctl_test03.c
index 8a80d6932..0e0a26dc3 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_test03.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_test03.c
@@ -76,8 +76,6 @@ extern void cleanup(void)
 	tst_exit();		/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/cpuctl/cpuctl_test04.c b/testcases/kernel/controllers/cpuctl/cpuctl_test04.c
index 791a58dd2..dae0d4c05 100644
--- a/testcases/kernel/controllers/cpuctl/cpuctl_test04.c
+++ b/testcases/kernel/controllers/cpuctl/cpuctl_test04.c
@@ -77,8 +77,6 @@ extern void cleanup(void)
 	tst_exit();		/* Report exit status */
 }
 
-volatile int timer_expired = 0;
-
 int main(int argc, char *argv[])
 {
 
diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.c b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
index 75766fc19..e9917271c 100644
--- a/testcases/kernel/controllers/libcontrollers/libcontrollers.c
+++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
@@ -35,6 +35,17 @@
 
 #include "libcontrollers.h"
 
+char fullpath[PATH_MAX];
+int FLAG;
+volatile int timer_expired = 0;
+int retval;
+unsigned int num_line;
+unsigned int current_shares;
+unsigned int total_shares;
+unsigned int *shares_pointer;
+char target[LINE_MAX];
+struct dirent *dir_pointer;
+
 /*
  * Function: scan_shares_file()
  * This function scans all the shares files under the mountpoint
diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.h b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
index f999f705e..7d7b8324b 100644
--- a/testcases/kernel/controllers/libcontrollers/libcontrollers.h
+++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
@@ -42,24 +42,16 @@
 #include <sys/types.h>
 #include <unistd.h>
 
-char fullpath[PATH_MAX];
-
-int FLAG;
-volatile int timer_expired;
-
-int retval;
-
-unsigned int num_line;//??
-
-unsigned int current_shares;
-
-unsigned int total_shares;
-
-unsigned int *shares_pointer;//??
-
-char target[LINE_MAX];
-
-struct dirent 	*dir_pointer;
+extern char fullpath[PATH_MAX];
+extern int FLAG;
+extern volatile int timer_expired;
+extern int retval;
+extern unsigned int num_line;
+extern unsigned int current_shares;
+extern unsigned int total_shares;
+extern unsigned int *shares_pointer;
+extern char target[LINE_MAX];
+extern struct dirent *dir_pointer;
 
 enum{
 	GET_SHARES	=1,
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
