Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E155B3A92
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:20:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 912023CAA54
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Sep 2022 16:20:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7A4923CAA66
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:18:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 012291A0145B
 for <ltp@lists.linux.it>; Fri,  9 Sep 2022 16:18:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 31B1221F3D;
 Fri,  9 Sep 2022 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662733132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EM22nyPSQwdP0ULPy3V122GNB4FtE6z3Ue7qZCN/V+Y=;
 b=GzBLQ6Yqma10VGps7miAq6Kv1KXneHzasuLpjxdxEL8EKdaIXHQ2dWlIVKdtGkRbnXvj1S
 tt/VVi1G8DVr2SylrtdZUyuJPInv4b5DjmGHLeV0riXkA/VhR+VvvgXE1RLNQ00WhguZ8J
 H+HtRIl1KF1jwMejjrOxgh4SgIEH82Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662733132;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EM22nyPSQwdP0ULPy3V122GNB4FtE6z3Ue7qZCN/V+Y=;
 b=MWSoubDNQ0aV1i7DHEMvygzf8bd1ZtIqi/a09+o9WRA8um2DZ5oZqe3dJzv0tCRDsAXBYu
 ULkPkIsSQt4my5Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEDFB13A93;
 Fri,  9 Sep 2022 14:18:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aASdLUpLG2NmWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 09 Sep 2022 14:18:50 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  9 Sep 2022 16:18:38 +0200
Message-Id: <20220909141840.18327-9-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909141840.18327-1-pvorel@suse.cz>
References: <20220909141840.18327-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v5 08/10] tst_test.sh: Add $TST_ALL_FILESYSTEMS
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

$TST_ALL_FILESYSTEMS is shell API equivalent of .all_filesystems
from C API.

Improve also $TST_SKIP_FILESYSTEMS to behave like .skip_filesystems.

Reviewed-by: Li Wang <liwang@redhat.com>
Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v4->v5:
* tst_test.sh: fix quiting test when no filesystem supported

 doc/shell-test-api.txt    |   9 ++-
 testcases/lib/tst_test.sh | 139 +++++++++++++++++++++++++-------------
 2 files changed, 101 insertions(+), 47 deletions(-)

diff --git a/doc/shell-test-api.txt b/doc/shell-test-api.txt
index e16080061..c92d7f4b4 100644
--- a/doc/shell-test-api.txt
+++ b/doc/shell-test-api.txt
@@ -199,6 +199,10 @@ simply by setting right '$TST_FOO'.
 [options="header"]
 |=============================================================================
 | Variable name            | Action done
+| 'TST_ALL_FILESYSTEMS'    | Testing on all available filesystems
+                             ('tst_test.all_filesystems' equivalent).
+                             When 'TST_SKIP_FILESYSTEMS' any listed filesystem is not
+                             included in the resulting list of supported filesystems.
 | 'TST_DEV_EXTRA_OPTS'     | Pass extra 'mkfs' options _after_ device name,
                              to 'tst_mkfs', use with 'TST_FORMAT_DEVICE=1'.
 | 'TST_DEV_FS_OPTS'        | Pass 'mkfs' options _before_ the device name,
@@ -209,7 +213,10 @@ simply by setting right '$TST_FOO'.
                              Implies 'TST_NEEDS_DEVICE=1' (no need to set it).
 | 'TST_DEVICE'             | Block device name for 'tst_mount' and 'tst_mkfs', see
                              https://github.com/linux-test-project/ltp/wiki/Shell-Test-API#formatting-device-with-a-filesystem[Formatting device with a filesystem].
-| 'TST_FS_TYPE'            | Override the default filesystem to be used.
+| 'TST_FS_TYPE'            | Override the default filesystem to be used. Also
+                             contains currently used filesystem during looping
+                             filesystems in 'TST_ALL_FILESYSTEMS=1'
+                             ('tst_device->fs_type' equivalent).
 | 'TST_FS_TYPE_FUSE'       | 1 if mounted 'TST_FS_TYPE' filesystem on
                              'TST_DEVICE' device is FUSE.
 | 'TST_MNTPOINT'           | Holds path to mountpoint used in 'tst_mount', see
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index 78dbfc1ce..de4599625 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -17,10 +17,6 @@ export TST_ITERATIONS=1
 export TST_TMPDIR_RHOST=0
 export TST_LIB_LOADED=1
 
-if [ -z "$TST_FS_TYPE" ]; then
-	export TST_FS_TYPE="${LTP_DEV_FS_TYPE:-ext2}"
-fi
-
 . tst_ansi_color.sh
 . tst_security.sh
 
@@ -33,17 +29,7 @@ _tst_do_exit()
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
-	if [ "$TST_MOUNT_FLAG" = 1 ]; then
-		tst_umount
-	fi
+	[ "$TST_MOUNT_FLAG" = 1 ] && tst_umount
 
 	if [ "$TST_NEEDS_DEVICE" = 1 -a "$TST_DEVICE_FLAG" = 1 ]; then
 		if ! tst_device release "$TST_DEVICE"; then
@@ -287,7 +273,7 @@ TST_CHECKPOINT_WAKE_AND_WAIT()
 
 tst_mount()
 {
-	local mnt_opt mnt_err
+	local mnt_opt mnt_err mnt_real
 
 	if [ -n "$TST_FS_TYPE" ]; then
 		mnt_opt="-t $TST_FS_TYPE"
@@ -490,6 +476,7 @@ LTPROOT              Prefix for installed LTP (default: /opt/ltp)
 LTP_COLORIZE_OUTPUT  Force colorized output behaviour (y/1 always, n/0: never)
 LTP_DEV              Path to the block device to be used (for .needs_device)
 LTP_DEV_FS_TYPE      Filesystem used for testing (default: ext2)
+LTP_SINGLE_FS_TYPE   Testing only - specifies filesystem instead all supported (for TST_ALL_FILESYSTEMS=1)
 LTP_TIMEOUT_MUL      Timeout multiplier (must be a number >=1, ceiled to int)
 TMPDIR               Base directory for template directory (for .needs_tmpdir, default: /tmp)
 EOF
@@ -631,10 +618,44 @@ _tst_init_checkpoints()
 	export LTP_IPC_PATH
 }
 
