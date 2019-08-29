Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35078A26FE
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:07:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E3B083C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:07:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 790693C1CFD
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:07:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9015820091A
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:07:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CDFB0AC3F;
 Thu, 29 Aug 2019 19:07:14 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 29 Aug 2019 21:07:08 +0200
Message-Id: <20190829190709.30834-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] tst_net.sh: Move variable and link setup to
 separate function
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

When using LTP with netns ("Single Host Configuration"),
init_ltp_netspace before running test which performs checking for
TST_NEEDS_ROOT=1, therefore adding it is not enough.
It fails on adding netns:

RTNETLINK answers: Operation not permitted
sctp01 1 TBROK: ip li add name ltp_ns_veth1 type veth peer name ltp_ns_veth2 failed

NOTE: tst_restore_ipaddr is called before running tests only on netns,
in init_ltp_netspace, therefore tst_require_root_ as a check is enough.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 207 ++++++++++++++++++++-------------------
 1 file changed, 107 insertions(+), 100 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 1678bcfda..eba60bd44 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -57,6 +57,8 @@ tst_net_remote_tmpdir()
 
 tst_net_setup()
 {
+	[ -z "$TST_USE_LEGACY_API" ] && _tst_net_variable_setup
+
 	tst_net_remote_tmpdir
 	[ -n "$TST_SETUP_CALLER" ] && $TST_SETUP_CALLER
 
@@ -732,108 +734,111 @@ tst_default_max_pkt()
 	echo "$((mtu + mtu / 10))"
 }
 
