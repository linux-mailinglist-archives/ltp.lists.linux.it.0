Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9B17A79B
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:37:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F3533C6536
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 15:37:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9DFF13C6507
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:36:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 399E2200AD4
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:36:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7C79AB2D3
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 14:36:58 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  5 Mar 2020 15:36:57 +0100
Message-Id: <20200305143658.26584-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add TST_ASSERT_SYSCALL*() macros
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

These macros take care of the standard return value checking boilerplate
in cases where the test cannot continue after error.

- TST_ASSERT_SYSCALL() calls tst_brk() if retval != 0
- TST_ASSERT_SYSCALL_FD() calls tst_brk() if retval < 0

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---

Small convenience patch that'll simplify both test development and TST_SAFE_*()
library function generation.

 include/tst_test.h | 47 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/include/tst_test.h b/include/tst_test.h
index 8508c2e38..65a5f05b8 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -281,6 +281,53 @@ extern void *TST_RET_PTR;
 		TST_ERR = errno; \
 	} while (0)
 
+/* assert that syscall returned only 0 and nothing else */
+#define TST_ASSERT_SYSCALL(SCALL) \
+	TST_ASSERT_SYSCALL_IMPL(SCALL, __FILE__, __LINE__)
+
+#define TST_ASSERT_SYSCALL_IMPL(SCALL, FILENAME, LINENO) \
+	({ \
+		int _tst_ret; \
+		errno = 0; \
+		_tst_ret = SCALL; \
+		if (_tst_ret == -1) { \
+			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
+			tst_brk(_tst_ttype | TERRNO, "%s:%d " # SCALL \
+				" failed", FILENAME, LINENO); \
+		} \
+		if (_tst_ret != 0) { \
+			tst_brk(TBROK | TERRNO, "%s:%d " # SCALL \
+				" returned invalid value %d", FILENAME, \
+				LINENO, _tst_ret); \
+		} \
+		_tst_ret; \
+	})
+
+/*
+ * assert that syscall returned any non-negative value (e.g. valid file
+ * descriptor)
+ */
+#define TST_ASSERT_SYSCALL_FD(SCALL) \
+	TST_ASSERT_SYSCALL_FD_IMPL(SCALL, __FILE__, __LINE__)
+
+#define TST_ASSERT_SYSCALL_FD_IMPL(SCALL, FILENAME, LINENO) \
+	({ \
+		int _tst_ret; \
+		errno = 0; \
+		_tst_ret = SCALL; \
+		if (_tst_ret == -1) { \
+			int _tst_ttype = errno == ENOTSUP ? TCONF : TBROK; \
+			tst_brk(_tst_ttype | TERRNO, "%s:%d " # SCALL \
+				" failed", FILENAME, LINENO); \
+		} \
+		if (_tst_ret < 0) { \
+			tst_brk(TBROK | TERRNO, "%s:%d " # SCALL \
+				" returned invalid value %d", FILENAME, \
+				LINENO, _tst_ret); \
+		} \
+		_tst_ret; \
+	})
+
 /*
  * Functions to convert ERRNO to its name and SIGNAL to its name.
  */
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
