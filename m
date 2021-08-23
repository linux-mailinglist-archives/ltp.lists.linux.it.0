Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AADB03F4CFF
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EF823C9E83
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CCEEE3C4AF3
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C9AD2600800
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 07AC421F7F
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629731115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7feYuVxLovPjn5q3luTG2jVHmXgUo6HZkwoDAW4rAs=;
 b=JLYGg/CCqZ7jhIx9OlYdKMzLR8Ck4ACp03inIyRa/Sg8MnbFHVSxq5K1W83lsQcwH+MJ3E
 lmidyV0qw7f6oNqECf6C2p4OcBrTOGVENvlsJ5S9Rulu/tZV7SmdndTX/f7a8oeJ0DjZX8
 A1DHr4mMgRbvYE5Vbosilm3rLV9KTdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629731115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7feYuVxLovPjn5q3luTG2jVHmXgUo6HZkwoDAW4rAs=;
 b=DYdIvsOmp+e0VayzAbZmV+AeIH2SBsrl/CuTV89mt7taGby3VfD0RGpxngST6o6kGCIpUI
 wh6uJoyV/wwXDZDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1C1713BE0
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d2XZNSq5I2G3QgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:14 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Aug 2021 17:05:19 +0200
Message-Id: <20210823150520.25614-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823150520.25614-1-chrubis@suse.cz>
References: <20210823150520.25614-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] tst_test_macros: Stringify early
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

We have to stringify the SCALL argument early, otherwise it will be
replaced in a case that it's a macro.

This is not fixing any hypotetical problem for instance the
tst_syscall() is a macro. If we pass it to a TST_EXP_*() macro and keep
it as a default message it will produce messy output.

Take for an example:

TST_EXP_FAIL(tst_sycall(__NR_foo, 1), EINVAL);

Before this patch it produces:

foo.c:12: TPASS: ({ int tst_ret; if (277 == -1) { (*__errno_location ()) = 38; tst_ret = -1; } else { tst_ret = syscall(277, 1); } if (tst_ret == -1 && (*__errno_location ()) == 38) { ({ do { ((void)sizeof(char[1 - 2 * !!(!((32) & (2 | 32 | 1)))])); } while (0); tst_brk_("foo.c", 12, (32), ("syscall(-1496763488) " "__NR_foo" " not supported"),277); }); } tst_ret; }) : EINVAL (22)

After this patch it will produce:

