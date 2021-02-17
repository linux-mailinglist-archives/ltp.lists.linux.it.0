Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 287BD31D908
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Feb 2021 13:05:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69E693C669E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Feb 2021 13:05:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 50DE53C1C4E
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 13:05:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 19BD91000406
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 13:05:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5A2FFB958
 for <ltp@lists.linux.it>; Wed, 17 Feb 2021 12:05:00 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 17 Feb 2021 13:04:59 +0100
Message-Id: <20210217120459.17500-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210217120459.17500-1-mdoucha@suse.cz>
References: <20210217120459.17500-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/io_uring02: Use IOSQE_ASYNC when
 available
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
 .../kernel/syscalls/io_uring/io_uring02.c     | 70 ++++++++++++++++---
 1 file changed, 62 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/io_uring/io_uring02.c b/testcases/kernel/syscalls/io_uring/io_uring02.c
index 08f4a1714..cd90fbdc3 100644
--- a/testcases/kernel/syscalls/io_uring/io_uring02.c
+++ b/testcases/kernel/syscalls/io_uring/io_uring02.c
@@ -79,11 +79,11 @@ static void setup(void)
 	SAFE_CHROOT(CHROOT_DIR);
 }
 
-static void run(void)
+static void drain_fallback(void)
 {
 	uint32_t i, count, tail;
 	int beef_found = 0;
-	struct io_uring_sqe *sqe_ptr;
+	struct io_uring_sqe *sqe_ptr = uring.sqr_entries;
 	const struct io_uring_cqe *cqe_ptr;
 
 	SAFE_SOCKETPAIR(AF_UNIX, SOCK_DGRAM, 0, sockpair);
@@ -91,9 +91,6 @@ static void run(void)
 		32+sizeof(buf));
 	SAFE_FCNTL(sockpair[0], F_SETFL, O_NONBLOCK);
 
-	SAFE_IO_URING_INIT(512, &params, &uring);
-	sqe_ptr = uring.sqr_entries;
-
 	/* Add spam requests to force async processing of the real test */
 	for (i = 0, tail = *uring.sqr_tail; i < 255; i++, tail++, sqe_ptr++) {
 		memset(sqe_ptr, 0, sizeof(*sqe_ptr));
@@ -150,7 +147,7 @@ static void run(void)
 			tst_res(TFAIL | TTERRNO,
 				"Write outside chroot failed unexpectedly");
 		} else {
-			tst_res(TPASS,
+			tst_res(TPASS | TTERRNO,
 				"Write outside chroot failed as expected");
 		}
 	}
@@ -163,12 +160,69 @@ static void run(void)
 	if (count)
 		tst_res(TFAIL, "Wrong number of entries in completion queue");
 
-	/* iteration cleanup */
-	SAFE_IO_URING_CLOSE(&uring);
 	SAFE_CLOSE(sockpair[0]);
 	SAFE_CLOSE(sockpair[1]);
 }
 
+static void check_result(void)
+{
+	const struct io_uring_cqe *cqe_ptr;
+
+	cqe_ptr = uring.cqr_entries + (*uring.cqr_head & *uring.cqr_mask);
+	++*uring.cqr_head;
+	TST_ERR = -cqe_ptr->res;
+
+	if (cqe_ptr->user_data != BEEF_MARK) {
+		tst_res(TFAIL, "Unexpected entry in completion queue");
+		return;
+	}
+
+	if (cqe_ptr->res == -EINVAL) {
+		tst_res(TINFO, "IOSQE_ASYNC is not supported, using fallback");
+		drain_fallback();
+		return;
+	}
+
+	tst_res(TINFO, "IOSQE_ASYNC is supported");
+
+	if (cqe_ptr->res >= 0) {
+		tst_res(TFAIL, "Write outside chroot succeeded.");
+		return;
+	}
+
+	if (cqe_ptr->res != -ENOENT) {
+		tst_res(TFAIL | TTERRNO,
+			"Write outside chroot failed unexpectedly");
+		return;
+	}
+
+	tst_res(TPASS | TTERRNO, "Write outside chroot failed as expected");
+}
+
+static void run(void)
+{
+	uint32_t tail;
+	struct io_uring_sqe *sqe_ptr;
+
+	SAFE_IO_URING_INIT(512, &params, &uring);
+	sqe_ptr = uring.sqr_entries;
+	tail = *uring.sqr_tail;
+
+	memset(sqe_ptr, 0, sizeof(*sqe_ptr));
+	sqe_ptr->opcode = IORING_OP_SENDMSG;
+	sqe_ptr->flags = IOSQE_ASYNC;
+	sqe_ptr->fd = sendsock;
+	sqe_ptr->addr = (__u64)&beef_header;
+	sqe_ptr->user_data = BEEF_MARK;
+	uring.sqr_array[tail & *uring.sqr_mask] = 0;
+	tail++;
+
+	__atomic_store(uring.sqr_tail, &tail, __ATOMIC_RELEASE);
+	SAFE_IO_URING_ENTER(1, uring.fd, 1, 1, IORING_ENTER_GETEVENTS, NULL);
+	check_result();
+	SAFE_IO_URING_CLOSE(&uring);
+}
+
 static void cleanup(void)
 {
 	if (uring.fd >= 0)
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
