Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B4C4A893A
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Feb 2022 18:05:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C7E233C9A79
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Feb 2022 18:05:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ECA283C9A77
 for <ltp@lists.linux.it>; Thu,  3 Feb 2022 18:05:30 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 28B69200C28
 for <ltp@lists.linux.it>; Thu,  3 Feb 2022 18:05:29 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6E52F210F5;
 Thu,  3 Feb 2022 17:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643907929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBeI0pgN2jSiXnsjmWQjqEsGeNJ7KfYH6FGNB7Jjg5c=;
 b=wziokmvyFQQAXcbKV3AdY2Sp4q9vuBKTFFzdok3ZvQUWEbYu08RZFd6VvdfRjsWOGAp+DE
 kE5ypynO+vkIj3U96PsOFt1LgKB0EvPJs9MWVJPllwLq49117sfw0fhCf20skKDBET1Q1a
 Ut6Pe+3+AY1QXRDxFuT2Wp1EWkhfRKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643907929;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBeI0pgN2jSiXnsjmWQjqEsGeNJ7KfYH6FGNB7Jjg5c=;
 b=HxUgJbyaUadcv4X2bw+ciqBtaKaDMljHCea1M7nqUguI8akWPdjatW8qmqD2SCotqnuaWq
 +iusVxDVWFT2ZjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 007C513A07;
 Thu,  3 Feb 2022 17:05:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wJZQOlgL/GEJOAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 03 Feb 2022 17:05:28 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  3 Feb 2022 18:05:21 +0100
Message-Id: <20220203170522.22051-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220203170522.22051-1-pvorel@suse.cz>
References: <20220203170522.22051-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] sctputil.h: Fix some formatting
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
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
 Neil Horman <nhorman@tuxdriver.com>, Vlad Yasevich <vyasevich@gmail.com>,
 linux-sctp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* use tabs (code indent should use tabs where possible,
  please, no spaces at the start of a line)
* constant on second place in if()
* missing a blank line after declarations

Just few problems related to fix in the next commit, there are more if
you run:
$ ./scripts/checkpatch.pl -f --no-tree --terse --no-summary --ignore CONST_STRUCT,VOLATILE,SPLIT_STRING utils/sctp/testlib/sctputil.h

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 utils/sctp/testlib/sctputil.h | 100 +++++++++++++++++++++++-----------
 1 file changed, 69 insertions(+), 31 deletions(-)

