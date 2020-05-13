Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F04681D12E8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:39:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E09F3C5503
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 14:39:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A05603C25D8
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:39:53 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8ECF41A00F12
 for <ltp@lists.linux.it>; Wed, 13 May 2020 14:39:52 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 68D5FAB7D;
 Wed, 13 May 2020 12:39:54 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 13 May 2020 13:39:44 +0100
Message-Id: <20200513123944.31411-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] pty04: Retry reads when short and wait longer
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

Even though reads are blocking and packets are flipped into the netdevice
buffer whole, it seems read may return before a full packet is read into user
land. Retrying read should prevent timeouts and read failures on some
machines.

Also this increases the timeout to wait for the checkpoint to a large value
because sometimes the kernel stalls, possibly while trying to (re)claim
memory, and this causes the checkpoint wait to timeout and everything to be
cleaned up. If the kernel is left in a stalled state, this can result in a
stack trace which is more useful.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reported-by: Jan Stancek <jstancek@redhat.com>
Cc: Petr Vorel <pvorel@suse.cz>
---

V3:
* Increase the timeout on the wait for the reason described above
* Add some more info to read and write results

 testcases/kernel/pty/pty04.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 4e16707e3..68a84ea87 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -177,7 +177,7 @@ static void write_pty(const struct ldisc_info *ldisc)
 			     TST_RETVAL_NOTNULL);
 	if (ret < 0)
 		tst_brk(TBROK | TERRNO, "Failed 1st write to PTY");
-	tst_res(TPASS, "Wrote PTY 1");
+	tst_res(TPASS, "Wrote PTY %s %d (1)", ldisc->name, ptmx);
 
 	written = 0;
 	ret = TST_RETRY_FUNC(try_write(ptmx, data, len, &written),
@@ -188,7 +188,7 @@ static void write_pty(const struct ldisc_info *ldisc)
 	if (tcflush(ptmx, TCIFLUSH))
 		tst_brk(TBROK | TERRNO, "tcflush(ptmx, TCIFLUSH)");
 
-	tst_res(TPASS, "Wrote PTY 2");
+	tst_res(TPASS, "Wrote PTY %s %d (2)", ldisc->name, ptmx);
 
 	while (try_write(ptmx, data, len, NULL) >= 0)
 		;
@@ -288,6 +288,24 @@ static void check_data(const struct ldisc_info *ldisc,
 		tst_res(TINFO, "Will continue test without data checking");
 }
 
+static void try_read(int fd, char *data, ssize_t size)
+{
+	ssize_t ret, n = 0;
+	int retry = mtu;
+
+	while (retry--) {
+		ret = read(fd, data, size - n);
+
+		if (ret < 0)
+			break;
+
+		if ((n += ret) >= size)
+			return;
+	}
+
+	tst_brk(TBROK | TERRNO, "Read %zd of %zd bytes", n, size);
+}
+
 static void read_netdev(const struct ldisc_info *ldisc)
 {
 	int rlen, plen = 0;
@@ -305,13 +323,13 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TINFO, "Reading from socket %d", sk);
 
-	SAFE_READ(1, sk, data, plen);
+	try_read(sk, data, plen);
 	check_data(ldisc, data, plen);
-	tst_res(TPASS, "Read netdev 1");
+	tst_res(TPASS, "Read netdev %s %d (1)", ldisc->name, sk);
 
-	SAFE_READ(1, sk, data, plen);
+	try_read(sk, data, plen);
 	check_data(ldisc, data, plen);
-	tst_res(TPASS, "Read netdev 2");
+	tst_res(TPASS, "Read netdev %s %d (2)", ldisc->name, sk);
 
 	TST_CHECKPOINT_WAKE(0);
 	while ((rlen = read(sk, data, plen)) > 0)
@@ -319,6 +337,7 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
 
+	close(sk);
 	tst_free_all();
 }
 
@@ -342,7 +361,7 @@ static void do_test(unsigned int n)
 	}
 
 	if (!SAFE_FORK()) {
-		TST_CHECKPOINT_WAIT(0);
+		TST_CHECKPOINT_WAIT2(0, 100000);
 		SAFE_IOCTL(pts, TIOCVHANGUP);
 		tst_res(TINFO, "Sent hangup ioctl to PTS");
 		SAFE_IOCTL(ptmx, TIOCVHANGUP);
@@ -357,6 +376,7 @@ static void cleanup(void)
 {
 	ioctl(pts, TIOCVHANGUP);
 	ioctl(ptmx, TIOCVHANGUP);
+	close(sk);
 
 	tst_reap_children();
 }
-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
