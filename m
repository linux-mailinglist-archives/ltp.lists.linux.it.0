Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C2C9EB52
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 16:42:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E5FAD3C1CF5
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 16:42:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 78CDE3C1811
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 16:42:08 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9F16C100112F
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 16:42:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D1EAACC1;
 Tue, 27 Aug 2019 14:42:06 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 27 Aug 2019 16:42:00 +0200
Message-Id: <20190827144200.22794-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [COMMITTED][PATCH] net/if-lib.sh: Use ip command as default
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

instead of requiring to specify command with -c.
It makes sense to have it as the default as ifconfig and route
(alternative commands from net-tools) has been deprecated long time ago.

This also fixes misleading TBROK message when -c was not set:
"IF_CMD variable not defined"

+ move test variables to the top.

Fixes: d1291fda8 ("network/interface: Split tests to test only one command per test")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/stress/interface/if-lib.sh | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/testcases/network/stress/interface/if-lib.sh b/testcases/network/stress/interface/if-lib.sh
index 9bf36e421..90030a146 100644
--- a/testcases/network/stress/interface/if-lib.sh
+++ b/testcases/network/stress/interface/if-lib.sh
@@ -3,6 +3,15 @@
 # Copyright (c) 2018 Petr Vorel <pvorel@suse.cz>
 # Author: Petr Vorel <pvorel@suse.cz>
 
+CMD="${CMD:-ip}"
+
+TST_SETUP="${TST_SETUP:-if_setup}"
+TST_TESTFUNC="test_body"
+TST_PARSE_ARGS="if_parse_args"
+TST_USAGE="if_usage"
+TST_OPTS="c:"
+. tst_net_stress.sh
+
 if_usage()
 {
 	echo "-c      Test command (ip, $IF_CMD)"
@@ -17,7 +26,6 @@ if_parse_args()
 
 if_setup()
 {
-	[ -n "$CMD" ] || tst_brk TBROK "IF_CMD variable not defined"
 	if [ "$CMD" != 'ip' -a "$CMD" != "$IF_CMD" ]; then
 		tst_brk TBROK "Missing or wrong -c parameter: '$CMD', use 'ip' or '$IF_CMD'"
 	fi
@@ -33,11 +41,3 @@ if_cleanup_restore()
 	restore_ipaddr
 	restore_ipaddr rhost
 }
-
-TST_SETUP="${TST_SETUP:-if_setup}"
-TST_TESTFUNC="test_body"
-TST_PARSE_ARGS="if_parse_args"
-TST_USAGE="if_usage"
-TST_OPTS="c:"
-
-. tst_net_stress.sh
-- 
2.22.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
