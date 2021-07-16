Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0BA3CB5AD
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48ED53C7349
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:04:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E23D53C65C2
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:21 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0969A201139
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:04:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F94722AE7;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626429860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvYn5s8n3nx4eS88kdHWM0aobh9WDU6HeCJUGoPE7cg=;
 b=J20WzNTQyi3iuscQsA5QSdhMcO1tobo8+XFpWlM3IzoqqA+m42lW41S74nhzkHh/K0CRbL
 EoFyI4ecv5lisdheYySwx3vW/y+Fu5JGE/5RPRGktKaHkwpPD/U2mp6nRA93jSulTV6JTr
 xFwMp6KCb6H1H56Dk9R3tY1fGhA0XL0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626429860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MvYn5s8n3nx4eS88kdHWM0aobh9WDU6HeCJUGoPE7cg=;
 b=3V1fCSN/Xwrp8SZLmfv4xpRhd+69bv3f/XYAOlAJfe1jxyG4rj5czGVjKbeeJ7GxFk/Q8s
 WSulFQIN4yJoEkDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B5DB13BB7;
 Fri, 16 Jul 2021 10:04:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFrZEKRZ8WAABAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Jul 2021 10:04:20 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 16 Jul 2021 12:04:13 +0200
Message-Id: <20210716100415.27410-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716100415.27410-1-pvorel@suse.cz>
References: <20210716100415.27410-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] netns_helper.sh: Check for ping
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

to give more informative message than just:
netns_comm 1 TFAIL: ns_exec 48906 net ping -q -c2 -I veth0 192.168.0.3 failed unexpectedly
netns_comm 1 TFAIL: ns_exec 48908 net ping -q -c2 -I veth1 192.168.0.2 failed unexpectedly
netns_comm 1 TFAIL: ns_exec 48906 net ping -q -c2 -I lo 127.0.0.1 failed unexpectedly

Use the same approach implemented in d57ac0b7a for tst_net.sh: for IPv6
ping6 is preferred (but still require ping), but fallback with warning
if only ping is available (some distros may still miss ping6 symlink
required by upstream since iputils s20150815).

Reported-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Reported in https://github.com/linux-test-project/ltp/issues/840

 testcases/kernel/containers/netns/netns_helper.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/containers/netns/netns_helper.sh b/testcases/kernel/containers/netns/netns_helper.sh
index 1f97ec4d4..218fcef8c 100755
--- a/testcases/kernel/containers/netns/netns_helper.sh
+++ b/testcases/kernel/containers/netns/netns_helper.sh
@@ -1,11 +1,11 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) Linux Test Project, 2014-2020
+# Copyright (c) Linux Test Project, 2014-2021
 # Copyright (c) 2015 Red Hat, Inc.
 
 TST_CLEANUP=netns_ns_exec_cleanup
 TST_NEEDS_ROOT=1
-TST_NEEDS_CMDS="ip modprobe"
+TST_NEEDS_CMDS="ip modprobe ping"
 . tst_test.sh
 
 # Set to 1 only for test cases using ifconfig (ioctl).
@@ -132,10 +132,12 @@ netns_setup()
 	ipv6)
 		IFCONF_IN6_ARG="inet6 add"
 		IP0=$6; IP1=$7;
-		if which ping6 >/dev/null 2>&1; then
+
+		if tst_cmd_available ping6; then
 		    tping="ping6"
 		else
 		    tping="ping -6"
+			tst_res_ TINFO "ping6 binary/symlink is missing, using workaround. Please, report missing ping6 to your distribution."
 		fi
 		NETMASK=64
 		;;
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