+_prepare_device()
+{
+	if [ "$TST_FORMAT_DEVICE" = 1 ]; then
+		tst_device clear "$TST_DEVICE"
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
+	local fs
+	local filesystems
+
+	filesystems="$(tst_supported_fs -s "$TST_SKIP_FILESYSTEMS")"
+	if [ $? -ne 0 ]; then
+		tst_brk TCONF "There are no supported filesystems or all skipped"
+	fi
+
+	for fs in $filesystems; do
+		tst_res TINFO "=== Testing on $fs ==="
+		TST_FS_TYPE="$fs"
+		if [ "$TST_FS_TYPE" != "$TST_FS_TYPE_FUSE" ]; then
+			 tst_res TINFO "filesystem type in /proc/mounts: '$TST_FS_TYPE_FUSE'"
+		fi
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
 	local _tst_pattern='[='\''"} \t\/:`$\;].*'
@@ -643,7 +664,7 @@ tst_run()
 	if [ -n "$TST_TEST_PATH" ]; then
 		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed "s/.*TST_//; s/$_tst_pattern//"); do
 			case "$_tst_i" in
-			DISABLE_APPARMOR|DISABLE_SELINUX);;
+			ALL_FILESYSTEMS|DISABLE_APPARMOR|DISABLE_SELINUX);;
 			SETUP|CLEANUP|TESTFUNC|ID|CNT|MIN_KVER);;
 			OPTS|USAGE|PARSE_ARGS|POS_ARGS);;
 			NEEDS_ROOT|NEEDS_TMPDIR|TMPDIR|NEEDS_DEVICE|DEVICE);;
@@ -689,16 +710,33 @@ tst_run()
 			tst_brk TCONF "test requires kernel $TST_MIN_KVER+"
 	fi
 
-	tst_supported_fs -s "$TST_SKIP_FILESYSTEMS" $TST_FS_TYPE
-	ret=$?
-	[ $ret -ne 0 ] && return $ret
-
-	_tst_setup_timer
+	[ -n "$TST_NEEDS_MODULE" ] && tst_require_module "$TST_NEEDS_MODULE"
 
+	[ "$TST_ALL_FILESYSTEMS" = 1 ] && TST_MOUNT_DEVICE=1
 	[ "$TST_MOUNT_DEVICE" = 1 ] && TST_FORMAT_DEVICE=1
 	[ "$TST_FORMAT_DEVICE" = 1 ] && TST_NEEDS_DEVICE=1
 	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
+	if [ "$TST_ALL_FILESYSTEMS" != 1 ]; then
+		if ! tst_supported_fs -s "$TST_SKIP_FILESYSTEMS" $TST_FS_TYPE > /dev/null; then
+			tst_brk TCONF "$TST_FS_TYPE is not supported"
+		fi
+	fi
+
+	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
+		TST_DEVICE=$(tst_device acquire)
+
+		if [ ! -b "$TST_DEVICE" -o $? -ne 0 ]; then
+			unset TST_DEVICE
+			tst_brk TBROK "Failed to acquire device"
+		fi
+		TST_DEVICE_FLAG=1
+
+		if [ -z "$TST_FS_TYPE" ]; then
+			export TST_FS_TYPE="${LTP_DEV_FS_TYPE:-ext2}"
+		fi
+	fi
+
 	if [ "$TST_NEEDS_TMPDIR" = 1 ]; then
 		if [ -z "$TMPDIR" ]; then
 			export TMPDIR="/tmp"
@@ -709,35 +747,32 @@ tst_run()
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
 
-		TST_DEVICE_FLAG=1
+	if [ "$TST_ALL_FILESYSTEMS" = 1 ]; then
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
+	local _tst_j
 
-	if [ "$TST_MOUNT_DEVICE" = 1 ]; then
-		tst_mount
-		TST_MOUNT_FLAG=1
-	fi
+	[ "$TST_NEEDS_TMPDIR" = 1 ] && cd "$TST_TMPDIR"
 
-	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
+	_prepare_device
+
+	_tst_setup_timer
 
 	if [ -n "$TST_SETUP" ]; then
 		if command -v $TST_SETUP >/dev/null 2>/dev/null; then
@@ -749,20 +784,32 @@ tst_run()
 	fi
 
 	#TODO check that test reports some results for each test function call
-	while [ $TST_ITERATIONS -gt 0 ]; do
+	while [ $_tst_i -gt 0 ]; do
 		if [ -n "$TST_TEST_DATA" ]; then
 			tst_require_cmds cut tr wc
 			_tst_max=$(( $(echo $TST_TEST_DATA | tr -cd "$TST_TEST_DATA_IFS" | wc -c) +1))
-			for _tst_i in $(seq $_tst_max); do
-				_tst_data="$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$_tst_i)"
+			for _tst_j in $(seq $_tst_max); do
+				_tst_data="$(echo "$TST_TEST_DATA" | cut -d"$TST_TEST_DATA_IFS" -f$_tst_j)"
 				_tst_run_tests "$_tst_data"
 			done
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
+	if [ "$TST_MOUNT_FLAG" = 1 ]; then
+		tst_umount
+		TST_MOUNT_FLAG=
+	fi
 }
 
 _tst_run_tests()
-- 
2.37.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
