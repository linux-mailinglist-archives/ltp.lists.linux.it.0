Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63D8A157
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B296F3C1D20
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E4BE03C1D07
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:46 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9C1996000F4
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DD75ADFE
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:46 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:36 +0200
Message-Id: <20190812143941.8119-7-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v2 06/11] syscalls/accept4_01: Make use of guarded
 buffers.
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
 .../kernel/syscalls/accept4/accept4_01.c      | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
index dd289cf6d..29e18f27d 100644
--- a/testcases/kernel/syscalls/accept4/accept4_01.c
+++ b/testcases/kernel/syscalls/accept4/accept4_01.c
@@ -35,7 +35,7 @@
 #define USE_SOCKETCALL 1
 #endif
 
-static struct sockaddr_in conn_addr;
+static struct sockaddr_in *conn_addr, *accept_addr;
 static int listening_fd;
 
 #if !(__GLIBC_PREREQ(2, 10))
@@ -80,10 +80,10 @@ static int create_listening_socket(void)
 
 static void setup(void)
 {
-	memset(&conn_addr, 0, sizeof(struct sockaddr_in));
-	conn_addr.sin_family = AF_INET;
-	conn_addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
-	conn_addr.sin_port = htons(PORT_NUM);
+	memset(conn_addr, 0, sizeof(*conn_addr));
+	conn_addr->sin_family = AF_INET;
+	conn_addr->sin_addr.s_addr = htonl(INADDR_LOOPBACK);
+	conn_addr->sin_port = htons(PORT_NUM);
 
 	listening_fd = create_listening_socket();
 }
@@ -108,18 +108,17 @@ static void verify_accept4(unsigned int nr)
 	struct test_case *tcase = &tcases[nr];
 	int connfd, acceptfd;
 	int fdf, flf, fdf_pass, flf_pass, fd_cloexec, fd_nonblock;
-	struct sockaddr_in claddr;
 	socklen_t addrlen;
 
 	connfd = SAFE_SOCKET(AF_INET, SOCK_STREAM, 0);
-	SAFE_CONNECT(connfd, (struct sockaddr *)&conn_addr, sizeof(conn_addr));
-	addrlen = sizeof(claddr);
+	SAFE_CONNECT(connfd, (struct sockaddr *)conn_addr, sizeof(*conn_addr));
+	addrlen = sizeof(*accept_addr);
 
 #if !(__GLIBC_PREREQ(2, 10))
-	TEST(accept4_01(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+	TEST(accept4_01(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
 				tcase->cloexec | tcase->nonblock));
 #else
-	TEST(accept4(listening_fd, (struct sockaddr *)&claddr, &addrlen,
+	TEST(accept4(listening_fd, (struct sockaddr *)accept_addr, &addrlen,
 				tcase->cloexec | tcase->nonblock));
 #endif
 	if (TST_RET == -1) {
@@ -163,4 +162,9 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test = verify_accept4,
+	.bufs = (struct tst_buffers []) {
+		{&conn_addr, .size = sizeof(*conn_addr)},
+		{&accept_addr, .size = sizeof(*accept_addr)},
+		{},
+	}
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
