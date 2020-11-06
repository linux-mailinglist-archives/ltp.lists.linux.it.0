Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B41D2A9472
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:37:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AB423C3215
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Nov 2020 11:37:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 32CEA3C2FCB
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:37:50 +0100 (CET)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 807EF100036B
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 11:37:50 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BBCA31C0017
 for <ltp@lists.linux.it>; Fri,  6 Nov 2020 10:37:49 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Fri,  6 Nov 2020 11:37:48 +0100
Message-Id: <20201106103748.20241-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tcp_cmds/ping: TCONF on unknown -f parameter
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

The ping from busybox does not have -f parameter.
Return TCONF in that case.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 testcases/network/tcp_cmds/ping/ping02.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/testcases/network/tcp_cmds/ping/ping02.sh b/testcases/network/tcp_cmds/ping/ping02.sh
index e0a63c5f6..6daf22635 100755
--- a/testcases/network/tcp_cmds/ping/ping02.sh
+++ b/testcases/network/tcp_cmds/ping/ping02.sh
@@ -27,6 +27,10 @@ do_test()
 	local ipaddr=$(tst_ipaddr rhost)
 	local s
 
+	if ! $PING -c 1 -f $ipaddr >/dev/null; then
+		tst_brk TCONF "$PING: invalid option -- 'f'"
+	fi
+
 	for s in $PACKETSIZES; do
 		EXPECT_PASS $PING -c $COUNT -f -s $s $ipaddr -p "$pat" \>/dev/null
 	done
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
