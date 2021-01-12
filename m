Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6B2F3A85
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:31:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6866C3C26DD
	for <lists+linux-ltp@lfdr.de>; Tue, 12 Jan 2021 20:31:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8FB5B3C26C0
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 232461400204
 for <ltp@lists.linux.it>; Tue, 12 Jan 2021 20:30:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB84DAF92;
 Tue, 12 Jan 2021 19:30:49 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 12 Jan 2021 20:30:39 +0100
Message-Id: <20210112193039.12506-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112193039.12506-1-pvorel@suse.cz>
References: <20210112193039.12506-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] syscalls: Remove unused include <fcntl.h>
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

Tests should always use lapi/fcntl.h instead of <fcntl.h> to fix
possible missing definitions.

But in this case removing include, because fanotify tests include
<fcntl.h> in lapi/fcntl.h (via fanotify.h) and
{name_to,open_by}_handle_at tests include lapi/fcntl.h in
lapi/name_to_handle_at.h.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify09.c                  | 1 -
 testcases/kernel/syscalls/fanotify/fanotify13.c                  | 1 -
 testcases/kernel/syscalls/fanotify/fanotify15.c                  | 1 -
 testcases/kernel/syscalls/fanotify/fanotify16.c                  | 1 -
 .../kernel/syscalls/name_to_handle_at/name_to_handle_at01.c      | 1 -
 .../kernel/syscalls/name_to_handle_at/name_to_handle_at02.c      | 1 -
 .../kernel/syscalls/open_by_handle_at/open_by_handle_at01.c      | 1 -
 .../kernel/syscalls/open_by_handle_at/open_by_handle_at02.c      | 1 -
 8 files changed, 8 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify09.c b/testcases/kernel/syscalls/fanotify/fanotify09.c
index 30e212f44..918e40274 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify09.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -30,7 +30,6 @@
 #include <stdio.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-#include <fcntl.h>
 #include <errno.h>
 #include <string.h>
 #include <sys/mount.h>
diff --git a/testcases/kernel/syscalls/fanotify/fanotify13.c b/testcases/kernel/syscalls/fanotify/fanotify13.c
index c9cf10555..6d812cdd1 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify13.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -21,7 +21,6 @@
 #include <sys/statfs.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <fcntl.h>
 #include <errno.h>
 #include <unistd.h>
 #include "tst_test.h"
diff --git a/testcases/kernel/syscalls/fanotify/fanotify15.c b/testcases/kernel/syscalls/fanotify/fanotify15.c
index ba8259c7c..fe143823e 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify15.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -19,7 +19,6 @@
 
 #include <string.h>
 #include <errno.h>
-#include <fcntl.h>
 #include <sys/statfs.h>
 #include <sys/types.h>
 #include "tst_test.h"
diff --git a/testcases/kernel/syscalls/fanotify/fanotify16.c b/testcases/kernel/syscalls/fanotify/fanotify16.c
index 5ffaec92f..c4b8a5abc 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify16.c
+++ b/testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -18,7 +18,6 @@
 #include <stdio.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-#include <fcntl.h>
 #include <errno.h>
 #include <string.h>
 #include <sys/mount.h>
diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
index 84ac32eab..1ac9d8214 100644
--- a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at01.c
@@ -15,7 +15,6 @@
 \*/
 
 #define _GNU_SOURCE
-#include <fcntl.h>
 #include <sys/stat.h>
 #include "lapi/name_to_handle_at.h"
 
diff --git a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
index 7c0d57485..020b25531 100644
--- a/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
+++ b/testcases/kernel/syscalls/name_to_handle_at/name_to_handle_at02.c
@@ -10,7 +10,6 @@
 \*/
 
 #define _GNU_SOURCE
-#include <fcntl.h>
 #include "lapi/name_to_handle_at.h"
 
 #define TEST_FILE "test_file"
diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
index c1b08f1b8..0d09e1ed8 100644
--- a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
+++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at01.c
@@ -15,7 +15,6 @@
 \*/
 
 #define _GNU_SOURCE
-#include <fcntl.h>
 #include <sys/stat.h>
 #include "lapi/name_to_handle_at.h"
 
diff --git a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
index 3c8f06d85..0f60752c4 100644
--- a/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
+++ b/testcases/kernel/syscalls/open_by_handle_at/open_by_handle_at02.c
@@ -10,7 +10,6 @@
 \*/
 #define _GNU_SOURCE
 #include <linux/capability.h>
-#include <fcntl.h>
 #include "tst_capability.h"
 #include "lapi/name_to_handle_at.h"
 
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
