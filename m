Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCE1D0B70
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 11:05:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2E5153C2599
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 11:05:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 1E6E23C24D8
 for <ltp@lists.linux.it>; Wed, 13 May 2020 11:05:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A18AA20096F
 for <ltp@lists.linux.it>; Wed, 13 May 2020 11:05:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9007AAE35;
 Wed, 13 May 2020 09:05:02 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed, 13 May 2020 10:04:53 +0100
Message-Id: <20200513090453.6071-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] pty04: Retry reads when short
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

V2:
* Remove while style fix
* Use plain while loop instead of exp backoff

testcases/kernel/pty/pty04.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index 4e16707e3..8f17aba55 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
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
@@ -305,11 +323,11 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TINFO, "Reading from socket %d", sk);
 
-	SAFE_READ(1, sk, data, plen);
+	try_read(sk, data, plen);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev 1");
 
-	SAFE_READ(1, sk, data, plen);
+	try_read(sk, data, plen);
 	check_data(ldisc, data, plen);
 	tst_res(TPASS, "Read netdev 2");
 
@@ -319,6 +337,7 @@ static void read_netdev(const struct ldisc_info *ldisc)
 
 	tst_res(TPASS, "Reading data from netdev interrupted by hangup");
 
+	close(sk);
 	tst_free_all();
 }
 
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
