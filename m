Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8BE3F4CFD
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A2BB3C9EA7
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 17:05:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7BB543C3235
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D6F731400FA2
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 17:05:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7452E2000E
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629731114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1SbotCLqi0/skCPSjcYK4eOEhA5aPdbEB/oulrzwmA=;
 b=S3sXEceZYUgQ4CEgZ7lbd3ORqWWMJraDsNxTd7XlO/AcS/BoI8EKNCb2TmNEmN2xoYDA36
 yetYeCV1DS79bKBukfRh3XPQ6uC4O3Jvpk7A4kyuJqKEMRNP7qeNBuKkE01Sb/6z7acXn6
 dPuVui+svzyzLo4aqx9hrtMQ8KAMLTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629731114;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q1SbotCLqi0/skCPSjcYK4eOEhA5aPdbEB/oulrzwmA=;
 b=ewAvrCTy5kWrs61Xha75iVA3Cwb26xE38R0HINHavO1YYd0a62ZHuuzEkZKgz0428WRDC/
 NZnvVF6xGta4KbAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D7A513BE0
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DAvQFSq5I2G1QgAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 15:05:14 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Aug 2021 17:05:18 +0200
Message-Id: <20210823150520.25614-2-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823150520.25614-1-chrubis@suse.cz>
References: <20210823150520.25614-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] tst_test_macros: Fix TST_EXP_*() default message
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

We have to erase the last comma because otherwise we pass down one more
empty parameter to the TST_EXP_*_() macros which then causes the FMT
string to be empty and we end up with an empty default message.

Consider for example:

TST_EXP_FD(open(fname, O_RDONLY));

Before the patch it would produce:

foo.c:12: TPASS: returned fd 4

After it would produce:

foo.c:12: TPASS: open(fname, O_RDONLY) returned fd 4

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_test_macros.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index d9d7f930f..ecc612b0d 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -70,7 +70,7 @@ extern void *TST_RET_PTR;
 
 #define TST_EXP_POSITIVE(SCALL, ...)                               \
 	do {                                                       \
-		TST_EXP_POSITIVE_(SCALL, __VA_ARGS__);             \
+		TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__);           \
 		                                                   \
 		if (TST_PASS) {                                    \
 			TST_MSGP_(TPASS, " returned %ld",          \
@@ -78,22 +78,22 @@ extern void *TST_RET_PTR;
 		}                                                  \
 	} while (0)
 
-#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, __VA_ARGS__)
+#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__)
 
 #define TST_EXP_FD(SCALL, ...)                                                 \
 	do {                                                                   \
-		TST_EXP_FD_SILENT(SCALL, __VA_ARGS__);                         \
+		TST_EXP_FD_SILENT(SCALL, ##__VA_ARGS__);                       \
 		                                                               \
 		if (TST_PASS)                                                  \
 			TST_MSGP_(TPASS, " returned fd %ld", TST_RET,          \
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
-#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, __VA_ARGS__)
+#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, ##__VA_ARGS__)
 
 #define TST_EXP_PID(SCALL, ...)                                                \
 	do {                                                                   \
-		TST_EXP_PID_SILENT(SCALL, __VA_ARGS__);                        \
+		TST_EXP_PID_SILENT(SCALL, ##__VA_ARGS__);                      \
 									       \
 		if (TST_PASS)                                                  \
 			TST_MSGP_(TPASS, " returned pid %ld", TST_RET,         \
@@ -124,7 +124,7 @@ extern void *TST_RET_PTR;
 
 #define TST_EXP_PASS(SCALL, ...)                                               \
 	do {                                                                   \
-		TST_EXP_PASS_SILENT(SCALL, __VA_ARGS__);                       \
+		TST_EXP_PASS_SILENT(SCALL, ##__VA_ARGS__);                     \
 		                                                               \
 		if (TST_PASS)                                                  \
 			TST_MSG_(TPASS, " passed", #SCALL, ##__VA_ARGS__);     \
@@ -158,8 +158,8 @@ extern void *TST_RET_PTR;
 		}							\
 	} while (0)
 
-#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, __VA_ARGS__)
+#define TST_EXP_FAIL(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET == 0, SCALL, ERRNO, ##__VA_ARGS__)
 
-#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, ERRNO, __VA_ARGS__)
+#define TST_EXP_FAIL2(SCALL, ERRNO, ...) TST_EXP_FAIL_(TST_RET >= 0, SCALL, ERRNO, ##__VA_ARGS__)
 
 #endif	/* TST_TEST_MACROS_H__ */
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
