Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D42B1945
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:44:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D95C3C5FBE
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:44:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C5AC73C2ED7
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 62B2420111A
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9E3A8AED6
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:44:35 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 11:44:26 +0100
Message-Id: <20201113104431.17808-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113104431.17808-1-mdoucha@suse.cz>
References: <20201113104431.17808-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/7] Unify error handling in lib/tst_safe_timerfd.c
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

- Properly format caller file:line locations
- Pedantically check for invalid syscall return values

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Added missing "else" keyword

 lib/tst_safe_timerfd.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
index ffe7b2ef7..d31f6e35e 100644
--- a/lib/tst_safe_timerfd.c
+++ b/lib/tst_safe_timerfd.c
@@ -17,9 +17,14 @@ int safe_timerfd_create(const char *file, const int lineno,
 	int fd;
 
 	fd = timerfd_create(clockid, flags);
-	if (fd < 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
-			file, lineno, tst_clock_name(clockid));
+
+	if (fd == -1) {
+		tst_brk_(file, lineno, TTYPE | TERRNO,
+			"timerfd_create(%s) failed", tst_clock_name(clockid));
+	} else if (fd < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timerfd_create(%s) return value %d",
+			tst_clock_name(clockid), fd);
 	}
 
 	return fd;
@@ -31,9 +36,13 @@ int safe_timerfd_gettime(const char *file, const int lineno,
 	int rval;
 
 	rval = timerfd_gettime(fd, curr_value);
-	if (rval != 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
-			file, lineno);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TTYPE | TERRNO,
+			"timerfd_gettime() failed");
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timerfd_gettime() return value %d", rval);
 	}
 
 	return rval;
@@ -47,9 +56,13 @@ int safe_timerfd_settime(const char *file, const int lineno,
 	int rval;
 
 	rval = timerfd_settime(fd, flags, new_value, old_value);
-	if (rval != 0) {
-		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_settime() failed",
-			file, lineno);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TTYPE | TERRNO,
+			"timerfd_settime() failed");
+	} else if (rval) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timerfd_settime() return value %d", rval);
 	}
 
 	return rval;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