foo.c:12: TPASS: tst_syscall(__NR_foo, 1) : EINVAL (22)

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test_macros.h | 40 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index ecc612b0d..50598aa15 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -46,7 +46,7 @@ extern void *TST_RET_PTR;
 	tst_res_(__FILE__, __LINE__, RES, \
 		TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
 
-#define TST_EXP_POSITIVE_(SCALL, ...)                                          \
+#define TST_EXP_POSITIVE_(SCALL, SSCALL, ...)                                  \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
@@ -54,13 +54,13 @@ extern void *TST_RET_PTR;
 		                                                               \
 		if (TST_RET == -1) {                                           \
 			TST_MSG_(TFAIL | TTERRNO, " failed",                   \
-			         #SCALL, ##__VA_ARGS__);                       \
+			         SSCALL, ##__VA_ARGS__);                       \
 			break;                                                 \
 		}                                                              \
 		                                                               \
 		if (TST_RET < 0) {                                             \
 			TST_MSGP_(TFAIL | TTERRNO, " invalid retval %ld",      \
-			          TST_RET, #SCALL, ##__VA_ARGS__);             \
+			          TST_RET, SSCALL, ##__VA_ARGS__);             \
 			break;                                                 \
 		}                                                              \
                                                                                \
@@ -70,7 +70,7 @@ extern void *TST_RET_PTR;
 
 #define TST_EXP_POSITIVE(SCALL, ...)                               \
 	do {                                                       \
-		TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__);           \
+		TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__);   \
 		                                                   \
 		if (TST_PASS) {                                    \
 			TST_MSGP_(TPASS, " returned %ld",          \
@@ -78,29 +78,29 @@ extern void *TST_RET_PTR;
 		}                                                  \
 	} while (0)
 
-#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__)
+#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__)
 
 #define TST_EXP_FD(SCALL, ...)                                                 \
 	do {                                                                   \
-		TST_EXP_FD_SILENT(SCALL, ##__VA_ARGS__);                       \
+		TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__);               \
 		                                                               \
 		if (TST_PASS)                                                  \
 			TST_MSGP_(TPASS, " returned fd %ld", TST_RET,          \
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
-#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__)
+#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__)
 
 #define TST_EXP_PID(SCALL, ...)                                                \
 	do {                                                                   \
-		TST_EXP_PID_SILENT(SCALL, ##__VA_ARGS__);                      \
+		TST_EXP_POSITIVE_(SCALL, #SCALL, ##__VA_ARGS__);               \
 									       \
 		if (TST_PASS)                                                  \
 			TST_MSGP_(TPASS, " returned pid %ld", TST_RET,         \
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
-#define TST_EXP_PASS_SILENT(SCALL, ...)                                        \
+#define TST_EXP_PASS_SILENT_(SCALL, SSCALL, ...)                               \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
@@ -108,13 +108,13 @@ extern void *TST_RET_PTR;
 		                                                               \
 		if (TST_RET == -1) {                                           \
 			TST_MSG_(TFAIL | TTERRNO, " failed",                   \
-			         #SCALL, ##__VA_ARGS__);                       \
+			         SSCALL, ##__VA_ARGS__);                       \
 		        break;                                                 \
 		}                                                              \
 		                                                               \
 		if (TST_RET != 0) {                                            \
 			TST_MSGP_(TFAIL | TTERRNO, " invalid retval %ld",      \
-			          TST_RET, #SCALL, ##__VA_ARGS__);             \
+			          TST_RET, SSCALL, ##__VA_ARGS__);             \
 			break;                                                 \
 		}                                                              \
                                                                                \
@@ -122,44 +122,46 @@ extern void *TST_RET_PTR;
                                                                                \
 	} while (0)
 
+#define TST_EXP_PASS_SILENT(SCALL, ...) TST_EXP_PASS_SILENT_(SCALL, #SCALL, ##__VA_ARGS__)
+
 #define TST_EXP_PASS(SCALL, ...)                                               \
 	do {                                                                   \
-		TST_EXP_PASS_SILENT(SCALL, ##__VA_ARGS__);                     \
+		TST_EXP_PASS_SILENT_(SCALL, #SCALL, ##__VA_ARGS__);            \
 		                                                               \
 		if (TST_PASS)                                                  \
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
 	} while (0)                                                            \
 
-#define TST_EXP_FAIL_(PASS_COND, SCALL, ERRNO, ...)                            \
+#define TST_EXP_FAIL_(PASS_COND, SCALL, SSCALL, ERRNO, ...)                    \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
 		TST_PASS = 0;                                                  \
 		                                                               \
 		if (PASS_COND) {                                               \
-			TST_MSG_(TFAIL, " succeeded", #SCALL, ##__VA_ARGS__);  \
+			TST_MSG_(TFAIL, " succeeded", SSCALL, ##__VA_ARGS__);  \
 		        break;                                                 \
 		}                                                              \
 		                                                               \
 		if (TST_RET != -1) {                                           \
 			TST_MSGP_(TFAIL | TTERRNO, " invalid retval %ld",      \
-			          TST_RET, #SCALL, ##__VA_ARGS__);             \
+			          TST_RET, SSCALL, ##__VA_ARGS__);             \
 			break;                                                 \
 		}                                                              \
 		                                                               \
 		if (TST_ERR == ERRNO) {					\
 			TST_MSG_(TPASS | TTERRNO, " ",			\
-				 #SCALL, ##__VA_ARGS__);		\
+				 SSCALL, ##__VA_ARGS__);		\
 			TST_PASS = 1;					\
 		} else {						\
 			TST_MSGP_(TFAIL | TTERRNO, " expected %s",	\
 				  tst_strerrno(ERRNO),			\
-				  #SCALL, ##__VA_ARGS__);		\
+				  SSCALL, ##__VA_ARGS__);		\
 		}							\
 	} while (0)
 
-#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, ##__VA_ARGS__)
+#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, #SCALL, ERRNO, ##__VA_ARGS__)
 
-#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, ERRNO, ##__VA_ARGS__)
+#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, #SCALL, ERRNO, ##__VA_ARGS__)
 
 #endif	/* TST_TEST_MACROS_H__ */
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
