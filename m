Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA4E0602
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 16:08:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E20F83C22D8
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 16:08:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6358D3C2306
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 16:08:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4960C1A0064F
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 16:08:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8243FAC71;
 Tue, 22 Oct 2019 14:08:05 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 22 Oct 2019 16:07:45 +0200
Message-Id: <20191022140745.12777-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH] net/dhcp: Don't start dhclient when wicked is running
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

This is a rework of wicked workaround. Commit f5b28dbb0 stopped wicked
(if running) as it's conflicting with dhclient. But for systems which
use wicked is better to actually test wicked as client side, because
dhclient is not actually used.

Fixes: f5b28dbb0 ("net/dhcp: Add support for wicked")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---

NOTE: I actually had also idea to use -sf (dhclient-script) and maybe
-cf (config file) parameter from running dhclient instance.
NetworkManager is using it's own dhclient-script and config file,
so it'd have more sense to test them (for the same reasons as this
commit). But it does not work (either using just -sf or using both -sf
and -cf - the latter isn't surprising).

Kind regards,
Petr

 testcases/network/dhcp/dhcp_lib.sh | 33 ++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/testcases/network/dhcp/dhcp_lib.sh b/testcases/network/dhcp/dhcp_lib.sh
index f731eed24..634d6ab43 100755
--- a/testcases/network/dhcp/dhcp_lib.sh
+++ b/testcases/network/dhcp/dhcp_lib.sh
@@ -108,7 +108,8 @@ print_dhcp_log()
 
 test01()
 {
-	local wicked
+	local wicked_cfg="/etc/sysconfig/network/ifcfg-$iface1"
+	local wicked_cleanup
 
 	tst_res TINFO "testing DHCP server $dhcp_name: $(print_dhcp_version)"
 	tst_res TINFO "using DHCP client: $(dhclient --version 2>&1)"
@@ -130,15 +131,28 @@ test01()
 
 	if [ $HAVE_SYSTEMCTL -eq 1 ] && \
 		systemctl --no-pager -p Id show network.service | grep -q Id=wicked.service; then
-		tst_res TINFO "temporarily disabling wicked"
-		wicked=1
-		systemctl disable wicked
+		tst_res TINFO "wicked is running, don't start dhclient"
+		if [ ! -f "$wicked_cfg" ]; then
+			cat <<EOF > $wicked_cfg
+BOOTPROTO='dhcp'
+NAME='LTP card'
+STARTMODE='auto'
+USERCONTROL='no'
+EOF
+			wicked_cleanup=1
+		else
+			tst_res TINFO "wicked config file $wicked_cfg already exist"
+		fi
+
+		tst_res TINFO "restarting wicked"
+		systemctl restart wicked
+	else
+		tst_res TINFO "starting dhclient -$TST_IPVER $iface1"
+		dhclient -$TST_IPVER $iface1 || tst_brk TBROK "dhclient failed"
 	fi
-	tst_res TINFO "starting dhclient -$TST_IPVER $iface1"
-	dhclient -$TST_IPVER $iface1 || tst_brk TBROK "dhclient failed"
 
 	# check that we get configured ip address
-	ip addr show $iface1 | grep $ip_addr_check > /dev/null
+	ip addr show $iface1 | grep -q $ip_addr_check
 	if [ $? -eq 0 ]; then
 		tst_res TPASS "'$ip_addr_check' configured by DHCPv$TST_IPVER"
 	else
@@ -151,10 +165,7 @@ test01()
 		fi
 	fi
 
-	if [ "$wicked" ]; then
-		tst_res TINFO "reenabling wicked"
-		systemctl enable wicked
-	fi
+	[ "$wicked_cleanup" ] && rm -f $wicked_cfg
 
 	stop_dhcp
 }
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
