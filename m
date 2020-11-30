Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA29C2C88DA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 17:02:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C3B923C5983
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Nov 2020 17:02:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8E6D03C2912
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 17:02:42 +0100 (CET)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 10F96200B04
 for <ltp@lists.linux.it>; Mon, 30 Nov 2020 17:02:41 +0100 (CET)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net
 [78.113.208.212]) (Authenticated sender: kory.maincent@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 582CD1C001C;
 Mon, 30 Nov 2020 16:02:39 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: ltp@lists.linux.it
Date: Mon, 30 Nov 2020 17:02:35 +0100
Message-Id: <20201130160235.25105-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] net/ip_tests: Return TCONF if ip command can not
 create dummy interface
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
Cc: thomas.petazzoni@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Test if the dummy interface can be created, return TCONF if not.
Move ip4_addr before, to have it defined and avoid cleanup error.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 testcases/network/iproute/ip_tests.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/testcases/network/iproute/ip_tests.sh b/testcases/network/iproute/ip_tests.sh
index 41c515696..1f0c4634d 100755
--- a/testcases/network/iproute/ip_tests.sh
+++ b/testcases/network/iproute/ip_tests.sh
@@ -23,11 +23,14 @@ init()
 	tst_res TINFO "inititalizing tests"
 
 	iface=ltp_dummy
+	ip4_addr=${IPV4_NET16_UNUSED}.6.6
 	lsmod | grep -q dummy || rm_dummy=1
 
-	ROD ip li add $iface type dummy
+	if ! ip li add $iface type dummy >/dev/null; then
+		rm_dummy=
+		tst_brk TCONF "Module 'dummy' not found"
+	fi
 
-	ip4_addr=${IPV4_NET16_UNUSED}.6.6
 	ROD ip a add ${ip4_addr}/24 dev $iface
 
 	cat > tst_ip02.exp <<-EOF
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
