Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8ED410A
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:24:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2382A3C2272
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 15:24:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E098A3C1453
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6C005201189
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 15:24:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 116A6B35A;
 Fri, 11 Oct 2019 13:24:43 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 15:24:28 +0200
Message-Id: <20191011132433.24197-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011132433.24197-1-pvorel@suse.cz>
References: <20191011132433.24197-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/8] tst_net.sh: Add -h -n options to
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

to limit HOST_ID and NET_ID:

-h: specify *host* address range (HOST_ID)
-h MIN,MAX or -h MIN or -h ,MAX

-n: specify *network* address range (NET_ID)
-n MIN,MAX or -n MIN or -n ,MAX

These options are important for looping over max HOST_ID or NET_ID
(255 resp. 0xffff for IPv6), when different than the default range.

NOTE: The default range for host_id & net_id changed from <0, 254 resp. 65534> to
<0, 254 resp. 65535>: broadcast bit was added.
For backwards compatibility -n must be used.
But non of the code used host_id & net_id in loop => no change needed.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 98 ++++++++++++++++++++++++++++++----------
 1 file changed, 74 insertions(+), 24 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 0d6c29407..92d55b5e2 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -355,50 +355,102 @@ tst_ipaddr()
 	fi
 }
 
-# Get IP address of unused network, specified either by type and counter
+# Get IP address of unused network, specified either counter and type
 # or by net and host.
-# tst_ipaddr_un [-cCOUNTER] [-p] [TYPE]
-# tst_ipaddr_un [-p] NET_ID [HOST_ID]
+# counter mode:
+# tst_ipaddr_un [-h MIN,MAX] [-n MIN,MAX] [-p] [-c COUNTER] [TYPE]
+# net & host mode:
+# tst_ipaddr_un [-h MIN,MAX] [-n MIN,MAX] [-p] NET_ID [HOST_ID]
 #
 # TYPE: { lhost | rhost } (default: 'lhost')
-# NET_ID: integer or hex value of net (IPv4: 3rd octet, IPv6: 3rd hextet)
-# HOST_ID: integer or hex value of host (IPv4: 4th octet, IPv6: the last
-# hextet, default: 0)
+# NET_ID: integer or hex value of net (IPv4: 3rd octet <0,255>, IPv6: 3rd
+# hextet <0,65535>)
+# HOST_ID: integer or hex value of host (IPv4: 4th octet <0,255>, IPv6: the
+# last hextet <0, 65535>, default: 0)
 #
 # OPTIONS
 # -c COUNTER: integer value for counting HOST_ID and NET_ID (default: 1)
+#
+# -h: specify *host* address range (HOST_ID)
+# -h MIN,MAX or -h MIN or -h ,MAX
+#
+# -n: specify *network* address range (NET_ID)
+# -n MIN,MAX or -n MIN or -n ,MAX
+#
 # -p: print also prefix
 tst_ipaddr_un()
 {
-	local counter host_id max_host_id max_net_id net_id prefix tmp type
-	local OPTIND
+	local default_max=255
+	[ "$TST_IPV6" ] && default_max=65535
+	local max_net_id=$default_max
+	local min_net_id=0
 
-	while getopts "c:p" opt; do
+	local counter host_id host_range is_counter max_host_id min_host_id net_id prefix tmp type
+
+	local OPTIND
+	while getopts "c:h:n:p" opt; do
 		case $opt in
 			c) counter="$OPTARG";;
