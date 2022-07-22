Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFDA57E13D
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 14:06:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 650323CA0FA
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jul 2022 14:06:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E31943C9465
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 14:05:36 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 06A1F60020A
 for <ltp@lists.linux.it>; Fri, 22 Jul 2022 14:05:35 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 411182032A;
 Fri, 22 Jul 2022 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1658491535; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8OI1AzWTGVbtXz/WcqGEfE5golnUCTHBMhjtYb9IA8Q=;
 b=n4/nOMQ7FvCh+N9H0tAeWxp0vz1KhuZlqiG1KJXARxce+isDhoTVx24x9mOknCuUvfaC5Q
 soNPJPdUFVTr9BYfJKXuLQUG2Pbn9bcfhfaRkP7TcD1Uq1GemVLOkRzBYlu8REqgRhLT5/
 L/iPAjczc7UBRe4R2LQ5xueR/OGk78M=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D623134A9;
 Fri, 22 Jul 2022 12:05:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2JZeAI+S2mJULwAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Fri, 22 Jul 2022 12:05:35 +0000
To: ltp@lists.linux.it
Date: Fri, 22 Jul 2022 14:04:55 +0200
Message-Id: <20220722120501.28670-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220722120501.28670-1-andrea.cervesato@suse.com>
References: <20220722120501.28670-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/7] Add more safe macros for mqueue API
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Added SAFE_MQ_UNLINK and SAFE_MQ_CLOSE in tst_safe_posix_ipc.h

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/tst_safe_posix_ipc.h | 45 ++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/include/tst_safe_posix_ipc.h b/include/tst_safe_posix_ipc.h
index b60c12c9e..5bfef03a9 100644
--- a/include/tst_safe_posix_ipc.h
+++ b/include/tst_safe_posix_ipc.h
@@ -12,6 +12,12 @@
 #define SAFE_MQ_OPEN(pathname, oflags, ...) \
 	safe_mq_open(__FILE__, __LINE__, (pathname), (oflags), ##__VA_ARGS__)
 
+#define SAFE_MQ_CLOSE(__mqdes) \
+	safe_mq_close(__FILE__, __LINE__, (__mqdes))
+
+#define SAFE_MQ_UNLINK(name) \
+	safe_mq_unlink(__FILE__, __LINE__, (name))
+
 static inline int safe_mq_open(const char *file, const int lineno,
 			       const char *pathname, int oflags, ...)
 {
@@ -41,6 +47,45 @@ static inline int safe_mq_open(const char *file, const int lineno,
 		tst_brk_(file, lineno, TBROK | TERRNO,
 			"mq_open(%s,%d,%04o,%p) failed", pathname, oflags,
 			mode, attr);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid mq_open(%s) return value %d", pathname, rval);
+	}
+
+	return rval;
+}
+
+static inline int safe_mq_close(const char *file, const int lineno,
+				mqd_t __mqdes)
+{
+	int rval;
+
+	rval = mq_close(__mqdes);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"mq_close(%d) failed", __mqdes);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid mq_close(%d) return value %d", __mqdes, rval);
+	}
+
+	return rval;
+}
+
+static inline int safe_mq_unlink(const char *file, const int lineno,
+				const char* name)
+{
+	int rval;
+
+	rval = mq_unlink(name);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"mq_unlink(%s) failed", name);
+	} else if (rval < 0) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"Invalid mq_unlink(%s) return value %d", name, rval);
 	}
 
 	return rval;
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
