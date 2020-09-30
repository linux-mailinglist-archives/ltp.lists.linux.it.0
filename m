Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF4B27E6A7
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:29:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C069C3C4C03
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:29:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D24903C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:29:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2824E10009EC
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:29:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 580BCABC1;
 Wed, 30 Sep 2020 10:29:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 12:28:54 +0200
Message-Id: <20200930102855.5967-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 1/2] vxlan0{3,4}.sh: Fix exit on error
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

we need return, continue was for original loop (in vxlan03.sh regression
from f275363d7, then copy pasted to vxlan04.sh).

Fixes: f275363d7 ("net/{stress,virt}: Migrate virt_lib.sh, ipsec_lib.sh + tests using them")
Fixes: 503b1cb1e ("network: add new gre02, geneve02, macsec03 and vxlan04 tests")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/network/virt/vxlan03.sh | 2 +-
 testcases/network/virt/vxlan04.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/testcases/network/virt/vxlan03.sh b/testcases/network/virt/vxlan03.sh
index 9ca303930..ef66a57fe 100755
--- a/testcases/network/virt/vxlan03.sh
+++ b/testcases/network/virt/vxlan03.sh
@@ -40,7 +40,7 @@ do_test()
 		tst_brk TBROK "you must specify IP address"
 	fi
 
-	virt_check_cmd virt_add ltp_v0 id 0 $2 || continue
+	virt_check_cmd virt_add ltp_v0 id 0 $2 || return
 
 	tst_res TINFO "the same VNI must work"
 	# VNI is 24 bits long, so max value, which is not reserved, is 0xFFFFFE
diff --git a/testcases/network/virt/vxlan04.sh b/testcases/network/virt/vxlan04.sh
index 0351ea80f..a59b1183f 100755
--- a/testcases/network/virt/vxlan04.sh
+++ b/testcases/network/virt/vxlan04.sh
@@ -24,7 +24,7 @@ do_test()
 		tst_brk TBROK "you must specify IP address"
 	fi
 
-	virt_check_cmd virt_add ltp_v0 id 0 $2 || continue
+	virt_check_cmd virt_add ltp_v0 id 0 $2 || return
 
 	tst_res TINFO "the same VNI must work"
 	# VNI is 24 bits long, so max value, which is not reserved, is 0xFFFFFE
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
