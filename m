Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D35521BC15
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DEA153C5393
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 23B943C1C9A
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B4F8414016AF
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EC5CAD25;
 Fri, 10 Jul 2020 17:20:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 19:20:44 +0200
Message-Id: <20200710172044.21592-8-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710172044.21592-1-pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2 7/7] tst_net.sh/tst_rhost_run: Add debugging
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

via TST_NET_RHOST_RUN_DEBUG=1 and use it in tst_rhost_run.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* Use TST_NET_RHOST_RUN_DEBUG=1 instead of -d in tst_rhost_run
This requires to whitelist it in tst_test.sh.
* use tst_res_ TINFO instead of tst_net_debug


Kind regards,
Petr

 lib/newlib_tests/shell/net/tst_rhost_run.sh |  2 ++
 testcases/lib/tst_net.sh                    | 23 +++++++++++++++------
 testcases/lib/tst_test.sh                   |  2 +-
 testcases/network/README.md                 |  3 +++
 4 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
index 4c034a4ac..9b058a57a 100755
--- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -6,6 +6,8 @@ TST_TESTFUNC=do_test
 PATH="$(dirname $0)/../../../../testcases/lib/:$PATH"
 . tst_net.sh
 
+export TST_NET_RHOST_RUN_DEBUG=1
+
 do_test()
 {
 	local file="/etc/fstab"
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index f6ac4c087..d939a5780 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -138,15 +138,16 @@ init_ltp_netspace()
 # -s safe option, if something goes wrong, will exit with TBROK
 # -u USER for ssh (default root)
 # RETURN: 0 on success, 1 on failure
+# TST_NET_RHOST_RUN_DEBUG=1 enables debugging
 tst_rhost_run()
 {
 	local post_cmd=' || echo RTERR'
 	local user="root"
 	local ret=0
-	local cmd out output pre_cmd safe
+	local cmd out output pre_cmd rcmd sh_cmd safe use
 
 	local OPTIND
-	while getopts :bsc:u: opt; do
+	while getopts :bc:su: opt; do
 		case "$opt" in
 		b) [ "${TST_USE_NETNS:-}" ] && pre_cmd= || pre_cmd="nohup"
 		   post_cmd=" > /dev/null 2>&1 &"
@@ -166,14 +167,24 @@ tst_rhost_run()
 		return 1
 	fi
 
+	sh_cmd="$pre_cmd $cmd $post_cmd"
+
 	if [ -n "${TST_USE_NETNS:-}" ]; then
-		output=$($LTP_NETNS sh -c \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
+		use="NETNS"
+		rcmd="$LTP_NETNS sh -c"
 	else
 		tst_require_cmds ssh
-		output=$(ssh -nq $user@$RHOST \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
+		use="SSH"
+		rcmd="ssh -nq $user@$RHOST"
+	fi
+
+	if [ "$TST_NET_RHOST_RUN_DEBUG" = 1 ]; then
+		tst_res_ TINFO "tst_rhost_run: cmd: $cmd"
+		tst_res_ TINFO "$use: $rcmd \"$sh_cmd\" $out 2>&1"
 	fi
+
+	output=$($rcmd "$sh_cmd" $out 2>&1 || echo 'RTERR')
+
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
 		output=$(echo "$output" | sed 's/RTERR//')
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 2e637b25b..fa97acbac 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -506,7 +506,7 @@ tst_run()
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
 			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
 			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
-			NET_DATAROOT|NET_MAX_PKT);;
+			NET_DATAROOT|NET_MAX_PKT|NET_RHOST_RUN_DEBUG);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
diff --git a/testcases/network/README.md b/testcases/network/README.md
index 1c19a2c15..081ce834a 100644
--- a/testcases/network/README.md
+++ b/testcases/network/README.md
@@ -1,5 +1,8 @@
 # LTP Network Tests
 
+Both single and two host configurations support debugging via
+`TST_NET_RHOST_RUN_DEBUG=1` environment variable.
+
 ## Single Host Configuration
 
 It is the default configuration (if the `RHOST` environment variable is not
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
