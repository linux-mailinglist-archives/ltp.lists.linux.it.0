Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78D310C85
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 15:21:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E627E3C72F9
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Feb 2021 15:21:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id B38C73C53BE
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:20:59 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D17BD6021EA
 for <ltp@lists.linux.it>; Fri,  5 Feb 2021 15:20:58 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42CBFB12F;
 Fri,  5 Feb 2021 14:20:58 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  5 Feb 2021 15:20:51 +0100
Message-Id: <20210205142051.32055-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205142051.32055-1-pvorel@suse.cz>
References: <20210205142051.32055-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] if-mtu-change.sh: Lower CHANGE_INTERVAL for netns
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

to make testing faster.

NOTE: the default sleep 5s is needed for ssh based testing to prevent
link-flap errors on the switch. It can be lower down by user.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../network/stress/interface/if-mtu-change.sh      | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
index d2816606b..49ac5e3fc 100755
--- a/testcases/network/stress/interface/if-mtu-change.sh
+++ b/testcases/network/stress/interface/if-mtu-change.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2017-2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2017-2021 Petr Vorel <pvorel@suse.cz>
 # Copyright (c) 2015-2017 Oracle and/or its affiliates. All Rights Reserved.
 # Copyright (c) International Business Machines  Corp., 2005
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
@@ -12,9 +12,13 @@ TST_CLEANUP="do_cleanup"
 
 # The interval of the mtu change [second]
 CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
-
 TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))
 
+if tst_net_use_netns; then
+	CHANGE_INTERVAL="100ms"
+	TST_TIMEOUT=$((30 * MTU_CHANGE_TIMES))
+fi
+
 # The array of the value which MTU is changed into sequentially
 # 552 - net.ipv4.route.min_pmtu
 CHANGE_VALUES="784 1142 552 1500 552 1500 552 748 552 1142 1500"
@@ -65,6 +69,7 @@ find_ipv4_max_packet_size()
 
 do_setup()
 {
+
 	[ "$TST_IPV6" ] && CHANGE_VALUES=$CHANGE6_VALUES
 	if_setup
 	saved_mtu="$(cat /sys/class/net/$(tst_iface)/mtu)"
@@ -83,9 +88,10 @@ do_cleanup()
 test_body()
 {
 	local cmd="$CMD"
+	local msg="'$cmd' changes MTU $MTU_CHANGE_TIMES times every $CHANGE_INTERVAL"
 
-	tst_res TINFO "'$cmd' changes MTU $MTU_CHANGE_TIMES times" \
-	               "every $CHANGE_INTERVAL seconds"
+	tst_is_int $CHANGE_INTERVAL && msg="$msg seconds"
+	tst_res TINFO "$msg"
 
 	mtu_array_len=$(echo $CHANGE_VALUES | wc -w)
 	local cnt=0
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
