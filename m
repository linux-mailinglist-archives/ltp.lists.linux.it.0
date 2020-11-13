Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 778552B20D4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:50:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CBE93C6583
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 17:50:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id BC46D3C2EBD
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:49:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 75D20200C25
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 17:49:52 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17C4AAEBA;
 Fri, 13 Nov 2020 16:49:52 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 17:49:43 +0100
Message-Id: <20201113164944.26101-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113164944.26101-1-pvorel@suse.cz>
References: <20201113164944.26101-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3 4/5] fanotify: Check FAN_REPORT_{FID, NAME} support
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

in safe_fanotify_init()

That require to move the definition after flags.

Suggested-by: Amir Goldstein <amir73il@gmail.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/fanotify/fanotify.h | 65 +++++++++++--------
 1 file changed, 39 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
index 18a2328cf..04b6699cf 100644
--- a/testcases/kernel/syscalls/fanotify/fanotify.h
+++ b/testcases/kernel/syscalls/fanotify/fanotify.h
@@ -38,32 +38,6 @@ static long fanotify_mark(int fd, unsigned int flags, uint64_t mask,
 
 #endif /* HAVE_SYS_FANOTIFY_H */
 
-int safe_fanotify_init(const char *file, const int lineno,
-	unsigned int flags, unsigned int event_f_flags)
-{
-	int rval;
-
-#ifdef HAVE_SYS_FANOTIFY_H
-	rval = fanotify_init(flags, event_f_flags);
-
-	if (rval == -1) {
-		if (errno == ENOSYS) {
-			tst_brk(TCONF,
-				"fanotify is not configured in this kernel.");
-		}
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: fanotify_init() failed", file, lineno);
-	}
-#else
-	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
-#endif /* HAVE_SYS_FANOTIFY_H */
-
-	return rval;
-}
-
-#define SAFE_FANOTIFY_INIT(fan, mode)  \
-	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
-
 #ifndef FAN_REPORT_TID
 #define FAN_REPORT_TID		0x00000100
 #endif
@@ -190,6 +164,45 @@ struct fanotify_event_info_fid {
 #define MAX_HANDLE_SZ		128
 #endif
 
+int safe_fanotify_init(const char *file, const int lineno,
+	unsigned int flags, unsigned int event_f_flags)
+{
+	int rval;
+
+#ifdef HAVE_SYS_FANOTIFY_H
+	rval = fanotify_init(flags, event_f_flags);
+
+	if (rval == -1) {
+		if (errno == ENOSYS) {
+			tst_brk(TCONF, "%s:%d: fanotify is not configured in this kernel",
+				file, lineno);
+		}
+
+		if (errno == EINVAL) {
+			if (flags & FAN_REPORT_FID) {
+				tst_brk(TCONF, "%s:%d: FAN_REPORT_FID not supported by kernel?",
+					file, lineno);
+			}
+
+			if (flags & FAN_REPORT_NAME) {
+				tst_brk(TCONF, "%s:%d: FAN_REPORT_NAME not supported by kernel?",
+					file, lineno);
+			}
+		}
+
+		tst_brk(TBROK | TERRNO, "%s:%d: fanotify_init() failed",
+			file, lineno);
+	}
+#else
+	tst_brk(TCONF, "Header <sys/fanotify.h> is not present");
+#endif /* HAVE_SYS_FANOTIFY_H */
+
+	return rval;
+}
+
+#define SAFE_FANOTIFY_INIT(fan, mode)  \
+	safe_fanotify_init(__FILE__, __LINE__, (fan), (mode))
+
 static inline int safe_fanotify_mark(const char *file, const int lineno,
 			int fd, unsigned int flags, uint64_t mask,
 			int dfd, const char *pathname)
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
