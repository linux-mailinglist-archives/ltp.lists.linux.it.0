Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 545F7172395
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 17:39:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAEA43C24B7
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 17:39:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 407AF3C2215
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 17:39:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 937A51A0110F
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 17:39:29 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D6E3AE06;
 Thu, 27 Feb 2020 16:39:29 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 27 Feb 2020 17:39:20 +0100
Message-Id: <20200227163922.317-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227163922.317-1-pvorel@suse.cz>
References: <20200227163922.317-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/4] lib: Check also flags for tst_res()
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

Allowed types: TCONF | TFAIL | TINFO | TPASS | TWARN
i.e. TBROK is forbidden.

Suggested-by: Li Wang <liwang@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

TPASS == 0, that's why TTYPE_RESULT(ttype) ?: TCONF

Kind regards,
Petr

 include/tst_common.h | 3 +++
 include/tst_test.h   | 6 +++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/tst_common.h b/include/tst_common.h
index d37e38487..54a8428fd 100644
--- a/include/tst_common.h
+++ b/include/tst_common.h
@@ -77,4 +77,7 @@
 #define TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition) \
 	do { ((void)sizeof(char[1 - 2 * !!(condition)])); } while (0)
 
+#define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
+	TST_BRK_SUPPORTS_ONLY_TCONF_TBROK(condition)
+
 #endif /* TST_COMMON_H__ */
diff --git a/include/tst_test.h b/include/tst_test.h
index 1026a422a..8508c2e38 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -47,7 +47,11 @@ void tst_res_(const char *file, const int lineno, int ttype,
               __attribute__ ((format (printf, 4, 5)));
 
 #define tst_res(ttype, arg_fmt, ...) \
-	tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__)
+	({									\
+		TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(!((TTYPE_RESULT(ttype) ?: TCONF) & \
+			(TCONF | TFAIL | TINFO | TPASS | TWARN))); 				\
+		tst_res_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
+	})
 
 void tst_resm_hexd_(const char *file, const int lineno, int ttype,
 	const void *buf, size_t size, const char *arg_fmt, ...)
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
