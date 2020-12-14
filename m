Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F312D957B
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 10:49:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A5B13C2BB0
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Dec 2020 10:49:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1382E3C24CF
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 10:49:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6E60B200ADF
 for <ltp@lists.linux.it>; Mon, 14 Dec 2020 10:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1607939395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N3Byg4L/6L53mvG+ciEzRXZ6NBOcrbf2ZTH4kwnEr2M=;
 b=pYPHGumJRPH+19SKw5ZXIk63qA3G5GBGhMQtiR1UW3XLd9lhfVsiTtvsvPhAJq6ePjKgh5
 3W1CALsVB10fg0Cf8OxU/JOwD5JvafewuFjI2EUuJOXVLQJx1Uxk7IV9k42wXy1YZ63vkL
 hai04DZlusq7J7ff2C7/tpGC/DaHN0o=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA42AACC6;
 Mon, 14 Dec 2020 09:49:55 +0000 (UTC)
To: ltp@lists.linux.it
Date: Mon, 14 Dec 2020 09:49:51 +0000
Message-Id: <20201214094951.24018-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <X9ONfxzTVLT4Rgfd@yuki.lan>
References: <X9ONfxzTVLT4Rgfd@yuki.lan>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v3] pty04: Limit the number of packets sent to avoid
 timeout
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

At the end of the test we continuously write data to the PTY while
closing the PTY to check for races in the kernel. However if the
process which closes the PTY is delayed this can result in a very
large number of packets being created from the data written to the
PTY. It is easy to fill the PTY buffer with a large amount of data
which the kernel is slow to then parse into packets. This can result
in spurious softlockup warnings and test timeouts.

Theoretically the performance might be a concern for a fast enough
serial line, but this is not supposed to be a performance test.

So this commit limits the amount of data transmitted on the PTY by
waiting for the netdev to echo the data back. This has the added
benefit of testing data transmission in the opposite direction.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---

V3:
* Return after tst_brk
* Replace retry macro with inline functions

 testcases/kernel/pty/pty04.c | 135 ++++++++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 26 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 4adf2cbb7..e8f21f1d4 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -133,21 +133,58 @@ static int open_pty(const struct ldisc_info *ldisc)
 	return set_ldisc(pts, ldisc);
 }
 
-static ssize_t try_write(int fd, const char *data,
-			 ssize_t size, ssize_t *written)
+static ssize_t try_async_write(int fd, const char *data, ssize_t size,
+			       ssize_t *done)
 {
-	ssize_t ret = write(fd, data, size);
+	ssize_t off = done ? *done : 0;
+	ssize_t ret = write(fd, data + off, size - off);
 
 	if (ret < 0)
 		return -(errno != EAGAIN);
 
-	return !written || (*written += ret) >= size;
+	if (!done)
+		return 1;
+
+	*done += ret;
+	return *done >= size;
+}
+
+static ssize_t try_async_read(int fd, char *data, ssize_t size,
+			      ssize_t *done)
+{
+	ssize_t off = done ? *done : 0;
+	ssize_t ret = read(fd, data + off, size - off);
+
+	if (ret < 0)
+		return -(errno != EAGAIN);
+
+	if (!done)
+		return 1;
+
+	*done += ret;
+	return *done >= size;
+}
+
+static ssize_t retry_async_write(int fd, const char *data, ssize_t size)
+{
+	ssize_t done = 0;
+
+	return TST_RETRY_FUNC(try_async_write(fd, data, size, &done),
+			      TST_RETVAL_NOTNULL);
 }
 
-static void write_pty(const struct ldisc_info *ldisc)
+static ssize_t retry_async_read(int fd, char *data, ssize_t size)
+{
+	ssize_t done = 0;
+
+	return TST_RETRY_FUNC(try_async_read(fd, data, size, &done),
+			      TST_RETVAL_NOTNULL);
+}
+
+static void do_pty(const struct ldisc_info *ldisc)
 {
 	char *data;
-	ssize_t written, ret;
+	ssize_t ret;
 	size_t len = 0;
 
 	switch (ldisc->n) {
@@ -171,17 +208,12 @@ static void write_pty(const struct ldisc_info *ldisc)
 		break;
 	}
 
-
-	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
-			     TST_RETVAL_NOTNULL);
+	ret = retry_async_write(ptmx, data, len);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 1st write to PTY");
 	tst_res(TPASS, "Wrote PTY %s %d (1)", ldisc->name, ptmx);
 
