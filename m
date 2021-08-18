Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B13F0017
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AEF63C5689
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Aug 2021 11:13:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 429583C248D
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:50 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C81CF1000D25
 for <ltp@lists.linux.it>; Wed, 18 Aug 2021 11:12:49 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4493722039;
 Wed, 18 Aug 2021 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629277969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DM76UxobuXImFPNZ/ATMOHYxgU7GEnexkDBwtHh2L04=;
 b=OV9LfeywWV6eZL4aG1XiZbK/SHhwG0H/x3YkW+I0MWumci2NS7arrU7YwKe954uEO1TKEs
 IQ/W+556g/bx9IQYmPO+qwwW1FgUP0fCj1NILWnWG7X8pdE8uDOZWBjB4mlxubmSP5Us37
 x6brhNFEPuqAjKn9Ukq7+qORjwlY9Fg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629277969;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DM76UxobuXImFPNZ/ATMOHYxgU7GEnexkDBwtHh2L04=;
 b=ZbAml+BVgwlo0rPvaKHIlCbOGUaYJ02JNQfq/Ze2yLREtwyC5HiLsXCtpEPe6eI2k9kJTQ
 t5w7swxMvV2ubZAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F2F37133D0;
 Wed, 18 Aug 2021 09:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id yGzEOBDPHGFKFwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 18 Aug 2021 09:12:48 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 18 Aug 2021 11:12:24 +0200
Message-Id: <20210818091224.27578-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210818091224.27578-1-pvorel@suse.cz>
References: <20210818091224.27578-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] commands: Drop which01.sh
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

"which" has been discontinued after 2.21 release in 2015 due this (git
repository is empty [1]).

[1] https://git.savannah.gnu.org/cgit/which.git

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 runtest/commands                    |   1 -
 testcases/commands/which/Makefile   |  11 ---
 testcases/commands/which/which01.sh | 107 ----------------------------
 3 files changed, 119 deletions(-)
 delete mode 100644 testcases/commands/which/Makefile
 delete mode 100755 testcases/commands/which/which01.sh

diff --git a/runtest/commands b/runtest/commands
index 8cfad0449..fc5c86684 100644
--- a/runtest/commands
+++ b/runtest/commands
@@ -32,7 +32,6 @@ mkfs01_msdos_sh mkfs01.sh -f msdos
 mkfs01_vfat_sh mkfs01.sh -f vfat
 mkfs01_ntfs_sh mkfs01.sh -f ntfs
 mkswap01_sh mkswap01.sh
-which01_sh which01.sh
 lsmod01_sh lsmod01.sh
 insmod01_sh insmod01.sh
 wc01_sh wc01.sh
diff --git a/testcases/commands/which/Makefile b/testcases/commands/which/Makefile
deleted file mode 100644
index 1be02f7d7..000000000
--- a/testcases/commands/which/Makefile
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2015 Fujitsu Ltd.
-# Author:Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
-
-top_srcdir		?= ../../..
-
-include $(top_srcdir)/include/mk/env_pre.mk
-
-INSTALL_TARGETS		:= which01.sh
-
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/commands/which/which01.sh b/testcases/commands/which/which01.sh
deleted file mode 100755
index dd6659ea0..000000000
--- a/testcases/commands/which/which01.sh
+++ /dev/null
@@ -1,107 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0-or-later
-# Copyright (c) 2015 Fujitsu Ltd.
-# Author: Guangwen Feng <fenggw-fnst@cn.fujitsu.com>
-#
-# Test which command with some basic options.
-
-TST_CNT=10
-TST_SETUP=setup
-TST_TESTFUNC=do_test
-TST_NEEDS_TMPDIR=1
-TST_NEEDS_CMDS="which"
-. tst_test.sh
-
-setup()
-{
-	touch pname
-	chmod +x pname
-	PATH=$PATH:.
-
-	mkdir bin
-	touch bin/pname
-	chmod +x bin/pname
-	PATH=$PATH:./bin
-
-	alias pname='pname -i'
-}
-
-which_verify()
-{
-	local IFS i j
-	IFS="$IFS_FIRST_LEVEL"
-	for i in $1; do
-		found="no"
-		IFS="$IFS_SECOND_LEVEL"
-		for j in $i; do
-			if grep -F -q "$j" temp; then
-				found="yes"
-			fi
-		done
-		if [ "$found" != "yes" ]; then
-			echo "'$i' not found in:"
-			cat temp
-			echo
-			return 1
-		fi
-	done
-}
-
-which_test()
-{
-	local which_op=$1
-	local prog_name=$2
-
-	local which_cmd="which $which_op $prog_name"
-
-	if [ "$which_op" = "--read-alias" ] || [ "$which_op" = "-i" ] || \
-		[ "$which_op" = "--skip-alias" ]; then
-		which_cmd="alias | $which_cmd"
-	fi
-
-	eval ${which_cmd} >temp 2>&1
-	if [ $? -ne 0 ]; then
-		grep -q -E "unknown option|invalid option|Usage" temp
-		if [ $? -eq 0 ]; then
-			tst_res TCONF "'${which_cmd}' not supported."
-			return
-		fi
-
-		tst_res TFAIL "'${which_cmd}' failed."
-		cat temp
-		return
-	fi
-
-	if [ $# -gt 2 ]; then
-		shift 2
-		which_verify "$@"
-		if [ $? -ne 0 ]; then
-			tst_res TFAIL "'${which_cmd}' failed, not expected."
-			return
-		fi
-	fi
-
-	tst_res TPASS "'${which_cmd}' passed."
-}
-
-IFS_FIRST_LEVEL='^'
-IFS_SECOND_LEVEL='|'
-do_test()
-{
-	case $1 in
-	1) which_test "" "pname" "$PWD/pname|./pname";;
-	2) which_test "-all" "pname" "$PWD/bin/pname|./bin/pname^$PWD/pname|./pname";;
-	3) which_test "-a" "pname" "$PWD/bin/pname|./bin/pname^$PWD/pname|./pname";;
-	4) which_test "--read-alias" "pname" "pname='pname -i'^$PWD/pname";;
-	5) which_test "-i" "pname" "pname='pname -i'^$PWD/pname";;
-	6) alias which='which --read-alias';
-	   which_test "--skip-alias" "pname" "$PWD/pname";
-	   unalias which;;
-	7) which_test "--version";;
-	8) which_test "-v";;
-	9) which_test "-V";;
-	10) which_test "--help";;
-	esac
-}
-
-tst_run
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
