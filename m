Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F3D4109
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:24:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C6A73C227F
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:24:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DEA003C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6396C20118C
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DFA6CAF8A;
 Fri, 11 Oct 2019 13:24:42 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 15:24:27 +0200
Message-Id: <20191011132433.24197-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011132433.24197-1-pvorel@suse.cz>
References: <20191011132433.24197-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 2/8] tst_net.sh: Add -p option to return prefix in
 tst_ipaddr_un()
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

+ reformat docs a bit

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 2f6f0b275..0d6c29407 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -357,28 +357,33 @@ tst_ipaddr()
 
 # Get IP address of unused network, specified either by type and counter
 # or by net and host.
-# tst_ipaddr_un [-cCOUNTER] [TYPE]
-# tst_ipaddr_un NET_ID [HOST_ID]
-# TYPE: { lhost | rhost }; Default value is 'lhost'.
-# COUNTER: Integer value for counting HOST_ID and NET_ID. Default is 1.
-# NET_ID: Integer or hex value of net. For IPv4 is 3rd octet, for IPv6
-# is 3rd hextet.
-# HOST_ID: Integer or hex value of host. For IPv4 is 4th octet, for
-# IPv6 is the last hextet. Default value is 0.
+# tst_ipaddr_un [-cCOUNTER] [-p] [TYPE]
+# tst_ipaddr_un [-p] NET_ID [HOST_ID]
+#
+# TYPE: { lhost | rhost } (default: 'lhost')
+# NET_ID: integer or hex value of net (IPv4: 3rd octet, IPv6: 3rd hextet)
+# HOST_ID: integer or hex value of host (IPv4: 4th octet, IPv6: the last
+# hextet, default: 0)
+#
+# OPTIONS
+# -c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)
+# -p: print also prefix
 tst_ipaddr_un()
 {
-	local counter host_id net_id max_host_id max_net_id tmp type
+	local counter host_id max_host_id max_net_id net_id prefix tmp type
 	local OPTIND
 
-	while getopts "c:" opt; do
+	while getopts "c:p" opt; do
 		case $opt in
 			c) counter="$OPTARG";;
+			p) [ "$TST_IPV6" ] && prefix="/64" || prefix="/24";;
 		esac
 	done
 	shift $(($OPTIND - 1))
 
 	[ "$TST_IPV6" ] && max_net_id=65535 || max_net_id=255
 
+	# counter
 	if [ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ]; then
 		[ -z "$counter" ] && counter=1
 		[ $counter -lt 1 ] && counter=1
@@ -394,7 +399,7 @@ tst_ipaddr_un()
 			host_id=$max_host_id
 			net_id=$((net_id - 1))
 		fi
-	else
+	else # net_id & host_id
 		net_id="$1"
 		host_id="${2:-0}"
 		if [ "$TST_IPV6" ]; then
@@ -409,14 +414,14 @@ tst_ipaddr_un()
 	host_id=$((host_id % max_net_id))
 
 	if [ -z "$TST_IPV6" ]; then
-		echo "${IPV4_NET16_UNUSED}.${net_id}.${host_id}"
+		echo "${IPV4_NET16_UNUSED}.${net_id}.${host_id}${prefix}"
 		return
 	fi
 
 	[ $host_id -gt 0 ] && host_id="$(printf %x $host_id)" || host_id=
 	[ $net_id -gt 0 ] && net_id="$(printf %x $net_id)" || net_id=
 	[ "$net_id" ] && net_id=":$net_id"
-	echo "${IPV6_NET32_UNUSED}${net_id}::${host_id}"
+	echo "${IPV6_NET32_UNUSED}${net_id}::${host_id}${prefix}"
 }
 
 # tst_init_iface [TYPE] [LINK]
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
