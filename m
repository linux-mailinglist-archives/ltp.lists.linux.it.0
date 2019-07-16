Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D56AAA2
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:32:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 370D33C1D32
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 16:32:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 274333C1808
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:32:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 60438600C57
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 16:32:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 33280B03C
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 14:32:42 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 16 Jul 2019 16:32:38 +0200
Message-Id: <20190716143238.483-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscalls/prctl07: Fix build.
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

Ideally this is last fix for prctl07.

Since I've changed the check_proc_capamb() to use macro definition
instead of raw integer value we depend on sys/capability.h being
included to compile the code.

So this commit changes:

The sys/capability.h is included under HAVE_SYS_CAPABILITY_H now and so
the function is ifdefed out if we don't have that header.

Also it looks like HAVE_LIBCAP is not defined unless libcap supports
cap_compare() which should be fixed. The check for libcap and
cap_compare() has to be uncoupled but that has to be done in a sepratate
patch.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/prctl/prctl07.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl07.c b/testcases/kernel/syscalls/prctl/prctl07.c
index 37d77df33..79f7710a8 100644
--- a/testcases/kernel/syscalls/prctl/prctl07.c
+++ b/testcases/kernel/syscalls/prctl/prctl07.c
@@ -25,7 +25,7 @@
 #include <sys/prctl.h>
 #include <stdlib.h>
 #include "config.h"
-#ifdef HAVE_LIBCAP
+#ifdef HAVE_SYS_CAPABILITY_H
 # include <sys/capability.h>
 #endif
 #include "lapi/syscalls.h"
@@ -35,7 +35,8 @@
 
 #define PROC_STATUS "/proc/self/status"
 
-static inline void check_proc_capamb(char *message, int flag)
+#ifdef HAVE_SYS_CAPABILITY_H
+static void check_proc_capamb(char *message, int flag)
 {
 	int cap_num;
 	char CapAmb[20];
@@ -62,6 +63,7 @@ static inline void check_proc_capamb(char *message, int flag)
 			"%s, CapAmb in %s doesn't have CAP_NET_BIND_SERVICE",
 			message, PROC_STATUS);
 }
+#endif
 
 static inline void check_cap_raise(unsigned int cap, char *message, int fail_flag)
 {
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
