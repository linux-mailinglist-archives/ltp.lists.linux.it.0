Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AF2595A2D
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 13:32:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA8113C9A9A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Aug 2022 13:32:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 790C03C9808
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 13:32:28 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E8E0460075A
 for <ltp@lists.linux.it>; Tue, 16 Aug 2022 13:32:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DD65371EA;
 Tue, 16 Aug 2022 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1660649546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyUcWP2bT7oV1Wm3pkRTlYA5bJWIBlomhYgPo67h0DY=;
 b=b+4RMicw2KK6+GHAfLyBMb7J7R9lNIypapfzHUKcxVSrVrCGjd4Kn+8AFo5k7jvqvX3OZ2
 p9gK7v5MHxgXlQT05i6DKf8gfHfAdgEPy6oOE7rVlCT6EoUAkhE1JerfoYHMavyNMuo4w4
 h1gTRbWCwztYKgc4mJVtf0Lrn+nQvq4=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BF5F139B7;
 Tue, 16 Aug 2022 11:32:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gE4JBUqA+2JYNAAAMHmgww
 (envelope-from <andrea.cervesato@suse.com>); Tue, 16 Aug 2022 11:32:26 +0000
To: ltp@lists.linux.it
Date: Tue, 16 Aug 2022 13:31:40 +0200
Message-Id: <20220816113142.25638-2-andrea.cervesato@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816113142.25638-1-andrea.cervesato@suse.com>
References: <20220816113142.25638-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/3] Add more mqueue safe macros
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

Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/tst_safe_posix_ipc.h | 73 ++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/include/tst_safe_posix_ipc.h b/include/tst_safe_posix_ipc.h
index b60c12c9e..78ce660b5 100644
--- a/include/tst_safe_posix_ipc.h
+++ b/include/tst_safe_posix_ipc.h
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (C) 2017-2019 Petr Vorel pvorel@suse.cz
+ * Copyright (C) 2022 Andrea Cervesato andrea.cervesato@suse.com
  */
 
 #ifndef TST_SAFE_POSIX_IPC_H__
@@ -12,6 +13,18 @@
 #define SAFE_MQ_OPEN(pathname, oflags, ...) \
 	safe_mq_open(__FILE__, __LINE__, (pathname), (oflags), ##__VA_ARGS__)
 
+#define SAFE_MQ_NOTIFY(mqdes, sevp) \
+	safe_mq_notify(__FILE__, __LINE__, (mqdes), (sevp))
+
+#define SAFE_MQ_SEND(mqdes, msg_ptr, msg_len, msg_prio) \
+	safe_mq_send(__FILE__, __LINE__, (mqdes), (msg_ptr), (msg_len), (msg_prio))
+
+#define SAFE_MQ_CLOSE(mqdes) \
+	safe_mq_close(__FILE__, __LINE__, (mqdes))
+
+#define SAFE_MQ_UNLINK(name) \
+	safe_mq_unlink(__FILE__, __LINE__, (name))
+
 static inline int safe_mq_open(const char *file, const int lineno,
 			       const char *pathname, int oflags, ...)
 {
@@ -46,4 +59,64 @@ static inline int safe_mq_open(const char *file, const int lineno,
 	return rval;
 }
 
+static int safe_mq_notify(const char *file, const int lineno,
+			  mqd_t mqdes, const struct sigevent *sevp)
+{
+	int rval;
+
+	rval = mq_notify(mqdes, sevp);
+
+	if (rval == -1)
+		tst_brk_(file, lineno, TBROK | TERRNO, "mq_notify() failed");
+
+	return rval;
+}
+
+static int safe_mq_send(const char *file, const int lineno,
+			mqd_t mqdes, const char *msg_ptr,
+			size_t msg_len, unsigned int msg_prio)
+{
+	int rval;
+
+	rval = mq_send(mqdes, msg_ptr, msg_len, msg_prio);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO, 
+			"mq_send(%d,%s,%lu,%d) failed", mqdes, msg_ptr,
+			msg_len, msg_prio);
+	}
+
+	return rval;
+}
+
+static int safe_mq_close(const char *file, const int lineno,
+			  mqd_t mqdes)
+{
+	int rval;
+
+	rval = mq_close(mqdes);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"mq_close(%d) failed", mqdes);
+	}
+
+	return rval;
+}
+
+static int safe_mq_unlink(const char *file, const int lineno,
+			  const char *name)
+{
+	int rval;
+
+	rval = mq_unlink(name);
+
+	if (rval == -1) {
+		tst_brk_(file, lineno, TBROK | TERRNO,
+			"mq_unlink(%s) failed", name);
+	}
+
+	return rval;
+}
+
 #endif /* TST_SAFE_POSIX_IPC_H__ */
-- 
2.35.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
