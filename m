Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F974A6B08
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 08AC73C2168
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Sep 2019 16:16:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 1AA933C20B9
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:21 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A2E411A01157
 for <ltp@lists.linux.it>; Tue,  3 Sep 2019 16:16:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50DC9AFCB;
 Tue,  3 Sep 2019 14:16:20 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Sep 2019 16:16:06 +0200
Message-Id: <20190903141610.28887-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190903141610.28887-1-pvorel@suse.cz>
References: <20190903141610.28887-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 3/7] tst_net.sh: Add (mostly) HOST_ID related
 options to tst_ipaddr_un
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

These options are important for looping over max HOST_ID (255 resp.
0xffff for IPv6), when different than the default range.

Added -b, -h -l, -m, -n and -p options:
-b: use also *broadcast* address (HOST_ID: IPv4: 255, IPv6: 0xffff),
equivalent of -m 255 or -m 65535, cannot be combined with -f, -h, -l, -m, -n

-c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)

-f: use *full* address range (<0,255> resp. <0,65535>), cannot be combined
with -b, -h, -l, -m, -n

-h: use only *host* address range (<1,254> resp. <1,65534>), default for
counter mode, cannot be combined with -b, -f, -l, -m, -n

-l MIN_HOST_ID: specify minimal allowed HOST_ID allowed minimal HOST_ID,
cannot be combined with -b, -f, -h, -n

-m MAX_HOST_ID: specify max allowed HOST_ID (default NET_ID -1), cannot be
combined with -b, -f, -h, -n

-n: use also *network* address (HOST_ID: 0), equivalent of -l 0, cannot be
combined with -b, -f, -h, -l, -m

-p: print also prefix

NOTE: The default range for host_id & net_id changed from <0, 254 resp. 65534> to
<0, 254 resp. 65535>: broadcast bit was added.
For backwards compatibility -n must be used.
But non of the code used host_id & net_id in loop => no change needed.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

changes make API a bit complex, but affect only HOST_ID, but sometimes
NET_ID changes are needed (route-change-if.sh). Maybe simple
[ -n MIN_NET_ID,MAX_NET_ID ] [ -h MIN_HOST_ID,MAX_HOST_ID ] would be
better. Comments are welcome.

Note: sometimes we call prefix as mask in the code.

Kind regards,
Petr

 testcases/lib/tst_net.sh | 123 +++++++++++++++++++++++++++++++++------
 1 file changed, 105 insertions(+), 18 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index a4183e013..baeac6e10 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -355,48 +355,135 @@ tst_ipaddr()
 	fi
 }
 
-# Get IP address of unused network, specified either by type and counter
+# Get IP address of unused network, specified either counter and type
 # or by net and host.
-# tst_ipaddr_un [-cCOUNTER] [-p] [TYPE]
-# tst_ipaddr_un [-p] NET_ID [HOST_ID]
+# counter mode:
+# tst_ipaddr_un [-b|-f|-n|[-l MIN_HOST_ID][-m MAX_HOST_ID]] [-p] [-c COUNTER] [TYPE]
+# net & host mode:
+# tst_ipaddr_un [-b|-f|-n|[-l MIN_HOST_ID][-m MAX_HOST_ID]] [-p] NET_ID [HOST_ID]
 #
 # TYPE: { lhost | rhost } (default: 'lhost')
-# NET_ID: integer or hex value of net (IPv4: 3rd octet, IPv6: 3rd hextet)
-# HOST_ID: integer or hex value of host (IPv4: 4th octet, IPv6: the last
-# hextet, default: 0)
+# NET_ID: integer or hex value of net (IPv4: 3rd octet <0,255>, IPv6: 3rd
+# hextet <0,65535>)
+# HOST_ID: integer or hex value of host (IPv4: 4th octet <0,255>, IPv6: the
+# last hextet <0, 65535>, default: 0)
+#
+# RANGES for HOST_ID
+#       |<-------------- -f -------------->|
+#       |  |<----------- -b -------------->|
+#       |<-------------- -n -------->|     |
+#       |  |<----------- -h -------->|     |
+#       |  |    |<- -l L -m M ->|    |     |
+#       |  |    |               |    |     |
+# IPv4: 0  1    L               M   254   255
+# IPv6: 0  1    L               M  65534 65535
 #
 # OPTIONS
+# -b: use also *broadcast* address (HOST_ID: IPv4: 255, IPv6: 0xffff),
+# equivalent of -m 255 or -m 65535, cannot be combined with -f, -h, -l, -m, -n
+#
 # -c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)
