Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421E17A7B9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:37:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7F643C6540
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:37:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AE31A3C650A
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:36:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 32A386023F4
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:36:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F52FB2E7
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:36:58 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 15:36:58 +0100
Message-Id: <20200305143658.26584-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305143658.26584-1-mdoucha@suse.cz>
References: <20200305143658.26584-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Reimplement TST_SAFE_TIMERFD_*() using
 TST_ASSERT_SYSCALL*()
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

Example usage of the TST_ASSERT_SYSCALL*() macros.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 lib/tst_safe_timerfd.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
index ffe7b2ef7..18da82184 100644
--- a/lib/tst_safe_timerfd.c
+++ b/lib/tst_safe_timerfd.c
@@ -9,34 +9,18 @@
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 
-#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
-
 int safe_timerfd_create(const char *file, const int lineno,
 				      int clockid, int flags)
 {
-	int fd;
-
-	fd = timerfd_create(clockid, flags);
-	if (fd < 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
-			file, lineno, tst_clock_name(clockid));
-	}
-
-	return fd;
+	return TST_ASSERT_SYSCALL_FD_IMPL(timerfd_create(clockid, flags), file,
+		lineno);
 }
 
 int safe_timerfd_gettime(const char *file, const int lineno,
 				int fd, struct itimerspec *curr_value)
 {
-	int rval;
-
-	rval = timerfd_gettime(fd, curr_value);
-	if (rval != 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
-			file, lineno);
-	}
-
-	return rval;
+	return TST_ASSERT_SYSCALL_IMPL(timerfd_gettime(fd, curr_value), file,
+		lineno);
 }
 
 int safe_timerfd_settime(const char *file, const int lineno,
@@ -44,13 +28,6 @@ int safe_timerfd_settime(const char *file, const int lineno,
 				const struct itimerspec *new_value,
 				struct itimerspec *old_value)
 {
-	int rval;
-
-	rval = timerfd_settime(fd, flags, new_value, old_value);
-	if (rval != 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_settime() failed",
-			file, lineno);
-	}
-
-	return rval;
+	return TST_ASSERT_SYSCALL_IMPL(timerfd_settime(fd, flags, new_value,
+		old_value), file, lineno);
 }
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
