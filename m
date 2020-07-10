Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4E21BC14
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EC98B3C32B7
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jul 2020 19:21:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0DC3F3C14F8
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8A8D11A00F22
 for <ltp@lists.linux.it>; Fri, 10 Jul 2020 19:20:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 159CCACFE;
 Fri, 10 Jul 2020 17:20:57 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Jul 2020 19:20:42 +0200
Message-Id: <20200710172044.21592-6-pvorel@suse.cz>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200710172044.21592-1-pvorel@suse.cz>
References: <20200710172044.21592-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 5/7] tst_net.sh: Drop 'sh -c' use from ssh in
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
Acked-by: Alexey Kodanev <alexey.kodanev@oracle.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/lib/tst_net.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/testcases/lib/tst_net.sh b/testcases/lib/tst_net.sh
index 0a8b2a8ca..f6ac4c087 100644
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
-		output=`ssh -nq $user@$RHOST "sh -c \
-			'$pre_cmd $cmd $post_cmd'" $out 2>&1 || echo 'RTERR'`
+		output=$(ssh -nq $user@$RHOST \
+			"$pre_cmd $cmd $post_cmd" $out 2>&1 || echo 'RTERR')
 	fi
 	echo "$output" | grep -q 'RTERR$' && ret=1
 	if [ $ret -eq 1 ]; then
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
