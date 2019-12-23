Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D86B12924F
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Dec 2019 08:42:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E076B3C23C9
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Dec 2019 08:42:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 95CFD3C147F
 for <ltp@lists.linux.it>; Mon, 23 Dec 2019 08:42:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8CA7B1A01487
 for <ltp@lists.linux.it>; Mon, 23 Dec 2019 08:42:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0633BAC35;
 Mon, 23 Dec 2019 07:41:59 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 23 Dec 2019 08:41:52 +0100
Message-Id: <20191223074152.27397-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] linktest.sh: Convert to use getopts + set default
 values
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Main motivation for getopts is to allow -h (print help) to be working
without too much tweaking. Although other default options (-i n) were
working, there was no way to print help.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/fs                               |  2 +-
 testcases/kernel/fs/linktest/linktest.sh | 50 ++++++++++++------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/runtest/fs b/runtest/fs
index 463185756..464ba8fb9 100644
--- a/runtest/fs
+++ b/runtest/fs
@@ -40,7 +40,7 @@ rwtest05 export LTPROOT; rwtest -N rwtest05 -c -q -i 50 -T 64b 500b:$TMPDIR/rwte
 iogen01 export LTPROOT; rwtest -N iogen01 -i 120s -s read,write -Da -Dv -n 2 500b:$TMPDIR/doio.f1.$$ 1000b:$TMPDIR/doio.f2.$$
 
 fs_inod01 fs_inod $TMPDIR 10 10 10
-linker01 linktest.sh 1000 1000
+linker01 linktest.sh
 openfile01 openfile -f10 -t10
 inode01 inode01
 inode02 inode02
diff --git a/testcases/kernel/fs/linktest/linktest.sh b/testcases/kernel/fs/linktest/linktest.sh
index 9d8c8b92a..3386a445b 100755
--- a/testcases/kernel/fs/linktest/linktest.sh
+++ b/testcases/kernel/fs/linktest/linktest.sh
@@ -3,36 +3,36 @@
 # Copyright (c) International Business Machines Corp., 2000
 # Copyright (c) Linux Test Project, 2012-2019
 # Regression test for max links per file
-# linktest.sh <number of symlinks> <number of hardlinks>
 # Author: Ngie Cooper <yaneurabeya@gmail.com>
 
 TST_NEEDS_TMPDIR=1
-TST_POS_ARGS=2
 TST_TESTFUNC=do_test
+TST_OPTS="a:s:"
+TST_PARSE_ARGS=parse_args
+TST_USAGE=usage
 
 . tst_test.sh
 
-if [ $# -ne 2 ]; then
-	tst_res TBROK "usage: $0 {softlink count} {hardlink count}"
-	exit 1
-fi
+hard_links=1000
+soft_links=1000
 
-validate_parameter()
+usage()
 {
-	if ! tst_is_int "$2"; then
-		tst_brk TBROK "$1 must be integer"
-	fi
-
-	if [ "$2" -lt 0 ]; then
-		tst_brk TBROK "$1 must be >= 0"
-	fi
+	echo "Usage: linktest.sh {-a n} {-s n}"
+	echo "-a n    Hard link count"
+	echo "-s n    Soft link count"
 }
 
-validate_parameter "softlink count" $1
-validate_parameter "hardlink count" $2
+parse_args()
+{
+	tst_is_int "$2" || tst_brk TBROK "-$1 must be integer ($2)"
+	[ "$2" -ge 0 ] || tst_brk TBROK "-$1 must be >= 0 ($2)"
 
-soft_links=$1
-hard_links=$2
+	case $1 in
+	a) hard_links=$2;;
+	s) soft_links=$2;;
+	esac
+}
 
 do_link()
 {
@@ -45,20 +45,20 @@ do_link()
 	local i=0
 	local rtype="TFAIL"
 
+	tst_res TINFO "test $prefix_msg link, limit: $limit"
+
 	cd "${prefix}link.$$"
 	while [ $i -lt $limit ]; do
-		if ! ln ${ln_opts} "$PWD/${prefix}file" ${prefix}file${i}; then
+		if ! ln $ln_opts "$PWD/${prefix}file" ${prefix}file${i}; then
 			lerrors=$((lerrors + 1))
 		fi
 		i=$((i + 1))
 	done
 	cd ..
 
-	if [ $lerrors -eq 0 ]; then
-		rtype=TPASS
-	fi
+	[ $lerrors -eq 0 ] && rtype="TPASS"
 
-	tst_res $rtype "$prefix_msg link errors: $lerrors"
+	tst_res $rtype "errors: $lerrors"
 }
 
 do_test()
@@ -66,8 +66,8 @@ do_test()
 	mkdir hlink.$$ slink.$$
 	touch hlink.$$/hfile slink.$$/sfile
 
-	do_link s "-s" $soft_links "symbolic"
-	do_link h   "" $hard_links "hard"
+	do_link "s" "-s" $soft_links "symbolic"
+	do_link "h"   "" $hard_links "hard"
 
 	rm -rf hlink.$$ slink.$$
 }
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
