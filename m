Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4C3CB5AC
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D53713C7347
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5ECC3C19CA
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 10A651001380
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AA4D822B2C;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626429860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeNyQAX4flfkryOLeKTy4ZeYN38F7AiscVrT7Rz8YUM=;
 b=j5YDGne1lRHQBhtNDKgpzASu7j/rCItLQS/VkcuJwqnrxbyIeOG/VEvV1yY2jY+P9E9zpI
 pZk6gOK3A4k4XngyPwz/F12rnzro9TNs6wgruXJhPqs85sFdp90BdATrrNJR/q9K6Rya4U
 N6oF0WjeJbnsoSpSNvNIJx1UaEYF/xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626429860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JeNyQAX4flfkryOLeKTy4ZeYN38F7AiscVrT7Rz8YUM=;
 b=Ypg9mvjsRo4xZ96XqlPrVycUTxms+Q9/FKipe6Zo2nOHJOPEyfk88WDq17ffvimAU24ENi
 J7hKxn0i7aD8Z5BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 882BC13BB7;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MCK2H6RZ8WAABAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 10:04:20 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Jul 2021 12:04:14 +0200
Message-Id: <20210716100415.27410-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716100415.27410-1-pvorel@suse.cz>
References: <20210716100415.27410-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] netns_helper.sh: Check veth with TST_NEEDS_DRIVERS
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

instead loading it with modprobe. ip link can load veth itself
(use the same approach as in tst_net.sh).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/containers/netns/netns_helper.sh | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index 218fcef8c..c296b8726 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -5,7 +5,8 @@
 
 TST_CLEANUP=netns_ns_exec_cleanup
 TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="ip modprobe ping"
+TST_NEEDS_CMDS="ip ping"
+TST_NEEDS_DRIVERS="veth"
 . tst_test.sh
 
 # Set to 1 only for test cases using ifconfig (ioctl).
@@ -75,9 +76,6 @@ IFCONF_IN6_ARG=
 # On success function returns, on error tst_brk is called and TC is terminated.
 netns_setup()
 {
-
-	modprobe veth > /dev/null 2>&1
-
 	case "$1" in
 	ns_exec)
 		setns_check
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
