Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 900EB29871B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:00:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3FEE3C5624
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Oct 2020 08:00:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BAC483C293E
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:00:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 286FA1400BC4
 for <ltp@lists.linux.it>; Mon, 26 Oct 2020 08:00:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 56863B8F8;
 Mon, 26 Oct 2020 07:00:12 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 26 Oct 2020 08:00:06 +0100
Message-Id: <20201026070006.25298-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] net: Remove legacy tests from runtest
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

Remove all network stress tests which haven't been rewritten to the new
API yet from the runtest file (mostly multicast tests + some route tests).
These tests use check_envval and other deprecated tools.

See also:
https://github.com/linux-test-project/ltp/issues/310
https://github.com/linux-test-project/ltp/issues/440

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/net_stress.multicast | 16 ----------------
 runtest/net_stress.route     |  4 ----
 2 files changed, 20 deletions(-)

diff --git a/runtest/net_stress.multicast b/runtest/net_stress.multicast
index d2288df62..463fe17ab 100644
--- a/runtest/net_stress.multicast
+++ b/runtest/net_stress.multicast
@@ -6,24 +6,8 @@ mcast4-group-single-socket mcast-group-single-socket
 mcast4-group-multiple-socket mcast-group-multiple-socket
 mcast4-group-same-group mcast-group-same-group
 mcast4-group-source-filter mcast-group-source-filter
-mcast4-pktfld01 mcast4-pktfld01
-mcast4-pktfld02 mcast4-pktfld02
-mcast4-queryfld01 mcast4-queryfld01
-mcast4-queryfld02 mcast4-queryfld02
-mcast4-queryfld03 mcast4-queryfld03
-mcast4-queryfld04 mcast4-queryfld04
-mcast4-queryfld05 mcast4-queryfld05
-mcast4-queryfld06 mcast4-queryfld06
 
 mcast6-group-single-socket mcast-group-single-socket -6
 mcast6-group-multiple-socket mcast-group-multiple-socket -6
 mcast6-group-same-group mcast-group-same-group -6
 mcast6-group-source-filter mcast-group-source-filter -6
-mcast6-pktfld01 mcast6-pktfld01
-mcast6-pktfld02 mcast6-pktfld02
-mcast6-queryfld01 mcast6-queryfld01
-mcast6-queryfld02 mcast6-queryfld02
-mcast6-queryfld03 mcast6-queryfld03
-mcast6-queryfld04 mcast6-queryfld04
-mcast6-queryfld05 mcast6-queryfld05
-mcast6-queryfld06 mcast6-queryfld06
diff --git a/runtest/net_stress.route b/runtest/net_stress.route
index 8755ef0be..b60e55bd6 100644
--- a/runtest/net_stress.route
+++ b/runtest/net_stress.route
@@ -5,8 +5,6 @@ route4-change-if route-change-if.sh
 route4-change-netlink-dst route-change-netlink-dst.sh
 route4-change-netlink-gw route-change-netlink-gw.sh
 route4-change-netlink-if route-change-netlink-if.sh
-route4-redirect route4-redirect
-route4-rmmod route4-rmmod
 
 route6-change-dst route-change-dst.sh -6
 route6-change-gw route-change-gw.sh -6
@@ -14,5 +12,3 @@ route6-change-if route-change-if.sh -6
 route6-change-netlink-dst route-change-netlink-dst.sh -6
 route6-change-netlink-gw route-change-netlink-gw.sh -6
 route6-change-netlink-if route-change-netlink-if.sh -6
-route6-redirect route6-redirect
-route6-rmmod route6-rmmod
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
