Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C542B194C
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB3EC3C4FC1
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 11:45:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C87B43C4FAE
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EB4E7201128
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 11:44:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0E688AF0E
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:44:36 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Nov 2020 11:44:31 +0100
Message-Id: <20201113104431.17808-7-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201113104431.17808-1-mdoucha@suse.cz>
References: <20201113104431.17808-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 7/7] Unify error handling in
 include/lapi/safe_rt_signal.h
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

- Properly format caller file:line location
- Pedantically check invalid syscall return values

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1:
- Code style fixes

 include/lapi/safe_rt_signal.h | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/include/lapi/safe_rt_signal.h b/include/lapi/safe_rt_signal.h
index 67fa44417..952085608 100644
--- a/include/lapi/safe_rt_signal.h
+++ b/include/lapi/safe_rt_signal.h
@@ -15,10 +15,15 @@ static inline int safe_rt_sigaction(const char *file, const int lineno,
 	int ret;
 
 	ret = ltp_rt_sigaction(signum, act, oact, sigsetsize);
-	if (ret < 0) {
-		tst_brk(TBROK | TERRNO,
-			"%s:%d: ltp_rt_sigaction(%i, %p, %p, %zu) failed",
-			file, lineno, signum, act, oact, sigsetsize);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"ltp_rt_sigaction(%i, %p, %p, %zu) failed",
+			signum, act, oact, sigsetsize);
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid ltp_rt_sigaction(%i, %p, %p, %zu) return value %d",
+			signum, act, oact, sigsetsize, ret);
 	}
 
 	return ret;
@@ -35,10 +40,14 @@ static inline int safe_rt_sigprocmask(const char *file, const int lineno,
 	int ret;
 
 	ret = tst_syscall(__NR_rt_sigprocmask, how, set, oldset, sigsetsize);
-	if (ret < 0) {
-		tst_brk(TBROK | TERRNO,
-		        "%s:%d: rt_sigprocmask(%i, %p, %p, %zu) failed",
-			file, lineno, how, set, oldset, sigsetsize);
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"rt_sigprocmask(%i, %p, %p, %zu) failed",
+			how, set, oldset, sigsetsize);
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid rt_sigprocmask(%i, %p, %p, %zu) return value %d",
+			how, set, oldset, sigsetsize, ret);
 	}
 
 	return ret;
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
