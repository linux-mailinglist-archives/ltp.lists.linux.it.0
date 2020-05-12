Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BE91CF727
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:28:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 755793C24B7
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 16:28:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1F7F33C2410
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:28:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C26B2200C63
 for <ltp@lists.linux.it>; Tue, 12 May 2020 16:28:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1913BB029;
 Tue, 12 May 2020 14:28:33 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Tue, 12 May 2020 15:28:24 +0100
Message-Id: <20200512142824.13063-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200512142824.13063-1-rpalethorpe@suse.com>
References: <20200512142824.13063-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] pty04: Retry reads when short
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

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Reported-by: Jan Stancek <jstancek@redhat.com>
Cc: Petr Vorel <pvorel@suse.cz>
---

NOTE: When running this test repeatedly and in parallel; strange things still
happen, see:
https://github.com/linux-test-project/ltp/issues/674#issuecomment-625181783

However this hopefully will fix the timeout issues and read failures reported
by some testers.

 testcases/kernel/pty/pty04.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index bfda08b2b..9b2911421 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -288,9 +288,20 @@ static void check_data(const struct ldisc_info *ldisc,
 		tst_res(TINFO, "Will continue test without data checking");
 }
 
+static ssize_t try_read(int fd, char *data, ssize_t size, ssize_t *n)
+{
+	ssize_t ret = read(fd, data, size);
+
+	if (ret < 0)
+		return -(errno != EAGAIN);
+
+	return (*n += ret) >= size;
+}
+
 static void read_netdev(const struct ldisc_info *ldisc)
 {
-	int rlen, plen = 0;
+	int ret, rlen, plen = 0;
+	ssize_t n;
 	char *data;
 
 	switch (ldisc->n) {
@@ -305,20 +316,27 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TINFO, "Reading from socket %d", sk);
 
-	SAFE_READ(1, sk, data, plen);
+	n = 0;
+	ret = TST_RETRY_FUNC(try_read(sk, data, plen, &n), TST_RETVAL_NOTNULL);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "Read %zd of %d bytes", n, plen);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev 1");
 
-	SAFE_READ(1, sk, data, plen);
+	n = 0;
+	ret = TST_RETRY_FUNC(try_read(sk, data, plen, &n), TST_RETVAL_NOTNULL);
+	if (ret < 0)
+		tst_brk(TBROK | TERRNO, "Read %zd of %d bytes", n, plen);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev 2");
 
 	TST_CHECKPOINT_WAKE(0);
-	while((rlen = read(sk, data, plen)) > 0)
+	while ((rlen = read(sk, data, plen)) > 0)
 		check_data(ldisc, data, rlen);
 
 	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
 
+	close(sk);
 	tst_free_all();
 }
 
@@ -357,6 +375,7 @@ static void cleanup(void)
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
