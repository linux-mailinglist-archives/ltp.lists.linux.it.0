Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B72AC4C0
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 20:16:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49E7F3C608D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 20:16:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2A27B3C2FB4
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 20:16:21 +0100 (CET)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A0AC76002A4
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 20:16:20 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id AC73EE0002
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 19:16:19 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Mon,  9 Nov 2020 20:16:18 +0100
Message-Id: <20201109191618.4442-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v3] tcp_cmds/ping/ping02: Make it compatible with
 Busybox
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The ping from busybox does not have -f parameter, use -i parameter instead.
BusyBox does not accept pattern longer than 2 bytes.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Changes since v1:
 - Use "-i 0.01 -p aa" parameter instead of "-f"

Changes since v2:
 - Use "-i 0.01 -p aa" only in the case of "-f" parameter is not valid

 testcases/network/tcp_cmds/ping/ping02.sh | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/testcases/network/tcp_cmds/ping/ping02.sh b/testcases/network/tcp_cmds/ping/ping02.sh
index e0a63c5f6..80346c552 100755
--- a/testcases/network/tcp_cmds/ping/ping02.sh
+++ b/testcases/network/tcp_cmds/ping/ping02.sh
@@ -20,15 +20,16 @@ do_setup()
 
 do_test()
 {
-	local pat="000102030405060708090a0b0c0d0e0f"
-
-	tst_res TINFO "flood $PING: ICMP packets filled with pattern '$pat'"
-
+	local ping_opts="-f -p 000102030405060708090a0b0c0d0e0f"
 	local ipaddr=$(tst_ipaddr rhost)
 	local s
 
+	$PING -c 1 -f $ipaddr >/dev/null 2>&1 || ping_opts="-i 0.01 -p aa"
+
+	tst_res TINFO "flood $PING: ICMP packets with options '$ping_opts'"
+
 	for s in $PACKETSIZES; do
-		EXPECT_PASS $PING -c $COUNT -f -s $s $ipaddr -p "$pat" \>/dev/null
+		EXPECT_PASS $PING -c $COUNT -s $s $ipaddr $ping_opts \>/dev/null
 	done
 }
 
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
