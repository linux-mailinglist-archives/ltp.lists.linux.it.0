Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32797411604
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 15:42:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EE3593C875C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Sep 2021 15:42:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B58FB3C19F3
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 15:42:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id ACFFC1A010F4
 for <ltp@lists.linux.it>; Mon, 20 Sep 2021 15:42:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C001F22081;
 Mon, 20 Sep 2021 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632145357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DHb2PBl39GmNXd/rzr5N/JGEJYlwMec8v+tMQkDg58k=;
 b=zI550s8Hs5WJjUjaXgxafMTMZCftqdgcsJdIYrT9rdoM1nDbzq5bXCYFO4RpA7gsvx1t55
 3BHi5teiLkovvMEUIcIl6I/XmHV08vWPxHsfo77WwBYNnY5/KHiJzbhIbOh20Lc71sGAZF
 2ECMx2TTX1hbE4R0cm4uhfYCgO2Q+tw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632145357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DHb2PBl39GmNXd/rzr5N/JGEJYlwMec8v+tMQkDg58k=;
 b=iHE6sTsdB7NCvRBNZORU55eChE3Djq0JcDQaALiUnZStytGOKjkiJmvcTZPLAdAA4DRU5F
 booUkTChalNKPTBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9135513A71;
 Mon, 20 Sep 2021 13:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W3GzIc2PSGGNXgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 20 Sep 2021 13:42:37 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 Sep 2021 15:42:29 +0200
Message-Id: <20210920134229.28014-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] cpuacct.sh: Fix tst_get_free_pids failure
 detection
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

local tasksmax=$(tst_get_free_pids) is successful, even
tst_get_free_pids fails. Assignment needs to be separated from
declaration to get tst_get_free_pids exit code. Similar fix to
87a82a62c ("lib/tst_test.sh: fix ROD_SILENT command return status check")

It fixes error:
tst_pid.c:79: TINFO: Cannot read session user limits from '/sys/fs/cgroup/user.slice/user-0.slice/pids.max'
tst_pid.c:83: TBROK: Expected 1 conversions got 0 FILE '/sys/fs/cgroup/pids/user.slice/user-0.slice/pids.max'
/opt/ltp/testcases/bin/cpuacct.sh: line 77: [: -le: unary operator expected

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/controllers/cpuacct/cpuacct.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/cpuacct/cpuacct.sh b/testcases/kernel/controllers/cpuacct/cpuacct.sh
index 3002d0a8a..ca881988f 100755
--- a/testcases/kernel/controllers/cpuacct/cpuacct.sh
+++ b/testcases/kernel/controllers/cpuacct/cpuacct.sh
@@ -71,8 +71,10 @@ check_free_memory()
 check_limits()
 {
 	local tasksneeded=$((max * nbprocess))
-	local tasksmax=$(tst_get_free_pids)
-	test $? -eq 0 || return 0
+	local tasksmax
+
+	tasksmax=$(tst_get_free_pids)
+	[ $? -eq 0 ] || return 0
 
 	if [ $tasksmax -le $tasksneeded ]; then
 		tst_brk TCONF "limit of tasks is too low (approximate need $tasksneeded, limit $tasksmax)"
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
