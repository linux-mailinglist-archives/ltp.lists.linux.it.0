Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFDC2038F8
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 17FD83C2BED
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 134363C2209
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5FDFA200B8D
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9728C1B7;
 Mon, 22 Jun 2020 14:19:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 06:56:49 +0200
Message-Id: <20200622045649.5063-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622045649.5063-1-pvorel@suse.cz>
References: <20200622045649.5063-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [RESENT RFC PATCH 5/5] st_net.sh: tst_rhost_run: Add -d
 option (debug)
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

-d debug mode (print command and netns/ssh handling into stderr)

Add tst_net_debug() simple helper for printing into stderr.

Also use new parameter in tst_rhost_run.sh.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

RFC: I use it quite a lot, but not sure if needed.

Probably using $TST_NET_DEBUG instead of -d would be better.

If we merge "tst_test.sh: Print tst_{res, brk} into stdout" [1],
simple tst_res_ could be used. I was also thinking about adding new flag
"DEBUG", but that's probably not needed.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20200619192542.20113-1-pvorel@suse.cz/

 lib/newlib_tests/shell/net/tst_rhost_run.sh |  8 +++---
 testcases/lib/tst_net.sh                    | 29 ++++++++++++++++-----
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/lib/newlib_tests/shell/net/tst_rhost_run.sh b/lib/newlib_tests/shell/net/tst_rhost_run.sh
index 4c034a4ac..ebcd4ca03 100755
--- a/lib/newlib_tests/shell/net/tst_rhost_run.sh
+++ b/lib/newlib_tests/shell/net/tst_rhost_run.sh
@@ -10,14 +10,14 @@ do_test()
 {
 	local file="/etc/fstab"
 
-	tst_rhost_run -c 'which grep > /dev/null' || \
+	tst_rhost_run -d -c 'which grep > /dev/null' || \
 		tst_res TCONF "grep not found on rhost"
 
-	tst_rhost_run -c "[ -f $file ]" || \
+	tst_rhost_run -d -c "[ -f $file ]" || \
 		tst_res TCONF "$file not found on rhost"
 
-	tst_rhost_run -s -c "grep -q \"[^ ]\" $file"
-	tst_rhost_run -s -c "grep -q '[^ ]' $file"
+	tst_rhost_run -ds -c "grep -q \"[^ ]\" $file"
+	tst_rhost_run -ds -c "grep -q '[^ ]' $file"
 
 	tst_res TPASS "tst_rhost_run is working"
 }
diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 2ed570a6b..d6845618d 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -130,11 +130,17 @@ init_ltp_netspace()
 	tst_restore_ipaddr rhost
 }
 
+tst_net_debug()
+{
+	echo "DEBUG: $@" >&2
+}
+
 # Run command on remote host.
 # tst_rhost_run -c CMD [-b] [-s] [-u USER]
 # Options:
 # -b run in background
 # -c CMD specify command to run (this must be binary, not shell builtin/function)
+# -d debug mode (print command and netns/ssh handling into stderr)
 # -s safe option, if something goes wrong, will exit with TBROK
 # -u USER for ssh (default root)
 # RETURN: 0 on success, 1 on failure
@@ -143,16 +149,17 @@ tst_rhost_run()
 	local post_cmd=' || echo RTERR'
 	local user="root"
 	local ret=0
-	local cmd out output pre_cmd safe
+	local cmd debug out output pre_cmd rcmd sh_cmd safe use
 
 	local OPTIND
-	while getopts :bsc:u: opt; do
+	while getopts :bc:dsu: opt; do
 		case "$opt" in
 		b) [ "${TST_USE_NETNS:-}" ] && pre_cmd= || pre_cmd="nohup"
 		   post_cmd=" > /dev/null 2>&1 &"
 		   out="1> /dev/null"
 		;;
 		c) cmd="$OPTARG" ;;
+		d) debug=1 ;;
 		s) safe=1 ;;
 		u) user="$OPTARG" ;;
 		*) tst_brk_ TBROK "tst_rhost_run: unknown option: $OPTARG" ;;
@@ -166,14 +173,24 @@ tst_rhost_run()
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
-		output=$(ssh -n -q $user@$RHOST \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
+		use="SSH"
+		rcmd="ssh -n -q $user@$RHOST"
 	fi
+
+	if [ "$debug" ]; then
+		tst_net_debug "tst_rhost_run: cmd: $cmd"
+		tst_net_debug "$use: $rcmd \"$sh_cmd\" $out 2>&1"
+	fi
+
+	output=$($rcmd "$sh_cmd" $out 2>&1 || echo 'RTERR')
+
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
 		output=$(echo "$output" | sed 's/RTERR//')
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
