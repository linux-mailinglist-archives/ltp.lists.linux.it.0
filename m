Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7272F525605
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:47:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 431E33CA9D0
	for <lists+linux-ltp@lfdr.de>; Thu, 12 May 2022 21:47:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 351173CA9C3
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7385B200BD4
 for <ltp@lists.linux.it>; Thu, 12 May 2022 21:46:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D3A5A1F90C;
 Thu, 12 May 2022 19:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652384766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqBSeZDtOxaCsNwdqmJqJJrxdR0TrM59wfWbyI4wWdw=;
 b=kF6fbP4cywraTqSWJLk5gxiEj1RCPSUuYSovBu+MFQFZqC372BYcRnfCGkNS8tUphUh3te
 XCTpXIVHjBDnqn5Vrhh7MEdQBr02xD72z7lEXsgouopmqzpJjoRfZCjBjZ9QDv4PodvARS
 gyfhUpJZQ28fDM7LD3DudIk6mgWVUQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652384766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqBSeZDtOxaCsNwdqmJqJJrxdR0TrM59wfWbyI4wWdw=;
 b=e/BgjqvAG8AdAaExijC1vqrMhzNKV1jVTEqTc+5dPjOGg6orVbjOoCq+u6JNo/zcpblyCE
 4VWtjfPgxwNJYmBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7387B13ABE;
 Thu, 12 May 2022 19:46:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oO8PGv5jfWIkVwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 12 May 2022 19:46:06 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 12 May 2022 21:45:55 +0200
Message-Id: <20220512194557.30911-7-pvorel@suse.cz>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220512194557.30911-1-pvorel@suse.cz>
References: <20220512194557.30911-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 6/8] tst_test.sh: Add $TST_ALL_FILESYSTEMS
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
Cc: Martin Doucha <martin.doucha@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/shell-test-api.txt    |   1 +
 testcases/lib/tst_test.sh | 106 ++++++++++++++++++++++++--------------
 2 files changed, 69 insertions(+), 38 deletions(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index 65444541e..93073be13 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -199,6 +199,7 @@ simply by setting right '$TST_FOO'.
 [options="header"]
 |=============================================================================
 | Variable name            | Action done
+| 'TST_ALL_FILESYSTEMS'    | Testing on all available filesystems (tst_test.all_filesystems equivalent).
 | 'TST_DEV_EXTRA_OPTS'     | Pass extra 'mkfs' options _after_ device name,
                              to 'tst_mkfs', use with 'TST_FORMAT_DEVICE=1'.
 | 'TST_DEV_FS_OPTS'        | Pass 'mkfs' options _before_ the device name,
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 0f1a63aac..f2786bc71 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -28,23 +28,12 @@ fi
 trap "tst_brk TBROK 'test interrupted'" INT
 trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM
 
+# FIXME: debug called more times => check things moved out of it
 _tst_do_exit()
 {
 	local ret=0
 	TST_DO_EXIT=1
 
-	if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
-		if command -v $TST_CLEANUP >/dev/null 2>/dev/null; then
-			$TST_CLEANUP
-		else
-			tst_res TWARN "TST_CLEANUP=$TST_CLEANUP declared, but function not defined (or cmd not found)"
-		fi
-	fi
-
-	if [ "$TST_MOUNT_DEVICE" = 1 -a "$TST_MOUNT_FLAG" = 1 ]; then
-		tst_umount
-	fi
-
 	if [ "$TST_NEEDS_DEVICE" = 1 -a "$TST_DEVICE_FLAG" = 1 ]; then
 		if ! tst_device release "$TST_DEVICE"; then
 			tst_res TWARN "Failed to release device '$TST_DEVICE'"
@@ -61,8 +50,6 @@ _tst_do_exit()
 		rm $LTP_IPC_PATH
 	fi
 
-	_tst_cleanup_timer
-
 	if [ $TST_FAIL -gt 0 ]; then
 		ret=$((ret|1))
 	fi
@@ -613,17 +600,41 @@ _tst_init_checkpoints()
 	export LTP_IPC_PATH
 }
 
+_prepare_device()
+{
+	if [ "$TST_FORMAT_DEVICE" = 1 ]; then
+		tst_clear_device $TST_DEVICE
+		tst_mkfs $TST_FS_TYPE $TST_DEV_FS_OPTS $TST_DEVICE $TST_DEV_EXTRA_OPTS
+	fi
+
+	if [ "$TST_MOUNT_DEVICE" = 1 ]; then
+		tst_mount
+		TST_MOUNT_FLAG=1
+	fi
+}
+
+_tst_run_tcases_per_fs()
+{
+	for _tst_fs in $(tst_supported_fs); do
+		tst_res TINFO "Testing on $_tst_fs"
+		TST_FS_TYPE="$_tst_fs"
+		_prepare_device
+		_tst_run_iterations
+	done
+}
+
 tst_run()
 {
 	local _tst_i
 	local _tst_data
+	local _tst_fs
 	local _tst_max
 	local _tst_name
 
 	if [ -n "$TST_TEST_PATH" ]; then
 		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s/[="} \t\/:`'"'"'].*//'); do
 			case "$_tst_i" in
-			DISABLE_APPARMOR|DISABLE_SELINUX);;
+			ALL_FILESYSTEMS|DISABLE_APPARMOR|DISABLE_SELINUX);;
 			SETUP|CLEANUP|TESTFUNC|ID|CNT|MIN_KVER);;
 			OPTS|USAGE|PARSE_ARGS|POS_ARGS);;
 			NEEDS_ROOT|NEEDS_TMPDIR|TMPDIR|NEEDS_DEVICE|DEVICE);;
