Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5344E1D4B27
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 12:39:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 597E93C53AC
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 12:39:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 105993C21E9
 for <ltp@lists.linux.it>; Fri, 15 May 2020 12:39:41 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 47E59600042
 for <ltp@lists.linux.it>; Fri, 15 May 2020 12:39:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65D5DAD80;
 Fri, 15 May 2020 10:39:42 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Fri, 15 May 2020 11:39:10 +0100
Message-Id: <20200515103910.8703-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] pty04: Avoid receiving packets from all interfaces
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

Raw sockets receive all packets from all interfaces as soon as they are
created. They don't need to be bound to one or more interfaces like I thought.

This creates the socket with a NULL packet type which appears to be unused in
the Linux kernel and receives no packets. The protocol is then changed to
ETH_P_ALL when binding to the netdevice we are interested in.

I assume it is impossible for a packet to have zero for its packet type. Most
likely using ETH_P_LOOP would have been OK too, but I suppose that is really
used by some hardware.

This also fixes various other problems that have been observed with this
test. Such as memory allocation failures.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Jan Stancek <jstancek@redhat.com>
---

Another day, another patch for pty04.

 testcases/kernel/pty/pty04.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/pty/pty04.c b/testcases/kernel/pty/pty04.c
index d574d8b2c..4adf2cbb7 100644
--- a/testcases/kernel/pty/pty04.c
+++ b/testcases/kernel/pty/pty04.c
@@ -206,7 +206,7 @@ static void open_netdev(const struct ldisc_info *ldisc)
 	SAFE_IOCTL(pts, SIOCGIFNAME, ifreq.ifr_name);
 	tst_res(TINFO, "Netdev is %s", ifreq.ifr_name);
 
-	sk = SAFE_SOCKET(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+	sk = SAFE_SOCKET(PF_PACKET, SOCK_RAW, 0);
 
 	ifreq.ifr_mtu = ldisc->mtu;
 	if (ioctl(sk, SIOCSIFMTU, &ifreq))
-- 
2.26.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
