Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A448D1924D6
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:59:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04F043C4BBA
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Mar 2020 10:59:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8E38A3C4BA4
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:59:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 16E151039BEA
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 10:59:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 49C63AC26
 for <ltp@lists.linux.it>; Wed, 25 Mar 2020 09:59:22 +0000 (UTC)
Date: Wed, 25 Mar 2020 11:01:48 +0100
From: Jozef Pupava <jpupava@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200325110148.07f0a740@daedruan>
Organization: SUSE
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Replace deprecated <strings.h> with <string.h>
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

I guess this won't really solve anything, just the issue.

Closes: #521

Signed-off-by: Jozef Pupava <jpupava@suse.com>
---
 testcases/kernel/containers/share/ns_create.c                           | 2 +-
 testcases/kernel/fs/fsx-linux/fsx-linux.c                               | 2 +-
 .../open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c     | 2 +-
 .../open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/containers/share/ns_create.c b/testcases/kernel/containers/share/ns_create.c
index 1d0339e71..4a4007c3a 100644
--- a/testcases/kernel/containers/share/ns_create.c
+++ b/testcases/kernel/containers/share/ns_create.c
@@ -30,7 +30,7 @@
 #include <sys/stat.h>
 #include <unistd.h>
 #include <string.h>
-#include <strings.h>
+#include <string.h>
 #include <errno.h>
 #include "test.h"
 #include "lapi/namespaces_constants.h"
diff --git a/testcases/kernel/fs/fsx-linux/fsx-linux.c b/testcases/kernel/fs/fsx-linux/fsx-linux.c
index 02f3eb827..4a20f4da6 100644
--- a/testcases/kernel/fs/fsx-linux/fsx-linux.c
+++ b/testcases/kernel/fs/fsx-linux/fsx-linux.c
@@ -43,7 +43,7 @@
 #include <sys/param.h>
 #include <limits.h>
 #include <time.h>
-#include <strings.h>
+#include <string.h>
 #include <sys/time.h>
 #endif
 #include <fcntl.h>
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
index dd42bbd91..97bdbff5d 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/3-1.c
@@ -20,7 +20,7 @@
 #endif
 #include <semaphore.h>
 #include <stdio.h>
-#include <strings.h>
+#include <string.h>
 #include <time.h>
 #include <unistd.h>
 #include "posixtest.h"
diff --git a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
index 79de0af7f..da2cd3084 100644
--- a/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
+++ b/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait/7-1.c
@@ -21,7 +21,7 @@
 #endif
 #include <semaphore.h>
 #include <stdio.h>
-#include <strings.h>
+#include <string.h>
 #include <time.h>
 #include <unistd.h>
 #include "posixtest.h"
-- 
2.16.4

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
