Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FE14091A
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B1673C224E
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id D67E93C2033
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B06101A004DE
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D269AED5;
 Fri, 17 Jan 2020 11:37:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 12:37:13 +0100
Message-Id: <20200117113715.22786-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117113715.22786-1-pvorel@suse.cz>
References: <20200117113715.22786-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] pidfd_send_signal: Build with _GNU_SOURCE
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

This adds missing O_CLOEXEC and O_DIRECTORY on old distros,
where it's (in glibc) guarded under __USE_GNU.

This was needed on SLES 11 (glibc 2.11).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c      | 1 +
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c      | 1 +
 .../kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
index f03905894..b529551d2 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal01.c
@@ -9,6 +9,7 @@
  * struct is passed.
  */
 
+#define _GNU_SOURCE
 #include <signal.h>
 #include <stdlib.h>
 #include "tst_safe_pthread.h"
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
index c933ada84..74914523f 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal02.c
@@ -21,6 +21,7 @@
  *    -> EPERM
  */
 
+#define _GNU_SOURCE
 #include <pwd.h>
 #include <signal.h>
 #include "tst_safe_pthread.h"
diff --git a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
index 19d943d06..3420afbb9 100644
--- a/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
+++ b/testcases/kernel/syscalls/pidfd_send_signal/pidfd_send_signal03.c
@@ -15,6 +15,7 @@
  * child using the pidfd of the first one.
  */
 
+#define _GNU_SOURCE
 #include <signal.h>
 #include <stdio.h>
 #include <unistd.h>
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
