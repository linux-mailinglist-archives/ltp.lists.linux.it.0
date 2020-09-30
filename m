Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362D27E6A6
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:29:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F7873C4C11
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 12:29:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 9E42A3C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:29:01 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1DB1A600671
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 12:29:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 719DDAC79;
 Wed, 30 Sep 2020 10:29:00 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 30 Sep 2020 12:28:55 +0200
Message-Id: <20200930102855.5967-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930102855.5967-1-pvorel@suse.cz>
References: <20200930102855.5967-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] virt_lib.sh: Remove checks for tst_ipaddr()
 output
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
 testcases/network/virt/geneve01.sh |  4 ----
 testcases/network/virt/virt_lib.sh |  6 ------
 testcases/network/virt/vlan03.sh   | 10 +---------
 testcases/network/virt/vxlan03.sh  |  4 ----
 testcases/network/virt/vxlan04.sh  |  4 ----
 5 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/testcases/network/virt/geneve01.sh b/testcases/network/virt/geneve01.sh
index 9a746d5df..b731343c8 100755
--- a/testcases/network/virt/geneve01.sh
+++ b/testcases/network/virt/geneve01.sh
@@ -23,10 +23,6 @@ VIRT_PERF_THRESHOLD_MIN=160
 
 do_test()
 {
-	if [ -z $ip_local -o -z $ip_remote ]; then
-		tst_brk TBROK "you must specify IP address"
-	fi
-
 	tst_res TINFO "the same VNI must work"
 	# VNI is 24 bits long, so max value, which is not reserved, is 0xFFFFFE
 	vxlan_setup_subnet_$vxlan_dst_addr "id 0xFFFFFE" "id 0xFFFFFE"
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
diff --git a/testcases/network/virt/vlan03.sh b/testcases/network/virt/vlan03.sh
index adadd76fd..b7125ae7a 100755
--- a/testcases/network/virt/vlan03.sh
+++ b/testcases/network/virt/vlan03.sh
@@ -24,18 +24,10 @@ TST_NEEDS_TMPDIR=1
 TST_TEST_DATA=",$p0 $lb0 $rh1,$p1 $lb1 $rh1"
 TST_TEST_DATA_IFS=","
 TST_TESTFUNC=do_test
-TST_SETUP=do_setup
+TST_SETUP=virt_lib_setup
 TST_CLEANUP=virt_cleanup
 . virt_lib.sh
 
-do_setup()
-{
-	if [ -z $ip_local -o -z $ip_remote ]; then
-		tst_brk TBROK "you must specify IP address"
-	fi
-	virt_lib_setup
-}
-
 do_test()
 {
 	virt_check_cmd virt_add ltp_v0 id 0 $2 || return
diff --git a/testcases/network/virt/vxlan03.sh b/testcases/network/virt/vxlan03.sh
index ef66a57fe..7e5453222 100755
--- a/testcases/network/virt/vxlan03.sh
+++ b/testcases/network/virt/vxlan03.sh
@@ -36,10 +36,6 @@ VIRT_PERF_THRESHOLD_MIN=160
 
 do_test()
 {
-	if [ -z $ip_local -o -z $ip_remote ]; then
-		tst_brk TBROK "you must specify IP address"
-	fi
-
 	virt_check_cmd virt_add ltp_v0 id 0 $2 || return
 
 	tst_res TINFO "the same VNI must work"
diff --git a/testcases/network/virt/vxlan04.sh b/testcases/network/virt/vxlan04.sh
index a59b1183f..2418e5edd 100755
--- a/testcases/network/virt/vxlan04.sh
+++ b/testcases/network/virt/vxlan04.sh
@@ -20,10 +20,6 @@ VIRT_PERF_THRESHOLD_MIN=160
 
 do_test()
 {
-	if [ -z $ip_local -o -z $ip_remote ]; then
-		tst_brk TBROK "you must specify IP address"
-	fi
-
 	virt_check_cmd virt_add ltp_v0 id 0 $2 || return
 
 	tst_res TINFO "the same VNI must work"
-- 
2.28.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
