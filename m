Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0A150567
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Feb 2020 12:40:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 195503C2627
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Feb 2020 12:40:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0618D3C2545
 for <ltp@lists.linux.it>; Mon,  3 Feb 2020 12:40:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4095C100053F
 for <ltp@lists.linux.it>; Mon,  3 Feb 2020 12:40:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 787A9AFF7
 for <ltp@lists.linux.it>; Mon,  3 Feb 2020 11:40:02 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  3 Feb 2020 12:39:55 +0100
Message-Id: <20200203113956.13176-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add TST_SPIN_TEST() macro
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

The TST_RETRY_FUNC() macro requires a single return value that'll be considered
success. This cannot be used with system calls that e.g. return a new file
descriptor because the success value is somewhat unpredictable.

Add a new macro TST_SPIN_TEST that'll work mostly like TST_RETRY_FUNC(), except:
- Any negative return value means failure, any non-negative return value means
  success.
- The loop will fall through on timeout instead of callid tst_brk(). TST_RET
  and TST_ERR will be set to the values returned by the last FUNC call.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 include/tst_common.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tst_common.h b/include/tst_common.h
index a0c06a3f7..72e00ca81 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -55,6 +55,34 @@
 	ERET;								\
 })
 
+/**
+ * TST_SPIN_TEST() - Repeatedly retry a function with an increasing delay.
+ * @FUNC - The function which will be retried
+ *
+ * Same as TST_RETRY_FUNC() but any non-negative return value is accepted
+ * as success and tst_brk() will not be called on timeout.
+ */
+#define TST_SPIN_TEST(FUNC) \
+	TST_SPIN_TEST_EXP_BACKOFF(FUNC, 1, -1)
+
+#define TST_SPIN_TEST_EXP_BACKOFF(FUNC, MAX_DELAY, GOOD_ERRNO)	\
+({	unsigned int tst_delay_, tst_max_delay_;			\
+	tst_delay_ = 1;							\
+	tst_max_delay_ = tst_multiply_timeout(MAX_DELAY * 1000000);	\
+	for (;;) {							\
+		TEST(FUNC);						\
+		if (TST_RET >= 0 || (GOOD_ERRNO >= 0 && TST_ERR == GOOD_ERRNO))	\
+			break;						\
+		if (tst_delay_ < tst_max_delay_) {			\
+			usleep(tst_delay_);				\
+			tst_delay_ *= 2;				\
+		} else {						\
+			break;						\
+		}							\
+	}								\
+	TST_RET;							\
+})
+
 #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
 	do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)
 
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
