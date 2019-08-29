Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 29490A2575
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 20:31:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EB6493C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 20:31:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BF95E3C04F4
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 20:31:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D5CB714060C5
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 20:31:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2FE7AAD20;
 Thu, 29 Aug 2019 18:31:17 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 29 Aug 2019 20:31:10 +0200
Message-Id: <20190829183110.23231-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] net/if-mtu-change.sh: set longer timeout
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

Default CHANGE_INTERVAL 5s caused test to be killed after introducing
LTP_TIMEOUT_MUL to shell API.

TODO: set LTP_TIMEOUT_MUL based on CHANGE_INTERVAL.

Fixes: fbea02ab5 ("lib/tst_test.sh: setup timeout per test run for the
shell tests")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/stress/interface/if-mtu-change.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
index 30c013214..5a05e99c9 100755
--- a/testcases/network/stress/interface/if-mtu-change.sh
+++ b/testcases/network/stress/interface/if-mtu-change.sh
@@ -5,6 +5,8 @@
 # Copyright (c) International Business Machines  Corp., 2005
 # Author: Mitsuru Chinen <mitch@jp.ibm.com>
 
+LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-2}
+
 IF_CMD='ifconfig'
 TST_SETUP="do_setup"
 TST_CLEANUP="do_cleanup"
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
