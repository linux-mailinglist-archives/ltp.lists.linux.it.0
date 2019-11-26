Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5AF109D6F
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:02:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F8873C2026
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Nov 2019 13:02:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 266CC3C01FC
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:43 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id CA7B2600F60
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 13:02:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 18113B459
 for <ltp@lists.linux.it>; Tue, 26 Nov 2019 12:02:42 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 26 Nov 2019 13:02:39 +0100
Message-Id: <20191126120241.5460-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191126120241.5460-1-mdoucha@suse.cz>
References: <20191126120241.5460-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] Add SAFE_ACCEPT() to LTP safe net library
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
---
 include/safe_net_fn.h  |  3 +++
 include/tst_safe_net.h |  3 +++
 lib/safe_net.c         | 16 ++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/include/safe_net_fn.h b/include/safe_net_fn.h
index fdbb3791c..2fda11fab 100644
--- a/include/safe_net_fn.h
+++ b/include/safe_net_fn.h
@@ -57,6 +57,9 @@ int safe_bind(const char *file, const int lineno, void (cleanup_fn)(void),
 int safe_listen(const char *file, const int lineno, void (cleanup_fn)(void),
 		int socket, int backlog);
 
+int safe_accept(const char *file, const int lineno, void (cleanup_fn)(void),
+		int sockfd, struct sockaddr *addr, socklen_t *addrlen);
+
 int safe_connect(const char *file, const int lineno, void (cleanup_fn)(void),
 		 int sockfd, const struct sockaddr *addr, socklen_t addrlen);
 
diff --git a/include/tst_safe_net.h b/include/tst_safe_net.h
index d49a36073..9bc257ce8 100644
--- a/include/tst_safe_net.h
+++ b/include/tst_safe_net.h
@@ -64,6 +64,9 @@
 #define SAFE_LISTEN(socket, backlog) \
 	safe_listen(__FILE__, __LINE__, NULL, socket, backlog)
 
+#define SAFE_ACCEPT(sockfd, addr, addrlen) \
+	safe_accept(__FILE__, __LINE__, NULL, sockfd, addr, addrlen)
+
 #define SAFE_CONNECT(sockfd, addr, addrlen) \
 	safe_connect(__FILE__, __LINE__, NULL, sockfd, addr, addrlen)
 
diff --git a/lib/safe_net.c b/lib/safe_net.c
index abebd1899..499368007 100644
--- a/lib/safe_net.c
+++ b/lib/safe_net.c
@@ -322,6 +322,22 @@ int safe_listen(const char *file, const int lineno, void (cleanup_fn)(void),
 	return rval;
 }
 
+int safe_accept(const char *file, const int lineno, void (cleanup_fn)(void),
+		int sockfd, struct sockaddr *addr, socklen_t *addrlen)
+{
+	int rval;
+
+	rval = accept(sockfd, addr, addrlen);
+
+	if (rval < 0) {
+		tst_brkm(TBROK | TERRNO, cleanup_fn,
+			"%s:%d: accept(%d, %p, %d) failed", file, lineno,
+			sockfd, addr, *addrlen);
+	}
+
+	return rval;
+}
+
 int safe_connect(const char *file, const int lineno, void (cleanup_fn)(void),
 		 int sockfd, const struct sockaddr *addr, socklen_t addrlen)
 {
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