@@ -668,12 +679,23 @@ tst_run()
 			tst_brk TCONF "test requires kernel $TST_MIN_KVER+"
 	fi
 
-	_tst_setup_timer
+	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
 
+	[ "$TST_ALL_FILESYSTEMS" = 1 ] && TST_MOUNT_DEVICE=1
 	[ "$TST_MOUNT_DEVICE" = 1 ] && TST_FORMAT_DEVICE=1
 	[ "$TST_FORMAT_DEVICE" = 1 ] && TST_NEEDS_DEVICE=1
 	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
+	if [ "$TST_NEEDS_DEVICE" = 1 -a -z "$TST_MOUNT_FLAG" ]; then
+		TST_DEVICE=$(tst_device acquire)
+
+		if [ ! -b "$TST_DEVICE" -o $? -ne 0 ]; then
+			unset TST_DEVICE
+			tst_brk TBROK "Failed to acquire device"
+		fi
+		TST_DEVICE_FLAG=1
+	fi
+
 	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
 		if [ -z "$TMPDIR" ]; then
 			export TMPDIR="/tmp"
@@ -684,35 +706,30 @@ tst_run()
 		chmod 777 "$TST_TMPDIR"
 
 		TST_STARTWD=$(pwd)
-
 		cd "$TST_TMPDIR"
 	fi
 
-	TST_MNTPOINT="${TST_MNTPOINT:-$PWD/mntpoint}"
-	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
-
-		TST_DEVICE=$(tst_device acquire)
+	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
 
-		if [ ! -b "$TST_DEVICE" -o $? -ne 0 ]; then
-			unset TST_DEVICE
-			tst_brk TBROK "Failed to acquire device"
-		fi
+	TST_MNTPOINT="${TST_MNTPOINT:-$PWD/mntpoint}"
+	[ -z "$TST_ALL_FILESYSTEMS" ] && _prepare_device
 
-		TST_DEVICE_FLAG=1
+	if [ -n "$TST_ALL_FILESYSTEMS" ]; then
+		_tst_run_tcases_per_fs
+	else
+		_tst_run_iterations
 	fi
 
-	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
+	_tst_do_exit
+}
 
-	if [ "$TST_FORMAT_DEVICE" = 1 ]; then
-		tst_mkfs $TST_FS_TYPE $TST_DEV_FS_OPTS $TST_DEVICE $TST_DEV_EXTRA_OPTS
-	fi
+_tst_run_iterations()
+{
+	local _tst_i=$TST_ITERATIONS
 
-	if [ "$TST_MOUNT_DEVICE" = 1 ]; then
-		tst_mount
-		TST_MOUNT_FLAG=1
-	fi
+	[ "$TST_NEEDS_TMPDIR" = 1 ] && cd "$TST_TMPDIR"
 
-	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
+	_tst_setup_timer
 
 	if [ -n "$TST_SETUP" ]; then
 		if command -v $TST_SETUP >/dev/null 2>/dev/null; then
@@ -724,7 +741,7 @@ tst_run()
 	fi
 
 	#TODO check that test reports some results for each test function call
-	while [ $TST_ITERATIONS -gt 0 ]; do
+	while [ $_tst_i -gt 0 ]; do
 		if [ -n "$TST_TEST_DATA" ]; then
 			tst_require_cmds cut tr wc
 			_tst_max=$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc -c) +1))
@@ -735,9 +752,22 @@ tst_run()
 		else
 			_tst_run_tests
 		fi
-		TST_ITERATIONS=$((TST_ITERATIONS-1))
+		_tst_i=$((_tst_i-1))
 	done
-	_tst_do_exit
+
+	if [ -n "$TST_DO_CLEANUP" -a -n "$TST_CLEANUP" -a -z "$TST_NO_CLEANUP" ]; then
+		if command -v $TST_CLEANUP >/dev/null 2>/dev/null; then
+			$TST_CLEANUP
+		else
+			tst_res TWARN "TST_CLEANUP=$TST_CLEANUP declared, but function not defined (or cmd not found)"
+		fi
+	fi
+
+	if [ "$TST_MOUNT_DEVICE" = 1 -a "$TST_MOUNT_FLAG" = 1 ]; then
+		tst_umount
+	fi
+
+	_tst_cleanup_timer
 }
 
 _tst_run_tests()
-- 
2.36.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
