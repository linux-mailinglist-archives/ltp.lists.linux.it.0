Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605C2038F7
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 320BB3C2BDF
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Jun 2020 16:20:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id ECC6F3C2239
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6594414012B2
 for <ltp@lists.linux.it>; Mon, 22 Jun 2020 16:19:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D7069C1B9;
 Mon, 22 Jun 2020 14:19:56 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Jun 2020 06:56:47 +0200
Message-Id: <20200622045649.5063-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200622045649.5063-1-pvorel@suse.cz>
References: <20200622045649.5063-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.1 required=7.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [RESENT PATCH 3/5] tst_net.sh: Drop 'sh -c' use from ssh in
 tst_rhost_run
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

This simplifies the command and allows to use double quotes in command
parameter for ssh, as it removes single nested quotes of command
parameter (thus fixes like c1a2d53f6 "network/nfs_lib.sh: Use double
quotes for grep pattern" are not needed any more).

NOTE: 'sh -c' is still required for netns based testing, but does not
use nested quotes. Now both variants use only double quotes.

Suggested-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 1b96b3bf4..2ed570a6b 100644
--- a/testcases/lib/tst_net.sh
+++ b/testcases/lib/tst_net.sh
@@ -167,12 +167,12 @@ tst_rhost_run()
 	fi
 
 	if [ -n "${TST_USE_NETNS:-}" ]; then
-		output=`$LTP_NETNS sh -c \
-			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR'`
+		output=$($LTP_NETNS sh -c \
+			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
 	else
 		tst_require_cmds ssh
-		output=`ssh -n -q $user@$RHOST "sh -c \
-			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
+		output=$(ssh -n -q $user@$RHOST \
+			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
 	fi
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
