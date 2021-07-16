Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7072A3CB5AB
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 182063C8624
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A59803C65C2
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 30134600481
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:21 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0F7A22B5B;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626429860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIxULvcIDQjBuO633durr5otrqRmvOpZlUuOwZiHvF4=;
 b=F/iIoluelnkgzybV05wJvlBvHiu/9XnL1nIOreSoCXxCu6s8TfoTrkBDne03ssH+D6CzKc
 NJhgn0KYvzotXhRZn01vKPJUncIWqdbwDfLc1yp70g7Lc0Kf/k+znG5CAx3b+UrVwtsxCJ
 Bz7j0DEMOpiR2KTLXfO1D6crYjDXz0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626429860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kIxULvcIDQjBuO633durr5otrqRmvOpZlUuOwZiHvF4=;
 b=A8t1hTaLLmaHsiB+t1OWmJ/wZUgOok7kNUGug5qwBTyHGk00UV2ygOoYf92RMqQBiE2/Xp
 W9ND30O5EEgGkXBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7FBB13BB7;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wJ/zKaRZ8WAABAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 10:04:20 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Jul 2021 12:04:15 +0200
Message-Id: <20210716100415.27410-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716100415.27410-1-pvorel@suse.cz>
References: <20210716100415.27410-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] netns_helper.sh: Formatting and style cleanup
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

Replace spaces with tabs, use shorter if clauses, add missing local.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 .../kernel/containers/netns/netns_helper.sh   | 41 ++++++++-----------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index c296b8726..d7d4d2c2d 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -79,9 +79,8 @@ netns_setup()
 	case "$1" in
 	ns_exec)
 		setns_check
-		if [ $? -eq 32 ]; then
-			tst_brk TCONF "setns not supported"
-		fi
+		[ $? -eq 32 ] && tst_brk TCONF "setns not supported"
+
 		NS_TYPE="net"
 		netns_ns_exec_setup
 		TST_CLEANUP=netns_ns_exec_cleanup
@@ -124,17 +123,20 @@ netns_setup()
 
 	case "$2" in
 	ipv4)
-		IP0=$4; IP1=$5
-		tping="ping"; NETMASK=24
+		IP0=$4
+		IP1=$5
+		tping="ping"
+		NETMASK=24
 		;;
 	ipv6)
 		IFCONF_IN6_ARG="inet6 add"
-		IP0=$6; IP1=$7;
+		IP0=$6
+		IP1=$7
 
 		if tst_cmd_available ping6; then
-		    tping="ping6"
+			tping="ping6"
 		else
-		    tping="ping -6"
+			tping="ping -6"
 			tst_res_ TINFO "ping6 binary/symlink is missing, using workaround. Please, report missing ping6 to your distribution."
 		fi
 		NETMASK=64
@@ -153,6 +155,8 @@ netns_setup()
 # ethernet device is then created for each namespace.
 netns_ns_exec_setup()
 {
+	local ret
+
 	NS_EXEC="ns_exec"
 
 	NS_HANDLE0=$(ns_create $NS_TYPE)
@@ -172,13 +176,8 @@ netns_ns_exec_setup()
 
 	$NS_EXEC $NS_HANDLE0 $NS_TYPE ns_ifmove veth1 $NS_HANDLE1
 	ret=$?
-	if [ $ret -eq 0 ]; then
-		return;
-	fi
-
-	if [ $ret -eq 32 ]; then
-		tst_brk TCONF "IFLA_NET_NS_PID not supported"
-	fi
+	[ $ret -eq 0 ] && return
+	[ $ret -eq 32 ] && tst_brk TCONF "IFLA_NET_NS_PID not supported"
 
 	tst_brk TBROK "unable to add device veth1 to the separate network namespace"
 }
@@ -215,9 +214,7 @@ netns_ip_setup()
 # of them (IPv4/IPv6 variant is decided by netns_setup() function).
 netns_set_ip()
 {
-	if [ -z "$NS_EXEC" ]; then
-		tst_brk TBROK "netns_setup() function must be called first"
-	fi
+	[ "$NS_EXEC" ] || tst_brk TBROK "netns_setup() function must be called first"
 
 	# This applies only for ipv6 variant:
 	# Do not accept Router Advertisements (accept_ra) and do not use
@@ -259,9 +256,7 @@ netns_set_ip()
 
 netns_ns_exec_cleanup()
 {
-	if [ -z "$NS_EXEC" ]; then
-		return
-	fi
+	[ "$NS_EXEC" ] || return
 
 	# removes veth0 device (which also removes the paired veth1 device)
 	$NS_EXEC $NS_HANDLE0 $NS_TYPE ip link delete veth0
@@ -273,9 +268,7 @@ netns_ns_exec_cleanup()
 
 netns_ip_cleanup()
 {
-	if [ -z "$NS_EXEC" ]; then
-		return
-	fi
+	[ "$NS_EXEC" ] || return
 
 	# removes veth0 device (which also removes the paired veth1 device)
 	$NS_EXEC $NS_HANDLE0 ip link delete veth0
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
