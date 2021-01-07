Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E69122ECF4E
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 13:02:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B9343C6548
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Jan 2021 13:02:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 939143C06E2
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 13:02:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7DAE214001EE
 for <ltp@lists.linux.it>; Thu,  7 Jan 2021 13:02:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3E69AD24;
 Thu,  7 Jan 2021 12:02:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  7 Jan 2021 13:02:47 +0100
Message-Id: <20210107120247.31465-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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

Tested only on netns based testing.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi Alexey,

any reason why CHANGE_INTERVAL was set 5s?

It'd be nice to speedup the tests, which were slow even before
2d422edbf ("if-mtu-change.sh: Add max packet size detection for IPv4")
which added 25% slowdown.

Could you please test this on two host based setup?

Kind regards,
Petr

 testcases/network/stress/interface/if-mtu-change.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
index d2816606b..3efe00461 100755
--- a/testcases/network/stress/interface/if-mtu-change.sh
+++ b/testcases/network/stress/interface/if-mtu-change.sh
@@ -11,7 +11,7 @@ TST_CLEANUP="do_cleanup"
 . if-lib.sh
 
 # The interval of the mtu change [second]
-CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
+CHANGE_INTERVAL=${CHANGE_INTERVAL:-1}
 
 TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))
 
-- 
2.29.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
