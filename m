Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D30648A15D
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:41:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9438D3C1DA1
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:41:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id E447D3C1D07
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F12D1600A6A
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:51 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F33CBADFE
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:48 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:41 +0200
Message-Id: <20190812143941.8119-12-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 11/11] syscalls/sendmmsg01: Make use of guarded
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

We also send one more byte in the second buffer in an attempt to trick
the kernel to write after the second iovec used for receive. Note that
because this is UDP connection this byte is then discarded in kernel and
we don't have to anything even when the test is running in a loop with
the -i parameter.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 .../kernel/syscalls/sendmmsg/sendmmsg01.c     | 68 +++++++++----------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
index 7411467ee..37084102e 100644
--- a/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
+++ b/testcases/kernel/syscalls/sendmmsg/sendmmsg01.c
@@ -22,35 +22,27 @@
 
 static int send_sockfd;
 static int receive_sockfd;
-static struct mmsghdr msg[VLEN];
-static struct iovec msg1[2], msg2;
+static struct mmsghdr *snd_msg, *rcv_msg;
+static struct iovec *snd1, *snd2, *rcv1, *rcv2;
 
 static void run(void)
 {
-	struct mmsghdr msgs_in[VLEN];
-	struct iovec iovecs[VLEN];
-	char bufs[VLEN][BUFSIZE+1];
 	struct timespec timeout;
-	int i, retval;
+	int retval;
 
-	retval = do_sendmmsg(send_sockfd, msg, VLEN, 0);
-	if (retval < 0 || msg[0].msg_len != 6 || msg[1].msg_len != 5) {
+	retval = do_sendmmsg(send_sockfd, snd_msg, VLEN, 0);
+	if (retval < 0 || snd_msg[0].msg_len != 6 || snd_msg[1].msg_len != 6) {
 		tst_res(TFAIL|TTERRNO, "sendmmsg failed");
 		return;
 	}
 
-	memset(msgs_in, 0, sizeof(msgs_in));
-	for (i = 0; i < VLEN; i++) {
-		iovecs[i].iov_base = bufs[i];
-		iovecs[i].iov_len = BUFSIZE;
-		msgs_in[i].msg_hdr.msg_iov = &iovecs[i];
-		msgs_in[i].msg_hdr.msg_iovlen = 1;
-	}
+	memset(rcv1->iov_base, 0, rcv1->iov_len);
+	memset(rcv2->iov_base, 0, rcv2->iov_len);
 
 	timeout.tv_sec = 1;
 	timeout.tv_nsec = 0;
 
-	retval = do_recvmmsg(receive_sockfd, msgs_in, VLEN, 0, &timeout);
+	retval = do_recvmmsg(receive_sockfd, rcv_msg, VLEN, 0, &timeout);
 
 	if (retval == -1) {
 		tst_res(TFAIL | TTERRNO, "recvmmsg failed");
@@ -62,14 +54,12 @@ static void run(void)
 		return;
 	}
 
-	bufs[0][msgs_in[0].msg_len] = 0;
-	if (strcmp(bufs[0], "onetwo"))
+	if (memcmp(rcv1->iov_base, "onetwo", 6))
 		tst_res(TFAIL, "Error in first received message");
 	else
 		tst_res(TPASS, "First message received successfully");
 
-	bufs[1][msgs_in[1].msg_len] = 0;
-	if (strcmp(bufs[1], "three"))
+	if (memcmp(rcv2->iov_base, "three", 5))
 		tst_res(TFAIL, "Error in second received message");
 	else
 		tst_res(TPASS, "Second message received successfully");
@@ -88,24 +78,23 @@ static void setup(void)
 	addr.sin_port = port;
 
 	SAFE_BIND(receive_sockfd, (struct sockaddr *)&addr, sizeof(addr));
-	SAFE_CONNECT(send_sockfd, (struct sockaddr *) &addr, sizeof(addr));
-
-	memset(msg1, 0, sizeof(msg1));
-	msg1[0].iov_base = "one";
-	msg1[0].iov_len = 3;
-	msg1[1].iov_base = "two";
-	msg1[1].iov_len = 3;
+	SAFE_CONNECT(send_sockfd, (struct sockaddr *)&addr, sizeof(addr));
 
-	memset(&msg2, 0, sizeof(msg2));
-	msg2.iov_base = "three";
-	msg2.iov_len = 5;
+	memcpy(snd1[0].iov_base, "one", snd1[0].iov_len);
+	memcpy(snd1[1].iov_base, "two", snd1[1].iov_len);
+	memcpy(snd2->iov_base, "three3", snd2->iov_len);
 
-	memset(msg, 0, sizeof(msg));
-	msg[0].msg_hdr.msg_iov = msg1;
-	msg[0].msg_hdr.msg_iovlen = 2;
+	memset(snd_msg, 0, VLEN * sizeof(*snd_msg));
+	snd_msg[0].msg_hdr.msg_iov = snd1;
+	snd_msg[0].msg_hdr.msg_iovlen = 2;
+	snd_msg[1].msg_hdr.msg_iov = snd2;
+	snd_msg[1].msg_hdr.msg_iovlen = 1;
 
-	msg[1].msg_hdr.msg_iov = &msg2;
-	msg[1].msg_hdr.msg_iovlen = 1;
+	memset(rcv_msg, 0, VLEN * sizeof(*rcv_msg));
+	rcv_msg[0].msg_hdr.msg_iov = rcv1;
+	rcv_msg[0].msg_hdr.msg_iovlen = 1;
+	rcv_msg[1].msg_hdr.msg_iov = rcv2;
+	rcv_msg[1].msg_hdr.msg_iovlen = 1;
 
 	test_info();
 }
@@ -123,4 +112,13 @@ static struct tst_test test = {
 	.setup = setup,
 	.cleanup = cleanup,
 	.test_variants = TEST_VARIANTS,
+	.bufs = (struct tst_buffers []) {
+		{&snd1, .iov_sizes = (int[]){3, 3, -1}},
+		{&snd2, .iov_sizes = (int[]){6, -1}},
+		{&rcv1, .iov_sizes = (int[]){6, -1}},
+		{&rcv2, .iov_sizes = (int[]){5, -1}},
+		{&snd_msg, .size = VLEN * sizeof(*snd_msg)},
+		{&rcv_msg, .size = VLEN * sizeof(*rcv_msg)},
+		{},
+	}
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