-# Management Link
-[ -z "$RHOST" ] && TST_USE_NETNS="yes"
-export RHOST="$RHOST"
-export PASSWD="${PASSWD:-}"
-# Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
-export LTP_RSH="${LTP_RSH:-rsh -n}"
-
-# Test Links
-# IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),
-# but if you use IP/prefix form, /prefix will be removed by tst_net_vars.
-IPV4_LHOST="${IPV4_LHOST:-10.0.0.2/24}"
-IPV4_RHOST="${IPV4_RHOST:-10.0.0.1/24}"
-IPV6_LHOST="${IPV6_LHOST:-fd00:1:1:1::2/64}"
-IPV6_RHOST="${IPV6_RHOST:-fd00:1:1:1::1/64}"
-
-# tst_net_ip_prefix
-# Strip prefix from IP address and save both If no prefix found sets
-# default prefix.
-#
-# tst_net_iface_prefix reads prefix and interface from rtnetlink.
-# If nothing found sets default prefix value.
-#
-# tst_net_vars exports environment variables related to test links and
-# networks that aren't reachable through the test links.
-#
-# For full list of exported environment variables see:
-# tst_net_ip_prefix -h
-# tst_net_iface_prefix -h
-# tst_net_vars -h
-if [ -z "$TST_PARSE_VARIABLES" ]; then
-	eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
-	eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
-	eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
-	eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
-fi
-
-[ -n "$TST_USE_NETNS" -a "$TST_INIT_NETNS" != "no" ] && init_ltp_netspace
-
-if [ -z "$TST_PARSE_VARIABLES" ]; then
-	eval $(tst_net_iface_prefix $IPV4_LHOST || echo "exit $?")
-	eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST \
-		|| echo "exit $?")
-	eval $(tst_net_iface_prefix $IPV6_LHOST || echo "exit $?")
-	eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV6_RHOST \
-		|| echo "exit $?")
-
-	eval $(tst_net_vars $IPV4_LHOST/$IPV4_LPREFIX \
-		$IPV4_RHOST/$IPV4_RPREFIX || echo "exit $?")
-	eval $(tst_net_vars $IPV6_LHOST/$IPV6_LPREFIX \
-		$IPV6_RHOST/$IPV6_RPREFIX || echo "exit $?")
-
-	tst_res_ TINFO "Network config (local -- remote):"
-	tst_res_ TINFO "$LHOST_IFACES -- $RHOST_IFACES"
-	tst_res_ TINFO "$IPV4_LHOST/$IPV4_LPREFIX -- $IPV4_RHOST/$IPV4_RPREFIX"
-	tst_res_ TINFO "$IPV6_LHOST/$IPV6_LPREFIX -- $IPV6_RHOST/$IPV6_RPREFIX"
-	export TST_PARSE_VARIABLES="yes"
-fi
+_tst_net_variable_setup()
+{
+	# Management Link
+	[ -z "$RHOST" ] && TST_USE_NETNS="yes"
+	export RHOST="$RHOST"
+	export PASSWD="${PASSWD:-}"
+	# Don't use it in new tests, use tst_rhost_run() from tst_net.sh instead.
+	export LTP_RSH="${LTP_RSH:-rsh -n}"
+
+	# Test Links
+	# IPV{4,6}_{L,R}HOST can be set with or without prefix (e.g. IP or IP/prefix),
+	# but if you use IP/prefix form, /prefix will be removed by tst_net_vars.
+	IPV4_LHOST="${IPV4_LHOST:-10.0.0.2/24}"
+	IPV4_RHOST="${IPV4_RHOST:-10.0.0.1/24}"
+	IPV6_LHOST="${IPV6_LHOST:-fd00:1:1:1::2/64}"
+	IPV6_RHOST="${IPV6_RHOST:-fd00:1:1:1::1/64}"
+
+	# tst_net_ip_prefix
+	# Strip prefix from IP address and save both If no prefix found sets
+	# default prefix.
+	#
+	# tst_net_iface_prefix reads prefix and interface from rtnetlink.
+	# If nothing found sets default prefix value.
+	#
+	# tst_net_vars exports environment variables related to test links and
+	# networks that aren't reachable through the test links.
+	#
+	# For full list of exported environment variables see:
+	# tst_net_ip_prefix -h
+	# tst_net_iface_prefix -h
+	# tst_net_vars -h
+	if [ -z "$TST_PARSE_VARIABLES" ]; then
+		eval $(tst_net_ip_prefix $IPV4_LHOST || echo "exit $?")
+		eval $(tst_net_ip_prefix -r $IPV4_RHOST || echo "exit $?")
+		eval $(tst_net_ip_prefix $IPV6_LHOST || echo "exit $?")
+		eval $(tst_net_ip_prefix -r $IPV6_RHOST || echo "exit $?")
+	fi
 
-export TST_NETLOAD_CLN_REQUESTS="${TST_NETLOAD_CLN_REQUESTS:-10000}"
-export TST_NETLOAD_CLN_NUMBER="${TST_NETLOAD_CLN_NUMBER:-2}"
-export HTTP_DOWNLOAD_DIR="${HTTP_DOWNLOAD_DIR:-/var/www/html}"
-export FTP_DOWNLOAD_DIR="${FTP_DOWNLOAD_DIR:-/var/ftp}"
-export FTP_UPLOAD_DIR="${FTP_UPLOAD_DIR:-/var/ftp/pub}"
-export FTP_UPLOAD_URLDIR="${FTP_UPLOAD_URLDIR:-pub}"
-
-# network/stress tests require additional parameters
-export NS_DURATION="${NS_DURATION:-10}"
-export NS_TIMES="${NS_TIMES:-10}"
-export CONNECTION_TOTAL="${CONNECTION_TOTAL:-10}"
-export IP_TOTAL="${IP_TOTAL:-100}"
-export IP_TOTAL_FOR_TCPIP="${IP_TOTAL_FOR_TCPIP:-100}"
-export ROUTE_TOTAL="${ROUTE_TOTAL:-100}"
-export MTU_CHANGE_TIMES="${MTU_CHANGE_TIMES:-100}"
-export IF_UPDOWN_TIMES="${IF_UPDOWN_TIMES:-100}"
-export DOWNLOAD_BIGFILESIZE="${DOWNLOAD_BIGFILESIZE:-2147483647}"
-export DOWNLOAD_REGFILESIZE="${DOWNLOAD_REGFILESIZE:-1048576}"
-export UPLOAD_BIGFILESIZE="${UPLOAD_BIGFILESIZE:-2147483647}"
-export UPLOAD_REGFILESIZE="${UPLOAD_REGFILESIZE:-1024}"
-export MCASTNUM_NORMAL="${MCASTNUM_NORMAL:-20}"
-export MCASTNUM_HEAVY="${MCASTNUM_HEAVY:-4000}"
-
-# Warning: make sure to set valid interface names and IP addresses below.
-# Set names for test interfaces, e.g. "eth0 eth1"
-# This is fallback for LHOST_IFACES in case tst_net_vars finds nothing or we
-# want to use more ifaces.
-export LHOST_IFACES="${LHOST_IFACES:-eth0}"
-export RHOST_IFACES="${RHOST_IFACES:-eth0}"
-# Maximum payload size for 'virt' performance tests, by default eqauls to 1.1 * MTU
-export TST_NET_MAX_PKT="${TST_NET_MAX_PKT:-$(tst_default_max_pkt)}"
-# Set corresponding HW addresses, e.g. "00:00:00:00:00:01 00:00:00:00:00:02"
-export LHOST_HWADDRS="${LHOST_HWADDRS:-$(tst_get_hwaddrs lhost)}"
-export RHOST_HWADDRS="${RHOST_HWADDRS:-$(tst_get_hwaddrs rhost)}"
-
-export NS_ICMPV4_SENDER_DATA_MAXSIZE=1472
-export NS_ICMPV6_SENDER_DATA_MAXSIZE=1452
-
-# More information about network parameters can be found
-# in the following document: testcases/network/stress/README
+	[ -n "$TST_USE_NETNS" -a "$TST_INIT_NETNS" != "no" ] && init_ltp_netspace
+
+	if [ -z "$TST_PARSE_VARIABLES" ]; then
+		eval $(tst_net_iface_prefix $IPV4_LHOST || echo "exit $?")
+		eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV4_RHOST \
+			|| echo "exit $?")
+		eval $(tst_net_iface_prefix $IPV6_LHOST || echo "exit $?")
+		eval $(tst_rhost_run -c 'tst_net_iface_prefix -r '$IPV6_RHOST \
+			|| echo "exit $?")
+
+		eval $(tst_net_vars $IPV4_LHOST/$IPV4_LPREFIX \
+			$IPV4_RHOST/$IPV4_RPREFIX || echo "exit $?")
+		eval $(tst_net_vars $IPV6_LHOST/$IPV6_LPREFIX \
+			$IPV6_RHOST/$IPV6_RPREFIX || echo "exit $?")
+
+		tst_res_ TINFO "Network config (local -- remote):"
+		tst_res_ TINFO "$LHOST_IFACES -- $RHOST_IFACES"
+		tst_res_ TINFO "$IPV4_LHOST/$IPV4_LPREFIX -- $IPV4_RHOST/$IPV4_RPREFIX"
+		tst_res_ TINFO "$IPV6_LHOST/$IPV6_LPREFIX -- $IPV6_RHOST/$IPV6_RPREFIX"
+		export TST_PARSE_VARIABLES="yes"
+	fi
 