diff --git a/utils/sctp/testlib/sctputil.h b/utils/sctp/testlib/sctputil.h
index 6c3371c960..1e21760bec 100644
--- a/utils/sctp/testlib/sctputil.h
+++ b/utils/sctp/testlib/sctputil.h
@@ -133,64 +133,80 @@ extern int TST_CNT;
 static inline int test_socket(int domain, int type, int protocol)
 {
 	int sk = socket(domain, type, protocol);
-        if (-1 == sk)
-                tst_brkm(TBROK, tst_exit, "socket: %s", strerror(errno));
+
+	if (sk == -1)
+		tst_brkm(TBROK, tst_exit, "socket: %s", strerror(errno));
+
 	return sk;
 }
 
 static inline int test_bind(int sk, struct sockaddr *addr, socklen_t addrlen)
 {
 	int error = bind(sk, addr, addrlen);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "bind: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "bind: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_bindx_add(int sk, struct sockaddr *addr, int count)
 {
 	int error = sctp_bindx(sk, addr, count, SCTP_BINDX_ADD_ADDR);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "bindx (add): %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "bindx (add): %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_listen(int sk, int backlog)
 {
 	int error = listen(sk, backlog);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "listen: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "listen: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_connect(int sk, struct sockaddr *addr, socklen_t addrlen)
 {
 	int error = connect(sk, addr, addrlen);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "connect: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "connect: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_connectx(int sk, struct sockaddr *addr, int count)
 {
 	int error = sctp_connectx(sk, addr, count, NULL);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "connectx: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "connectx: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_accept(int sk, struct sockaddr *addr, socklen_t *addrlen)
 {
 	int error = accept(sk, addr, addrlen);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "accept: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "accept: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_send(int sk, const void *msg, size_t len, int flags)
 {
 	int error = send(sk, msg, len, flags);
+
 	if ((long)len != error)
 		tst_brkm(TBROK, tst_exit, "send: error:%d errno:%d", error, errno);
+
 	return error;
 }
 
@@ -198,8 +214,10 @@ static inline int test_sendto(int sk, const void *msg, size_t len, int flags,
 			      const struct sockaddr *to, socklen_t tolen)
 {
 	int error = sendto(sk, msg, len, flags, to, tolen);
+
 	if ((long)len != error)
 		tst_brkm(TBROK, tst_exit, "sendto: error:%d errno:%d", error, errno);
+
 	return error;
 }
 
@@ -207,33 +225,40 @@ static inline int test_sendmsg(int sk, const struct msghdr *msg, int flags,
 			       int msglen)
 {
 	int error = sendmsg(sk, msg, flags);
-        if (msglen != error)
-                tst_brkm(TBROK, tst_exit, "sendmsg: error:%d errno:%d",
-			 error, errno);
+
+	if (msglen != error)
+		tst_brkm(TBROK, tst_exit, "sendmsg: error:%d errno:%d", error, errno);
+
 	return error;
 }
 
 static inline int test_recv(int sk, void *buf, size_t len, int flags)
 {
 	int error = recv(sk, buf, len, flags);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "recv: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "recv: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_recvmsg(int sk, struct msghdr *msg, int flags)
 {
 	int error = recvmsg(sk, msg, flags);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "recvmsg: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "recvmsg: %s", strerror(errno));
+
 	return error;
 }
 
 static inline int test_shutdown(int sk, int how)
 {
 	int error = shutdown(sk, how);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "shutdown: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "shutdown: %s", strerror(errno));
+
 	return error;
 }
 
@@ -241,6 +266,7 @@ static inline int test_getsockopt(int sk, int optname, void *optval,
 				  socklen_t *optlen)
 {
 	int error = getsockopt(sk, SOL_SCTP, optname, optval, optlen);
+
 	if (error)
 		tst_brkm(TBROK, tst_exit, "getsockopt(%d): %s", optname,
 			 strerror(errno));
@@ -251,17 +277,21 @@ static inline int test_setsockopt(int sk, int optname, const void *optval,
 				  socklen_t optlen)
 {
 	int error = setsockopt(sk, SOL_SCTP, optname, optval, optlen);
+
 	if (error)
 		tst_brkm(TBROK, tst_exit, "setsockopt(%d): %s", optname,
 			 strerror(errno));
+
 	return error;
 }
 
 static inline int test_sctp_peeloff(int sk, sctp_assoc_t assoc_id)
 {
 	int error = sctp_peeloff(sk, assoc_id);
-        if (-1 == error)
-                tst_brkm(TBROK, tst_exit, "sctp_peeloff: %s", strerror(errno));
+
+	if (error == -1)
+		tst_brkm(TBROK, tst_exit, "sctp_peeloff: %s", strerror(errno));
+
 	return error;
 }
 
@@ -272,10 +302,12 @@ static inline int test_sctp_sendmsg(int s, const void *msg, size_t len,
 				    uint32_t context)
 {
 	int error = sctp_sendmsg(s, msg, len, to, tolen, ppid, flags, stream_no,
-	  		         timetolive, context);
-	if ((long)len != error)
+				 timetolive, context);
+
+	if (error != (long)len)
 		tst_brkm(TBROK, tst_exit, "sctp_sendmsg: error:%d errno:%d",
 			 error, errno);
+
 	return error;
 }
 
@@ -284,9 +316,11 @@ static inline int test_sctp_send(int s, const void *msg, size_t len,
 				 int flags)
 {
 	int error = sctp_send(s, msg, len, sinfo, flags);
-	if ((long)len != error)
+
+	if (error != (long)len)
 		tst_brkm(TBROK, tst_exit, "sctp_send: error:%d errno:%d",
 			 error, errno);
+
 	return error;
 }
 
@@ -296,16 +330,20 @@ static inline int test_sctp_recvmsg(int sk, void *msg, size_t len,
 				    int *msg_flags)
 {
 	int error = sctp_recvmsg(sk, msg, len, from, fromlen, sinfo, msg_flags);
-	if (-1 == error)
+
+	if (error == -1)
 		tst_brkm(TBROK, tst_exit, "sctp_recvmsg: %s", strerror(errno));
+
 	return error;
 }
 
 static inline void *test_malloc(size_t size)
 {
 	void *buf = malloc(size);
-        if (NULL == buf)
-                tst_brkm(TBROK, tst_exit, "malloc failed");
+
+	if (NULL == buf)
+		tst_brkm(TBROK, tst_exit, "malloc failed");
+
 	return buf;
 }
 
-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
