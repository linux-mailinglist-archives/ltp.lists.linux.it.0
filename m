Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2D258F55
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Sep 2020 15:46:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7EC573C2DAA
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Sep 2020 15:46:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 610233C181A
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 15:46:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D440B1400F91
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 15:46:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73F48AC55
 for <ltp@lists.linux.it>; Tue,  1 Sep 2020 13:46:14 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  1 Sep 2020 15:46:12 +0200
Message-Id: <20200901134613.20839-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] Add SAFE_TIMER_*() functions to
 tst_safe_clocks.h
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Changes since v1: None

 include/tst_safe_clocks.h | 90 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/include/tst_safe_clocks.h b/include/tst_safe_clocks.h
index 4cb5f41ed..5909f4083 100644
--- a/include/tst_safe_clocks.h
+++ b/include/tst_safe_clocks.h
@@ -55,6 +55,83 @@ static inline void safe_clock_settime(const char *file, const int lineno,
 	}
 }
 
+static inline int safe_timer_create(const char *file, const int lineno,
+	clockid_t clockid, struct sigevent *sevp, timer_t *timerid)
+{
+	int ret;
+
+	errno = 0;
+	ret = timer_create(clockid, sevp, timerid);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"timer_create(%s) failed", tst_clock_name(clockid));
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timer_create(%s) return value %d",
+			tst_clock_name(clockid), ret);
+	}
+
+	return ret;
+}
+
+static inline int safe_timer_settime(const char *file, const int lineno,
+	timer_t timerid, int flags, const struct itimerspec *new_value,
+	struct itimerspec *old_value)
+{
+	int ret;
+
+	errno = 0;
+	ret = timer_settime(timerid, flags, new_value, old_value);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"timer_settime() failed");
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timer_settime() return value %d", ret);
+	}
+
+	return ret;
+}
+
+static inline int safe_timer_gettime(const char *file, const int lineno,
+	timer_t timerid, struct itimerspec *curr_value)
+{
+	int ret;
+
+	errno = 0;
+	ret = timer_gettime(timerid, curr_value);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"timer_gettime() failed");
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timer_gettime() return value %d", ret);
+	}
+
+	return ret;
+}
+
+static inline int safe_timer_delete(const char *file, const int lineno,
+	timer_t timerid)
+{
+	int ret;
+
+	errno = 0;
+	ret = timer_delete(timerid);
+
+	if (ret == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, "timer_delete() failed");
+	} else if (ret) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid timer_delete() return value %d", ret);
+	}
+
+	return ret;
+}
+
 #define SAFE_CLOCK_GETRES(clk_id, res)\
 	safe_clock_getres(__FILE__, __LINE__, (clk_id), (res))
 
@@ -64,4 +141,17 @@ static inline void safe_clock_settime(const char *file, const int lineno,
 #define SAFE_CLOCK_SETTIME(clk_id, tp)\
 	safe_clock_settime(__FILE__, __LINE__, (clk_id), (tp))
 
+#define SAFE_TIMER_CREATE(clockid, sevp, timerid)\
+	safe_timer_create(__FILE__, __LINE__, (clockid), (sevp), (timerid))
+
+#define SAFE_TIMER_SETTIME(timerid, flags, new_value, old_value)\
+	safe_timer_settime(__FILE__, __LINE__, (timerid), (flags),\
+		(new_value), (old_value))
+
+#define SAFE_TIMER_GETTIME(timerid, curr_value)\
+	safe_timer_gettime(__FILE__, __LINE__, (timerid), (curr_value))
+
+#define SAFE_TIMER_DELETE(timerid)\
+	safe_timer_delete(__FILE__, __LINE__, timerid)
+
 #endif /* SAFE_CLOCKS_H__ */
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
