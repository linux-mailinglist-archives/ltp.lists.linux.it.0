Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E382D5D48
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:15:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C1F1E3C75D2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Dec 2020 15:15:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 91E1D3C7141
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16626200C86
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 15:14:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A83C7AE2E
 for <ltp@lists.linux.it>; Thu, 10 Dec 2020 14:14:54 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 10 Dec 2020 15:15:43 +0100
Message-Id: <20201210141548.10982-6-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210141548.10982-1-chrubis@suse.cz>
References: <20201210141548.10982-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 05/10] syscalls/bind: Make use of TST_EXP_MACROS
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/bind/bind01.c | 12 +++++-------
 testcases/kernel/syscalls/bind/bind02.c | 11 ++---------
 testcases/kernel/syscalls/bind/bind03.c | 26 ++++---------------------
 testcases/kernel/syscalls/bind/bind04.c |  5 ++---
 testcases/kernel/syscalls/bind/bind05.c |  5 ++---
 5 files changed, 15 insertions(+), 44 deletions(-)

diff --git a/testcases/kernel/syscalls/bind/bind01.c b/testcases/kernel/syscalls/bind/bind01.c
index 2054996ac..758d12863 100644
--- a/testcases/kernel/syscalls/bind/bind01.c
+++ b/testcases/kernel/syscalls/bind/bind01.c
@@ -47,14 +47,12 @@ void verify_bind(unsigned int nr)
 {
 	struct test_case *tcase = &tcases[nr];
 
-	TEST(bind(*tcase->socket_fd, tcase->sockaddr, tcase->salen));
-	if (TST_RET != tcase->retval && TST_ERR != tcase->experrno) {
-		tst_res(TFAIL, "%s ; returned"
-			" %ld (expected %d), errno %d (expected"
-			" %d)", tcase->desc, TST_RET, tcase->retval,
-			TST_ERR, tcase->experrno);
+	if (tcase->experrno) {
+		TST_EXP_FAIL(bind(*tcase->socket_fd, tcase->sockaddr, tcase->salen),
+		             tcase->experrno, "%s", tcase->desc);
 	} else {
-		tst_res(TPASS, "%s successful", tcase->desc);
+		TST_EXP_PASS(bind(*tcase->socket_fd, tcase->sockaddr, tcase->salen),
+		             "%s", tcase->desc);
 	}
 }
 
diff --git a/testcases/kernel/syscalls/bind/bind02.c b/testcases/kernel/syscalls/bind/bind02.c
index 65944cbe3..a997157d6 100644
--- a/testcases/kernel/syscalls/bind/bind02.c
+++ b/testcases/kernel/syscalls/bind/bind02.c
@@ -36,16 +36,9 @@ static void run(void)
 	servaddr.sin_family = AF_INET;
 	servaddr.sin_port = htons(TCP_PRIVILEGED_PORT);
 	servaddr.sin_addr.s_addr = htonl(INADDR_ANY);
-	TEST(bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)));
+	TST_EXP_FAIL(bind(sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr)),
+	             EACCES, "bind()");
 	SAFE_CLOSE(sockfd);
-
-	if (TST_RET != -1) {
-		tst_res(TFAIL, "bind() returned %li, expected -1", TST_RET);
-	} else if (TST_ERR == EACCES) {
-		tst_res(TPASS | TTERRNO, "bind() failed as expected");
-	} else {
-		tst_res(TFAIL | TTERRNO, "Unexpected error");
-	}
 }
 
 static void setup(void)
diff --git a/testcases/kernel/syscalls/bind/bind03.c b/testcases/kernel/syscalls/bind/bind03.c
index dda5ca374..c39e8f197 100644
--- a/testcases/kernel/syscalls/bind/bind03.c
+++ b/testcases/kernel/syscalls/bind/bind03.c
@@ -51,17 +51,8 @@ void run(void)
 	 * Once a STREAM UNIX domain socket has been bound, it can't be
 	 * rebound.
 	 */
-	if (bind(sock1, (struct sockaddr *)&sun2, sizeof(sun2)) == 0) {
-		tst_res(TFAIL, "re-binding of socket succeeded");
-		return;
-	}
-
-	if (errno != EINVAL) {
-		tst_res(TFAIL | TERRNO, "expected EINVAL");
-		return;
-	}
-
-	tst_res(TPASS, "bind() failed with EINVAL as expected");
+	TST_EXP_FAIL(bind(sock1, (struct sockaddr *)&sun2, sizeof(sun2)),
+	             EINVAL, "re-bind() socket");
 
 	sock2 = SAFE_SOCKET(PF_UNIX, SOCK_STREAM, 0);
 
@@ -69,17 +60,8 @@ void run(void)
 	 * Since a socket is already bound to the pathname, it can't be bound
 	 * to a second socket. Expected error is EADDRINUSE.
 	 */
-	if (bind(sock2, (struct sockaddr *)&sun1, sizeof(sun1)) == 0) {
-		tst_res(TFAIL, "bind() succeeded with already bound pathname!");
-		return;
-	}
-
-	if (errno != EADDRINUSE) {
-		tst_res(TFAIL | TERRNO, "expected to fail with EADDRINUSE");
-		return;
-	}
-
-	tst_res(TPASS, "bind() failed with EADDRINUSE as expected");
+	TST_EXP_FAIL(bind(sock2, (struct sockaddr *)&sun1, sizeof(sun1)),
+	             EADDRINUSE, "bind() with bound pathname");
 }
 
 static void cleanup(void)
diff --git a/testcases/kernel/syscalls/bind/bind04.c b/testcases/kernel/syscalls/bind/bind04.c
index 51f19c6cd..49e784ccd 100644
--- a/testcases/kernel/syscalls/bind/bind04.c
+++ b/testcases/kernel/syscalls/bind/bind04.c
@@ -118,10 +118,9 @@ static void test_bind(unsigned int n)
 	listen_sock = SAFE_SOCKET(tc->address->sa_family, tc->type,
 		tc->protocol);
 
-	TEST(bind(listen_sock, tc->address, tc->addrlen));
+	TST_EXP_PASS(bind(listen_sock, tc->address, tc->addrlen), "bind()");
 
-	if (TST_RET) {
-		tst_res(TFAIL | TERRNO, "bind() failed");
+	if (!TST_PASS) {
 		SAFE_CLOSE(listen_sock);
 		return;
 	}
diff --git a/testcases/kernel/syscalls/bind/bind05.c b/testcases/kernel/syscalls/bind/bind05.c
index 16c9c711d..3b384cf1b 100644
--- a/testcases/kernel/syscalls/bind/bind05.c
+++ b/testcases/kernel/syscalls/bind/bind05.c
@@ -131,10 +131,9 @@ static void test_bind(unsigned int n)
 	tst_res(TINFO, "Testing %s", tc->description);
 	sock = SAFE_SOCKET(tc->address->sa_family, tc->type, tc->protocol);
 
-	TEST(bind(sock, tc->address, tc->addrlen));
+	TST_EXP_PASS(bind(sock, tc->address, tc->addrlen), "bind()");
 
-	if (TST_RET) {
-		tst_res(TFAIL | TERRNO, "bind() failed");
+	if (!TST_PASS) {
 		SAFE_CLOSE(sock);
 		return;
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
