Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2882D2A69E5
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 17:35:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A98A73C5460
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 17:35:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0B6333C239E
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 17:35:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 84EA7600052
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 17:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1604507748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tvpLUQm4CKGLWsLBGyb8Ofcre0jfHKOYAclVbH7PPI4=;
 b=NdkcKTbFMDMKDt7IXc2x0n0t9HFzjR5RW/buRL7WULlmGO4/ROX3gfA6ah2XJPfVPx0ceS
 00CU5YbaPCK76JN/McnEiwfceiHOSOJ1B11E9+h5rgRquyMjwoH1XwDa/5YkuZGjRv1e0p
 tvoas8ITe8i/eKzReR/a9+sAn2h1+nk=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E157FAC0C;
 Wed,  4 Nov 2020 16:35:47 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  4 Nov 2020 16:35:28 +0000
Message-Id: <20201104163528.13833-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <875z6m5rib.fsf@suse.de>
References: <875z6m5rib.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] pty04: Limit the number of packets sent to avoid
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

V2: Use two way communication to limit the writes.

 testcases/kernel/pty/pty04.c | 114 +++++++++++++++++++++++++++--------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 4adf2cbb7..3f3996829 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -133,21 +133,48 @@ static int open_pty(const struct ldisc_info *ldisc)
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
 }
 
-static void write_pty(const struct ldisc_info *ldisc)
+#define RETRY_ASYNC(fn) ({				      \
+	ssize_t done = 0;				      \
+	TST_RETRY_FUNC(try_async_##fn(ptmx, data, len, &done),\
+		       TST_RETVAL_NOTNULL);		      \
+})
+
+static void do_pty(const struct ldisc_info *ldisc)
 {
 	char *data;
-	ssize_t written, ret;
+	ssize_t ret;
 	size_t len = 0;
 
 	switch (ldisc->n) {
@@ -171,17 +198,12 @@ static void write_pty(const struct ldisc_info *ldisc)
 		break;
 	}
 
-
-	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
-			     TST_RETVAL_NOTNULL);
+	ret = RETRY_ASYNC(write);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 1st write to PTY");
 	tst_res(TPASS, "Wrote PTY %s %d (1)", ldisc->name, ptmx);
 
-	written = 0;
-	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
-			     TST_RETVAL_NOTNULL);
+	ret = RETRY_ASYNC(write);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 2nd write to PTY");
 
@@ -190,14 +212,23 @@ static void write_pty(const struct ldisc_info *ldisc)
 
 	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
 
-	while (try_write(ptmx, data, len, NULL) >= 0)
+	ret = RETRY_ASYNC(read);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "Failed read of PTY");
+
+	tst_res(TPASS, "Read PTY %s %d", ldisc->name, ptmx);
+	TST_CHECKPOINT_WAKE(0);
+
+	while (RETRY_ASYNC(read) > -1 && RETRY_ASYNC(write) > -1)
 		;
 
-	tst_res(TPASS, "Writing to PTY interrupted by hangup");
+	tst_res(TPASS, "Transmission on PTY interrupted by hangup");
 
 	tst_free_all();
 }
 
+#undef RETRY_ASYNC
+
 static void open_netdev(const struct ldisc_info *ldisc)
 {
 	struct ifreq ifreq = { 0 };
@@ -288,7 +319,7 @@ static void check_data(const struct ldisc_info *ldisc,
 		tst_res(TINFO, "Will continue test without data checking");
 }
 
-static void try_read(int fd, char *data, ssize_t size)
+static ssize_t try_sync_read(int fd, char *data, ssize_t size)
 {
 	ssize_t ret, n = 0;
 	int retry = mtu;
@@ -297,13 +328,31 @@ static void try_read(int fd, char *data, ssize_t size)
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
 }
 
 static void read_netdev(const struct ldisc_info *ldisc)
@@ -323,19 +372,34 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
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
@@ -356,7 +420,7 @@ static void do_test(unsigned int n)
 	}
 
 	if (!SAFE_FORK()) {
-		write_pty(ldisc);
+		do_pty(ldisc);
 		return;
 	}
 
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
