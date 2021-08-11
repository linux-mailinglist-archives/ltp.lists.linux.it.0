Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 859C03E8D2E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 11:21:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D3D83C7020
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Aug 2021 11:21:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B48BB3C32BD
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 11:21:40 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A8E281000A38
 for <ltp@lists.linux.it>; Wed, 11 Aug 2021 11:21:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A9A851FEBA;
 Wed, 11 Aug 2021 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628673698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SZj2xFFYlXeOBJ3NhA6qpuSwAdUxYHoazCDt2hkpdzY=;
 b=Lb0Rq8FMkN5y9y9EWRqQ/u2Xi8ulrz5K8gaZ6hJhziXEcKUbmuoTL99wBOZQ7YXE0xzGn0
 KTNaPasPrYMvWpC8oww3uSwPbNjNPT1TZ53TbNyFO3hp4Q5a0SxPGdLahbiq1uLkBCA8JO
 cxW7dPmAfq4jv/6aXCtAe3V7Bg7v9c8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628673698;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SZj2xFFYlXeOBJ3NhA6qpuSwAdUxYHoazCDt2hkpdzY=;
 b=A53o7jSuGISGlGbqnXv72k8Fd0bjWwypNDLDTVK5LRZHTcWrYP/xlcYCJNVzUw0cIXM9yX
 4N7N5VeZ1MGzr0BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 654EE13BFC;
 Wed, 11 Aug 2021 09:21:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p0C8GKKWE2G8bwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 11 Aug 2021 09:21:38 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 11 Aug 2021 11:21:49 +0200
Message-Id: <20210811092149.11287-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_test_macros.h: Make TST_EXP_POSSITIVE() print
 TPASS as well
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
Cc: sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

So that it could be used in the tests.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
CC: sujiaxun <sujiaxun@uniontech.com>
---
 include/tst_test_macros.h | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/tst_test_macros.h b/include/tst_test_macros.h
index cd65d8d0d..d9d7f930f 100644
--- a/include/tst_test_macros.h
+++ b/include/tst_test_macros.h
@@ -46,7 +46,7 @@ extern void *TST_RET_PTR;
 	tst_res_(__FILE__, __LINE__, RES, \
 		TST_FMT_(TST_2_(dummy, ##__VA_ARGS__, SCALL) FMT, __VA_ARGS__), PAR)
 
-#define TST_EXP_POSITIVE(SCALL, ...)                                           \
+#define TST_EXP_POSITIVE_(SCALL, ...)                                          \
 	do {                                                                   \
 		TEST(SCALL);                                                   \
 		                                                               \
@@ -68,7 +68,17 @@ extern void *TST_RET_PTR;
                                                                                \
 	} while (0)
 
-#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE(SCALL, __VA_ARGS__)
+#define TST_EXP_POSITIVE(SCALL, ...)                               \
+	do {                                                       \
+		TST_EXP_POSITIVE_(SCALL, __VA_ARGS__);             \
+		                                                   \
+		if (TST_PASS) {                                    \
+			TST_MSGP_(TPASS, " returned %ld",          \
+			          TST_RET, #SCALL, ##__VA_ARGS__); \
+		}                                                  \
+	} while (0)
+
+#define TST_EXP_FD_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, __VA_ARGS__)
 
 #define TST_EXP_FD(SCALL, ...)                                                 \
 	do {                                                                   \
@@ -79,7 +89,7 @@ extern void *TST_RET_PTR;
 				#SCALL, ##__VA_ARGS__);                        \
 	} while (0)
 
-#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE(SCALL, __VA_ARGS__)
+#define TST_EXP_PID_SILENT(SCALL, ...)	TST_EXP_POSITIVE_(SCALL, __VA_ARGS__)
 
 #define TST_EXP_PID(SCALL, ...)                                                \
 	do {                                                                   \
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