-if [ -n "$TST_USE_LEGACY_API" ]; then
-	tst_net_remote_tmpdir
-fi
+	export TST_NETLOAD_CLN_REQUESTS="${TST_NETLOAD_CLN_REQUESTS:-10000}"
+	export TST_NETLOAD_CLN_NUMBER="${TST_NETLOAD_CLN_NUMBER:-2}"
+	export HTTP_DOWNLOAD_DIR="${HTTP_DOWNLOAD_DIR:-/var/www/html}"
+	export FTP_DOWNLOAD_DIR="${FTP_DOWNLOAD_DIR:-/var/ftp}"
+	export FTP_UPLOAD_DIR="${FTP_UPLOAD_DIR:-/var/ftp/pub}"
+	export FTP_UPLOAD_URLDIR="${FTP_UPLOAD_URLDIR:-pub}"
+
+	# network/stress tests require additional parameters
+	export NS_DURATION="${NS_DURATION:-10}"
+	export NS_TIMES="${NS_TIMES:-10}"
+	export CONNECTION_TOTAL="${CONNECTION_TOTAL:-10}"
+	export IP_TOTAL="${IP_TOTAL:-100}"
+	export IP_TOTAL_FOR_TCPIP="${IP_TOTAL_FOR_TCPIP:-100}"
+	export ROUTE_TOTAL="${ROUTE_TOTAL:-100}"
+	export MTU_CHANGE_TIMES="${MTU_CHANGE_TIMES:-100}"
+	export IF_UPDOWN_TIMES="${IF_UPDOWN_TIMES:-100}"
+	export DOWNLOAD_BIGFILESIZE="${DOWNLOAD_BIGFILESIZE:-2147483647}"
+	export DOWNLOAD_REGFILESIZE="${DOWNLOAD_REGFILESIZE:-1048576}"
+	export UPLOAD_BIGFILESIZE="${UPLOAD_BIGFILESIZE:-2147483647}"
+	export UPLOAD_REGFILESIZE="${UPLOAD_REGFILESIZE:-1024}"
+	export MCASTNUM_NORMAL="${MCASTNUM_NORMAL:-20}"
+	export MCASTNUM_HEAVY="${MCASTNUM_HEAVY:-4000}"
+
+	# Warning: make sure to set valid interface names and IP addresses below.
+	# Set names for test interfaces, e.g. "eth0 eth1"
+	# This is fallback for LHOST_IFACES in case tst_net_vars finds nothing or we
+	# want to use more ifaces.
+	export LHOST_IFACES="${LHOST_IFACES:-eth0}"
+	export RHOST_IFACES="${RHOST_IFACES:-eth0}"
+	# Maximum payload size for 'virt' performance tests, by default eqauls to 1.1 * MTU
+	export TST_NET_MAX_PKT="${TST_NET_MAX_PKT:-$(tst_default_max_pkt)}"
+	# Set corresponding HW addresses, e.g. "00:00:00:00:00:01 00:00:00:00:00:02"
+	export LHOST_HWADDRS="${LHOST_HWADDRS:-$(tst_get_hwaddrs lhost)}"
+	export RHOST_HWADDRS="${RHOST_HWADDRS:-$(tst_get_hwaddrs rhost)}"
+
+	export NS_ICMPV4_SENDER_DATA_MAXSIZE=1472
+	export NS_ICMPV6_SENDER_DATA_MAXSIZE=1452
+
+	# More information about network parameters can be found
+	# in the following document: testcases/network/stress/README
+
+	if [ -n "$TST_USE_LEGACY_API" ]; then
+		tst_net_remote_tmpdir
+	fi
+}
 
 if [ -z "$TST_USE_LEGACY_API" ] && ! tst_cmd_available ping6; then
 	ping6()
@@ -845,3 +850,5 @@ if [ -z "$TST_USE_LEGACY_API" ] && ! tst_cmd_available ping6; then
 		export ping6_warn_printed=1
 	fi
 fi
+
+[ -n "$TST_USE_LEGACY_API" ] && _tst_net_variable_setup
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
