Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB29372D42
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:49:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A1643C5832
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:49:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B3B13C582C
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9E76E60091E
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:48:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0BBD7AFC2
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:48:36 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  4 May 2021 17:48:31 +0200
Message-Id: <20210504154835.24881-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504154835.24881-1-mdoucha@suse.cz>
References: <20210504154835.24881-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/6] Add SAFE_RECV() helper function to LTP library
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
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
---

Changes since v1: None

 include/safe_net_fn.h  |  3 +++
 include/tst_safe_net.h |  3 +++
 lib/safe_net.c         | 25 +++++++++++++++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/include/safe_net_fn.h b/include/safe_net_fn.h
index 2fda11fab..ff81b1337 100644
--- a/include/safe_net_fn.h
+++ b/include/safe_net_fn.h
@@ -47,6 +47,9 @@ ssize_t safe_sendto(const char *file, const int lineno, char len_strict,
 ssize_t safe_sendmsg(const char *file, const int lineno, size_t msg_len,
 		  int sockfd, const struct msghdr *msg, int flags);
 
+ssize_t safe_recv(const char *file, const int lineno, size_t len,
+	int sockfd, void *buf, size_t size, int flags);
+
 ssize_t safe_recvmsg(const char *file, const int lineno, size_t msg_len,
 		  int sockfd, struct msghdr *msg, int flags);
 
diff --git a/include/tst_safe_net.h b/include/tst_safe_net.h
index 78a488a18..e85b79a3e 100644
--- a/include/tst_safe_net.h
+++ b/include/tst_safe_net.h
@@ -42,6 +42,9 @@
 #define SAFE_SENDMSG(msg_len, fd, msg, flags) \
 	safe_sendmsg(__FILE__, __LINE__, msg_len, fd, msg, flags)
 
+#define SAFE_RECV(msg_len, fd, buf, size, flags)		\
+	safe_recv(__FILE__, __LINE__, (msg_len), (fd), (buf), (size), (flags))
+
 #define SAFE_RECVMSG(msg_len, fd, msg, flags)		\
 	safe_recvmsg(__FILE__, __LINE__, msg_len, fd, msg, flags)
 
diff --git a/lib/safe_net.c b/lib/safe_net.c
index f9ebea610..211fd9b67 100644
--- a/lib/safe_net.c
+++ b/lib/safe_net.c
@@ -273,6 +273,31 @@ ssize_t safe_sendmsg(const char *file, const int lineno, size_t len,
 	return rval;
 }
 
+ssize_t safe_recv(const char *file, const int lineno, size_t len,
+	int sockfd, void *buf, size_t size, int flags)
+{
+	ssize_t rval;
+
+	rval = recv(sockfd, buf, size, flags);
+
+	if (rval == -1) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"recv(%d, %p, %zu, %d) failed", sockfd, buf, size,
+			flags);
+	} else if (rval < 0) {
+		tst_brkm_(file, lineno, TBROK | TERRNO, NULL,
+			"Invalid recv(%d, %p, %zu, %d) return value %zd",
+			sockfd, buf, size, flags, rval);
+	} else if (len && (size_t)rval != len) {
+		tst_brkm_(file, lineno, TBROK, NULL,
+			"recv(%d, %p, %zu, %d) ret(%zd) != len(%zu)",
+			sockfd, buf, size, flags, rval, len);
+	}
+
+	return rval;
+
+}
+
 ssize_t safe_recvmsg(const char *file, const int lineno, size_t len,
 		     int sockfd, struct msghdr *msg, int flags)
 {
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
