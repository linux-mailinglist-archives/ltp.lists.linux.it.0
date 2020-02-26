Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B817060A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 18:26:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6477B3C2555
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 18:26:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2BF373C04FD
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 18:26:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 98BB4201269
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 18:26:38 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C19DAABE9
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 17:26:37 +0000 (UTC)
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: ltp@lists.linux.it
Date: Wed, 26 Feb 2020 18:26:20 +0100
Message-Id: <20200226172620.29815-1-cfamullaconrad@suse.de>
X-Mailer: git-send-email 2.16.4
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v1] Stringify flags to improve error msg of unshare()
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

If your test has multiple calls of unshare() it is hard to read which
unshare() call really failed. With this we improve the error message to
something like this:

  sendmsg03.c:43: CONF: unshare(CLONE_NEWUSER) unsupported: EINVAL (22)

Instead of having a hard to understand number like:

  sendmsg03.c:43: CONF: unshare(268435456) unsupported: EINVAL (22)

Signed-off-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
---
 include/tst_safe_macros.h | 5 +++--
 lib/tst_safe_macros.c     | 7 ++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
index 80c4d9cb9..f2f8bd10f 100644
--- a/include/tst_safe_macros.h
+++ b/include/tst_safe_macros.h
@@ -544,7 +544,8 @@ int safe_personality(const char *filename, unsigned int lineno,
 	}							\
 	} while (0)
 
-void safe_unshare(const char *file, const int lineno, int flags);
-#define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, (flags))
+void safe_unshare(const char *file, const int lineno, const char *flags_str,
+	int flags);
+#define SAFE_UNSHARE(flags) safe_unshare(__FILE__, __LINE__, #flags, (flags))
 
 #endif /* SAFE_MACROS_H__ */
diff --git a/lib/tst_safe_macros.c b/lib/tst_safe_macros.c
index f5413a18e..01270de2b 100644
--- a/lib/tst_safe_macros.c
+++ b/lib/tst_safe_macros.c
@@ -187,7 +187,8 @@ int safe_chroot(const char *file, const int lineno, const char *path)
 	return rval;
 }
 
-void safe_unshare(const char *file, const int lineno, int flags)
+void safe_unshare(const char *file, const int lineno, const char *flags_str,
+		  int flags)
 {
 	int res;
 
@@ -195,10 +196,10 @@ void safe_unshare(const char *file, const int lineno, int flags)
 	if (res == -1) {
 		if (errno == EINVAL) {
 			tst_brk_(file, lineno, TCONF | TERRNO,
-				 "unshare(%d) unsupported", flags);
+				 "unshare(%s) unsupported", flags_str);
 		} else {
 			tst_brk_(file, lineno, TBROK | TERRNO,
-				 "unshare(%d) failed", flags);
+				 "unshare(%s) failed", flags_str);
 		}
 	}
 }
-- 
2.16.4


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