-	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
-			     TST_RETVAL_NOTNULL);
+	ret = retry_async_write(ptmx, data, len);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 2nd write to PTY");
 
@@ -190,14 +222,28 @@ static void write_pty(const struct ldisc_info *ldisc)
 
 	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
 
-	while (try_write(ptmx, data, len, NULL) >= 0)
-		;
+	ret = retry_async_read(ptmx, data, len);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "Failed read of PTY");
+
+	tst_res(TPASS, "Read PTY %s %d", ldisc->name, ptmx);
+	TST_CHECKPOINT_WAKE(0);
+
+	while (1) {
+		if (retry_async_read(ptmx, data, len) < 0)
+			break;
+
+		if (retry_async_write(ptmx, data, len) < 0)
+			break;
+	}
 
-	tst_res(TPASS, "Writing to PTY interrupted by hangup");
+	tst_res(TPASS, "Transmission on PTY interrupted by hangup");
 
 	tst_free_all();
 }
 
+#undef RETRY_ASYNC
+
 static void open_netdev(const struct ldisc_info *ldisc)
 {
 	struct ifreq ifreq = { 0 };
@@ -288,7 +334,7 @@ static void check_data(const struct ldisc_info *ldisc,
 		tst_res(TINFO, "Will continue test without data checking");
 }
 
-static void try_read(int fd, char *data, ssize_t size)
+static ssize_t try_sync_read(int fd, char *data, ssize_t size)
 {
 	ssize_t ret, n = 0;
 	int retry = mtu;
@@ -297,13 +343,35 @@ static void try_read(int fd, char *data, ssize_t size)
 		ret = read(fd, data + n, size - n);
 
 		if (ret < 0)
-			break;
+			return ret;
 
 		if ((n += ret) >= size)
-			return;
+			return ret;
+	}
+
+	tst_brk(TBROK | TERRNO, "Only read %zd of %zd bytes", n, size);
+
+	return n;
+}
+
+static ssize_t try_sync_write(int fd, const char *data, ssize_t size)
+{
+	ssize_t ret, n = 0;
+	int retry = mtu;
+
+	while (retry--) {
+		ret = write(fd, data + n, size - n);
+
+		if (ret < 0)
+			return ret;
+
+		if ((n += ret) >= size)
+			return ret;
 	}
 
-	tst_brk(TBROK | TERRNO, "Read %zd of %zd bytes", n, size);
+	tst_brk(TBROK | TERRNO, "Only wrote %zd of %zd bytes", n, size);
+
+	return n;
 }
 
 static void read_netdev(const struct ldisc_info *ldisc)
@@ -323,19 +391,34 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TINFO, "Reading from socket %d", sk);
 
-	try_read(sk, data, plen);
+	TEST(try_sync_read(sk, data, plen));
+	if (TST_RET < 0)
+		tst_brk(TBROK | TTERRNO, "Read netdev %s %d (1)", ldisc->name, sk);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev %s %d (1)", ldisc->name, sk);
 
-	try_read(sk, data, plen);
+	TEST(try_sync_read(sk, data, plen));
+	if (TST_RET < 0)
+		tst_brk(TBROK | TTERRNO, "Read netdev %s %d (2)", ldisc->name, sk);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
 
-	TST_CHECKPOINT_WAKE(0);
-	while ((rlen = read(sk, data, plen)) > 0)
+	TEST(try_sync_write(sk, data, plen));
+	if (TST_RET < 0)
+		tst_brk(TBROK | TTERRNO, "Write netdev %s %d", ldisc->name, sk);
+
+	tst_res(TPASS, "Write netdev %s %d", ldisc->name, sk);
+
+	while (1) {
+		if (try_sync_write(sk, data, plen) < 0)
+			break;
+
+		if ((rlen = try_sync_read(sk, data, plen)) < 0)
+			break;
 		check_data(ldisc, data, rlen);
+	}
 
-	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
+	tst_res(TPASS, "Data transmission on netdev interrupted by hangup");
 
 	close(sk);
 	tst_free_all();
@@ -356,7 +439,7 @@ static void do_test(unsigned int n)
 	}
 
 	if (!SAFE_FORK()) {
-		write_pty(ldisc);
+		do_pty(ldisc);
 		return;
 	}
 
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