+#
+# -f: use *full* address range (<0,255> resp. <0,65535>), cannot be combined
+# with -b, -h, -l, -m, -n
+#
+# -h: use only *host* address range (<1,254> resp. <1,65534>), default for
+# counter mode, cannot be combined with -b, -f, -l, -m, -n
+#
+# -l MIN_HOST_ID: specify minimal allowed HOST_ID allowed minimal HOST_ID,
+# cannot be combined with -b, -f, -h, -n
+#
+# -m MAX_HOST_ID: specify max allowed HOST_ID (default NET_ID -1), cannot be
+# combined with -b, -f, -h, -n
+#
+# -n: use also *network* address (HOST_ID: 0), equivalent of -l 0, cannot be
+# combined with -b, -f, -h, -l, -m
+#
 # -p: print also prefix
 tst_ipaddr_un()
 {
-	local counter host_id max_host_id max_net_id net_id prefix tmp type
-	local OPTIND
+	local counter host_id is_counter max_host_id min_host_id max_net_id net_id prefix tmp type
+	local b_arg f_arg h_arg lm_arg n_arg
 
-	while getopts "c:p" opt; do
+	[ "$TST_IPV6" ] && max_net_id=65535 || max_net_id=255
+
+	local OPTIND
+	while getopts "bc:fhl:m:np" opt; do
 		case $opt in
+			b)
+				[ "$f_arg" -o "$h_arg" -o "$lm_arg" -o "$n_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -b cannot be combined with -f, -h, -l, -m, -n"
+				max_host_id=$max_net_id
+				b_arg=1
+				;;
 			c) counter="$OPTARG";;
+			h)
+				[ "$b_arg" -o "$f_arg" -o "$lm_arg" -o "$n_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -h cannot be combined with -b -f, -l, -m, -n"
+				min_host_id=1
+				max_host_id=$((max_net_id-1))
+				h_arg=1
+				;;
+			f)
+				[ "$b_arg" -o "$h_arg" -o "$lm_arg" -o "$n_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -f cannot be combined with -b, -h, -l, -m, -n"
+				min_host_id=0
+				max_host_id=$max_net_id
+				f_arg=1
+				;;
+			l)
+				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$n_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -l cannot be combined with -b, -f, -h, -n"
+				! tst_is_int "$OPTARG" || [ $OPTARG -lt 0 ] && \
+					tst_brk TBROK "tst_ipaddr_un: -l must be integer <0,$max_net_id> ($OPTARG)"
+				min_host_id="$OPTARG"
+				lm_arg=1
+				;;
+			m)
+				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$n_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -m cannot be combined with -b, -f, -h, -n"
+				! tst_is_int "$OPTARG" || [ "$OPTARG" -lt 0 ]|| [ "$OPTARG" -gt $max_net_id ] && \
+					tst_brk TBROK "tst_ipaddr_un: -m must be integer <0,$max_net_id> ($OPTARG)"
+				[ "$OPTARG" -gt $max_net_id ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -m cannot be higher than $max_net_id ($OPTARG)"
+				max_host_id="$OPTARG"
+				lm_arg=1
+				;;
+			n)
+				[ "$b_arg" -o "$f_arg" -o "$h_arg" -o "$lm_arg" ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -n cannot be combined with -b, -f, -h, -l, -m"
+				min_host_id=0
+				n_arg=1
+				;;
 			p) [ "$TST_IPV6" ] && prefix="/64" || prefix="/24";;
 		esac
 	done
 	shift $(($OPTIND - 1))
+	[ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ] && is_counter=1
 
-	[ "$TST_IPV6" ] && max_net_id=65535 || max_net_id=255
+	if [ -z "$min_host_id" ]; then
+		[ "$is_counter" ] && min_host_id=1 || min_host_id=0
+	fi
+
+	if [ -z "$max_host_id" ]; then
+		[ "$is_counter" ] && max_host_id=$((max_net_id - 1)) || max_host_id=$max_net_id
+	fi
+
+	[ $min_host_id -gt $max_host_id ] && \
+		tst_brk TBROK "tst_ipaddr_un: max HOST_ID ($max_host_id) must be >= min HOST_ID ($min_host_id)"
 
 	# counter
-	if [ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ]; then
+	if [ "$is_counter" ]; then
 		[ -z "$counter" ] && counter=1
 		[ $counter -lt 1 ] && counter=1
 		type="${1:-lhost}"
-		max_host_id=$((max_net_id - 1))
 		tmp=$((counter * 2))
 		[ "$type" = "rhost" ] && tmp=$((tmp - 1))
-
-		host_id=$((tmp % max_host_id))
+		host_id=$((tmp % max_host_id - 1))
 		net_id=$((tmp / max_host_id))
 
-		if [ $host_id -eq 0 ]; then
-			host_id=$max_host_id
+		if [ $host_id -lt 0 ]; then
+			host_id=$((max_host_id-1))
 			net_id=$((net_id - 1))
 		fi
 	else # net_id & host_id
@@ -410,8 +497,8 @@ tst_ipaddr_un()
 		[ $host_id -lt 0 ] && host_id=1
 	fi
 
-	net_id=$((net_id % max_net_id))
-	host_id=$((host_id % max_net_id))
+	net_id=$((net_id % (max_net_id + 1)))
+	host_id=$((host_id % (max_host_id - min_host_id + 1) + min_host_id)) # orig, but also bad
 
 	if [ -z "$TST_IPV6" ]; then
 		echo "${IPV4_NET16_UNUSED}.${net_id}.${host_id}${prefix}"
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
