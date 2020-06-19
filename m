Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE72031A5
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 10:11:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F303F3C5E4A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 10:10:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 19B703C2BE2
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 10:10:52 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D8DE1601079
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 10:09:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EFE3DB2B93
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 08:10:50 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Sat, 20 Jun 2020 00:08:49 +0200
Message-Id: <20200619220853.12610-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619220853.12610-1-pvorel@suse.cz>
References: <20200619220853.12610-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] tst_net.sh: Remove rsh support
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

rsh is not used nowadays. When was the first network library version
added in 18739ff06 (2014), it was a default + and ssh replacement was
optional. Netns based single machine testing was added in 5f8ca6cf0
(2016). After 6 years it's time to drop legacy rsh.

ssh based testing setup requires only RHOST variable, TST_USE_SSH has
been removed as unneeded. Also check for ssh in tst_rhost_run().

We still keep $LTP_RSH for some of the network stress tests, which has
not been ported to tst_net.sh yet.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 806b540cd..1b96b3bf4 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -136,7 +136,7 @@ init_ltp_netspace()
 # -b run in background
 # -c CMD specify command to run (this must be binary, not shell builtin/function)
 # -s safe option, if something goes wrong, will exit with TBROK
-# -u USER for ssh/rsh (default root)
+# -u USER for ssh (default root)
 # RETURN: 0 on success, 1 on failure
 tst_rhost_run()
 {
@@ -166,14 +166,12 @@ tst_rhost_run()
 		return 1
 	fi
 
-	if [ -n "${TST_USE_SSH:-}" ]; then
-		output=`ssh -n -q $user@$RHOST "sh -c \
-			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
-	elif [ -n "${TST_USE_NETNS:-}" ]; then
+	if [ -n "${TST_USE_NETNS:-}" ]; then
 		output=`$LTP_NETNS sh -c \
 			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
 	else
-		output=`rsh -n -l $user $RHOST "sh -c \
+		tst_require_cmds ssh
+		output=`ssh -n -q $user@$RHOST "sh -c \
 			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
 	fi
 	echo "$output" | grep -q 'RTERR$' && ret=1
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
