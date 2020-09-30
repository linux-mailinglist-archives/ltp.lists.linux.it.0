Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE0327E46A
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 10:59:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 826A63C2A13
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 10:59:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 7C7B83C12A0
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 10:58:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 188876006D1
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 10:58:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AED3AD82;
 Wed, 30 Sep 2020 08:58:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 10:58:51 +0200
Message-Id: <20200930085851.21455-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] virt_lib.sh: Remove checks for tst_ipaddr() output
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

+ now unused $ip_local and $ip_remote variables.

These checks were originally (before f275363d7) in tests which use
virt_compare_netperf also with variables.

It should be safe to expect tst_ipaddr() output to be safe even for SSH
based setup ("two host" configuration) due various checks in tst_net.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
This can wait after the release.

 testcases/network/virt/virt_lib.sh | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/testcases/network/virt/virt_lib.sh b/testcases/network/virt/virt_lib.sh
index 827829633..cb2b2ba97 100644
--- a/testcases/network/virt/virt_lib.sh
+++ b/testcases/network/virt/virt_lib.sh
@@ -61,11 +61,9 @@ virt_lib_setup()
 TST_NEEDS_ROOT=1
 . tst_net.sh
 
-ip_local=$(tst_ipaddr)
 ip_virt_local="$(TST_IPV6= tst_ipaddr_un)"
 ip6_virt_local="$(TST_IPV6=6 tst_ipaddr_un)"
 
-ip_remote=$(tst_ipaddr rhost)
 ip_virt_remote="$(TST_IPV6= tst_ipaddr_un rhost)"
 ip6_virt_remote="$(TST_IPV6=6 tst_ipaddr_un rhost)"
 
@@ -376,10 +374,6 @@ virt_gre_setup()
 	[ "$TST_IPV6" ] && virt_type="ip6gre"
 	virt_lib_setup
 
-	if [ -z $ip_local -o -z $ip_remote ]; then
-		tst_brk TBROK "you must specify IP address"
-	fi
-
 	tst_res TINFO "test $virt_type"
 	virt_setup "local $(tst_ipaddr) remote $(tst_ipaddr rhost) dev $(tst_iface)" \
 	"local $(tst_ipaddr rhost) remote $(tst_ipaddr) dev $(tst_iface rhost)"
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