+			h)
+				if echo $OPTARG | grep -q ','; then # 'min,max' or 'min,' or ',max'
+					min_host_id="$(echo $OPTARG | cut -d, -f1)"
+					max_host_id="$(echo $OPTARG | cut -d, -f2)"
+				else # min
+					min_host_id="$OPTARG"
+				fi
+				;;
+			n)
+				if echo $OPTARG | grep -q ','; then # 'min,max' or 'min,' or ',max'
+					min_net_id="$(echo $OPTARG | cut -d, -f1)"
+					max_net_id="$(echo $OPTARG | cut -d, -f2)"
+				else # min
+					min_net_id="$OPTARG"
+				fi
+				;;
+			m)
+				! tst_is_int "$OPTARG" || [ "$OPTARG" -lt 0 ]|| [ "$OPTARG" -gt $max_net_id ] && \
+					tst_brk TBROK "tst_ipaddr_un: -m must be integer <0,$max_net_id> ($OPTARG)"
+				[ "$OPTARG" -gt $max_net_id ] && \
+					tst_brk_ TBROK "tst_ipaddr_un: -m cannot be higher than $max_net_id ($OPTARG)"
+				max_host_id="$OPTARG"
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
+	if [ -z "$max_host_id" ]; then
+		[ "$is_counter" ] && max_host_id=$((default_max - 1)) || max_host_id=$default_max
+	fi
+
+	! tst_is_int "$min_host_id" || ! tst_is_int "$max_host_id" || \
+		[ $min_host_id -lt 0 -o $min_host_id -gt $default_max ] || \
+		[ $max_host_id -lt 0 -o $max_host_id -gt $default_max ] && \
+		tst_brk TBROK "tst_ipaddr_un: HOST_ID must be int in range <0,$default_max> ($min_host_id,$max_host_id)"
+	! tst_is_int "$min_net_id" || ! tst_is_int "$max_net_id" || \
+		[ $min_net_id -lt 0 -o $min_net_id -gt $default_max ] || \
+		[ $max_net_id -lt 0 -o $max_net_id -gt $default_max ] && \
+		tst_brk TBROK "tst_ipaddr_un: NET_ID must be int in range <0,$default_max> ($min_net_id,$max_net_id)"
+
+	[ $min_host_id -gt $max_host_id ] && \
+		tst_brk TBROK "tst_ipaddr_un: max HOST_ID ($max_host_id) must be >= min HOST_ID ($min_host_id)"
+	[ $min_net_id -gt $max_net_id ] && \
+		tst_brk TBROK "tst_ipaddr_un: max NET_ID ($max_net_id) must be >= min NET_ID ($min_net_id)"
 
 	# counter
-	if [ $# -eq 0 -o "$1" = "lhost" -o "$1" = "rhost" ]; then
+	host_range=$((max_host_id - min_host_id + 1))
+	if [ "$is_counter" ]; then
 		[ -z "$counter" ] && counter=1
 		[ $counter -lt 1 ] && counter=1
 		type="${1:-lhost}"
-		max_host_id=$((max_net_id - 1))
 		tmp=$((counter * 2))
 		[ "$type" = "rhost" ] && tmp=$((tmp - 1))
-
-		host_id=$((tmp % max_host_id))
-		net_id=$((tmp / max_host_id))
-
-		if [ $host_id -eq 0 ]; then
-			host_id=$max_host_id
-			net_id=$((net_id - 1))
-		fi
+		net_id=$(((tmp - 1) / host_range))
+		host_id=$((tmp - net_id * host_range + min_host_id - 1))
 	else # net_id & host_id
 		net_id="$1"
 		host_id="${2:-0}"
@@ -406,12 +458,10 @@ tst_ipaddr_un()
 			net_id=$(printf %d $net_id)
 			host_id=$(printf %d $host_id)
 		fi
-		[ $net_id -lt 0 ] && net_id=0
-		[ $host_id -lt 0 ] && host_id=1
+		host_id=$((host_id % host_range + min_host_id))
 	fi
 
-	net_id=$((net_id % max_net_id))
-	host_id=$((host_id % max_net_id))
+	net_id=$((net_id % (max_net_id - min_net_id + 1) + min_net_id))
 
 	if [ -z "$TST_IPV6" ]; then
 		echo "${IPV4_NET16_UNUSED}.${net_id}.${host_id}${prefix}"
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
