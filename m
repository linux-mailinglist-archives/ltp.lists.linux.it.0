Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FA7589B8F
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 14:20:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D7113C9338
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Aug 2022 14:20:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 80D9E3C25DD
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 14:19:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 04A5E1400F8D
 for <ltp@lists.linux.it>; Thu,  4 Aug 2022 14:19:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D011820FBA;
 Thu,  4 Aug 2022 12:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1659615591; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+gPVfN5sCCN3DhRyP0WHLcNJLPiTToErZjbvWyBTcJM=;
 b=0DCqaAxE1siN47+E9apyXYc5uKQoutZTa2Zq1XU25O+g4eHhXCc1zBgCST41VkgW5CeQtK
 76o17o+F3WyqzCrVSc2Y5Ahy0WPWLTHmgIjKnHT9kI9j1dOJbH3dtRQneJKdHw9424q+IA
 SrNlXGyiI+8+uCEN+aOp4oD/LYi0LKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1659615591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+gPVfN5sCCN3DhRyP0WHLcNJLPiTToErZjbvWyBTcJM=;
 b=L7+HdwUH4/wKOeQmkZCZpOt3PUobPStlMOkGDqQd+L9OiPQJmM9NOEqFTWc1cm6G5D8GCE
 6HsJP8md0kEspVDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C894613A94;
 Thu,  4 Aug 2022 12:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ayLYLGa562L2PQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 04 Aug 2022 12:19:50 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  4 Aug 2022 14:19:36 +0200
Message-Id: <20220804121946.19564-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v3 00/10] shell: nfs: $TST_ALL_FILESYSTEMS
 (.all_filesystems)
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
Cc: automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

changes v2->v3:
* add $TST_SKIP_FILESYSTEMS implementation
* various fixes for tst_test.sh + tests
  - tst_test.sh: Fix tst_mkfs() for tmpfs

Diff to v2:

diff --git doc/shell-test-api.txt doc/shell-test-api.txt
index 93073be13..ecadb8e32 100644
--- doc/shell-test-api.txt
+++ doc/shell-test-api.txt
@@ -200,6 +200,8 @@ simply by setting right '$TST_FOO'.
 |=============================================================================
 | Variable name            | Action done
 | 'TST_ALL_FILESYSTEMS'    | Testing on all available filesystems (tst_test.all_filesystems equivalent).
+                             When 'TST_SKIP_FILESYSTEMS' any listed filesystem is not
+                             included in the resulting list of supported filesystems.
 | 'TST_DEV_EXTRA_OPTS'     | Pass extra 'mkfs' options _after_ device name,
                              to 'tst_mkfs', use with 'TST_FORMAT_DEVICE=1'.
 | 'TST_DEV_FS_OPTS'        | Pass 'mkfs' options _before_ the device name,
@@ -230,6 +232,8 @@ simply by setting right '$TST_FOO'.
 | 'TST_NEEDS_KCONFIGS'     | Checks kernel kconfigs support for the test (see below).
 | 'TST_NEEDS_KCONFIGS_IFS' | Used for splitting '$TST_NEEDS_KCONFIGS' variable,
                              default value is comma, it only supports single character.
+| 'TST_SKIP_FILESYSTEMS'   | Comma separated list of filesystems on which test will be skipped
+                             (tst_test.skip_filesystems equivalent).
 | 'TST_TIMEOUT'            | Maximum timeout set for the test in sec. Must be int >= 1,
                              or -1 (special value to disable timeout), default is 300.
                              Variable is meant be set in tests, not by user.
diff --git include/tst_fs.h include/tst_fs.h
index 8159b99eb..2fe97f174 100644
--- include/tst_fs.h
+++ include/tst_fs.h
@@ -182,6 +182,16 @@ enum tst_fs_impl {
  */
 enum tst_fs_impl tst_fs_is_supported(const char *fs_type);
 
+/*
+ * Check filesystem support (@see tst_fs_is_supported()), but consider also
+ * filesystems to skip.
+ *
+ * @fs_type A filesystem name to check the support for.
+ * @skiplist A NULL terminated array of filesystems to skip.
+ */
+enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
+					      *const *skiplist);
+
 /*
  * Returns NULL-terminated array of kernel-supported filesystems.
  *
diff --git lib/newlib_tests/shell/tst_mount_device.sh lib/newlib_tests/shell/tst_mount_device.sh
index c8f185626..561f878d2 100755
--- lib/newlib_tests/shell/tst_mount_device.sh
+++ lib/newlib_tests/shell/tst_mount_device.sh
@@ -5,7 +5,7 @@
 TST_MOUNT_DEVICE=1
 TST_FS_TYPE=ext4
 TST_TESTFUNC=test
-TST_CNT=2
+TST_CNT=3
 
 test1()
 {
@@ -17,5 +17,10 @@ test2()
 	EXPECT_PASS "grep '$TST_MNTPOINT $TST_FS_TYPE' /proc/mounts"
 }
 
+test3()
+{
+	tst_brk TCONF "quit early to test early tst_umount"
+}
+
 . tst_test.sh
 tst_run
diff --git lib/newlib_tests/shell/tst_mount_device_tmpfs.sh lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
new file mode 100755
index 000000000..36a78bc85
--- /dev/null
+++ lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
+
+TST_MOUNT_DEVICE=1
+TST_FS_TYPE=tmpfs
+TST_TESTFUNC=test
+
+test()
+{
+	EXPECT_PASS "cd $TST_MNTPOINT"
+}
+
+. tst_test.sh
+tst_run
diff --git lib/newlib_tests/shell/tst_skip_filesystems.sh lib/newlib_tests/shell/tst_skip_filesystems.sh
new file mode 100755
index 000000000..dd57d6b42
--- /dev/null
+++ lib/newlib_tests/shell/tst_skip_filesystems.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
+
+TST_MOUNT_DEVICE=1
+TST_FS_TYPE=ext4
+TST_TESTFUNC=test
+TST_SKIP_FILESYSTEMS="btrfs,ext2,ext3,xfs,vfat,exfat,ntfs,tmpfs"
+TST_CNT=3
+
+test1()
+{
+	EXPECT_PASS "cd $TST_MNTPOINT"
+}
+
+test2()
+{
+	EXPECT_PASS "grep '$TST_MNTPOINT $TST_FS_TYPE' /proc/mounts"
+}
+
+test3()
+{
+	local fs fs_skip
+
+	fs=$(grep "$TST_MNTPOINT $TST_FS_TYPE" /proc/mounts | cut -d ' ' -f3)
+	EXPECT_PASS "[ '$fs' = '$TST_FS_TYPE' ]"
+
+	for fs_skip in $TST_SKIP_FILESYSTEMS; do
+		EXPECT_FAIL "[ $fs = $fs_skip ]"
+	done
+}
+
+. tst_test.sh
+tst_run
diff --git lib/newlib_tests/shell/tst_skip_filesystems_skip.sh lib/newlib_tests/shell/tst_skip_filesystems_skip.sh
new file mode 100755
index 000000000..0d291a0a0
--- /dev/null
+++ lib/newlib_tests/shell/tst_skip_filesystems_skip.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2022 Petr Vorel <pvorel@suse.cz>
+
+TST_MOUNT_DEVICE=1
+TST_FS_TYPE=ext4
+TST_TESTFUNC=test
+TST_SKIP_FILESYSTEMS="ext4"
+
+test()
+{
+	tst_res TFAIL "test should be skipped with TCONF"
+}
+
+. tst_test.sh
+tst_run
diff --git lib/tst_supported_fs_types.c lib/tst_supported_fs_types.c
index 9726d193a..8c9379c1b 100644
--- lib/tst_supported_fs_types.c
+++ lib/tst_supported_fs_types.c
@@ -134,6 +134,24 @@ enum tst_fs_impl tst_fs_is_supported(const char *fs_type)
 	return TST_FS_UNSUPPORTED;
 }
 
+enum tst_fs_impl tst_fs_is_supported_skiplist(const char *fs_type, const char
+					      *const *skiplist)
+{
+	int ret;
+
+	ret = tst_fs_is_supported(fs_type);
+
+	if (!ret)
+		return ret;
+
+	if (tst_fs_in_skiplist(fs_type, skiplist)) {
+		tst_brk(TCONF, "%s is not supported by the test",
+			fs_type);
+	}
+
+	return ret;
+}
+
 const char **tst_get_supported_fs_types(const char *const *skiplist)
 {
 	unsigned int i, j = 0;
diff --git testcases/lib/tst_supported_fs.c testcases/lib/tst_supported_fs.c
index 43eac194f..75945c809 100644
--- testcases/lib/tst_supported_fs.c
+++ testcases/lib/tst_supported_fs.c
@@ -5,42 +5,74 @@
  */
 
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
+#define SKIP_DELIMITER ','
+
 #define TST_NO_DEFAULT_MAIN
 #include "tst_test.h"
 #include "tst_fs.h"
 
 static void usage(void)
 {
-	fprintf(stderr, "Usage: tst_supported_fs [fs_type]\n");
+	fprintf(stderr, "Usage: tst_supported_fs [-s skip_list] [fs_type]\n");
 	fprintf(stderr, "   If fs_type is supported, return 0\n");
 	fprintf(stderr, "   If fs_type isn't supported, return 1\n");
 	fprintf(stderr, "   If fs_type isn't specified, print the list of supported filesystems\n");
 	fprintf(stderr, "   fs_type - a specified filesystem type\n");
+	fprintf(stderr, "   skip_list - filesystems to skip, delimiter: '%c'\n",
+			SKIP_DELIMITER);
 }
 
 int main(int argc, char *argv[])
 {
-	const char *skiplist[] = {"tmpfs", NULL};
 	const char *const *filesystems;
-	int i;
+	int i, ret, cnt = 1;
+	char **skiplist = NULL;
+	char *fs;
 
-	if (argc > 2) {
-		fprintf(stderr, "Can't specify multiple fs_type\n");
-		usage();
-		return 2;
+	while ((ret = getopt(argc, argv, "hs:"))) {
+		if (ret < 0)
+			break;
+
+		switch (ret) {
+		case '?':
+			return 1;
+
+		case 'h':
+			usage();
+			return 0;
+
+		case 's':
+			fs = optarg;
+			for (i = 0; fs[i]; i++) {
+				if (optarg[i] == SKIP_DELIMITER)
+					cnt++;
+			}
+			skiplist = malloc(++cnt * sizeof(char *));
+			if (!skiplist) {
+				fprintf(stderr, "malloc() failed\n");
+				return 1;
+			}
+
+			fs = optarg;
+			for (i = 0; i < cnt; i++)
+				skiplist[i] = strtok_r(fs, TST_TO_STR(SKIP_DELIMITER), &fs);
+			break;
+		}
 	}
 
-	if (argv[1] && !strcmp(argv[1], "-h")) {
+	if (argc - optind > 1) {
+		fprintf(stderr, "Can't specify multiple fs_type\n");
 		usage();
-		return 0;
+		return 2;
 	}
 
-	if (argv[1])
-		return !tst_fs_is_supported(argv[1]);
+	if (optind < argc)
+		return !tst_fs_is_supported_skiplist(argv[optind], (const char * const*)skiplist);
 
-	filesystems = tst_get_supported_fs_types(skiplist);
+	filesystems = tst_get_supported_fs_types((const char * const*)skiplist);
 	for (i = 0; filesystems[i]; i++)
 		printf("%s\n", filesystems[i]);
 
diff --git testcases/lib/tst_test.sh testcases/lib/tst_test.sh
index 54b505e44..b679339a0 100644
--- testcases/lib/tst_test.sh
+++ testcases/lib/tst_test.sh
@@ -28,12 +28,13 @@ fi
 trap "tst_brk TBROK 'test interrupted'" INT
 trap "unset _tst_setup_timer_pid; tst_brk TBROK 'test terminated'" TERM
 
-# FIXME: debug called more times => check things moved out of it
 _tst_do_exit()
 {
 	local ret=0
 	TST_DO_EXIT=1
 
+	[ "$TST_MOUNT_FLAG" = 1 ] && tst_umount
+
 	if [ "$TST_NEEDS_DEVICE" = 1 -a "$TST_DEVICE_FLAG" = 1 ]; then
 		if ! tst_device release "$TST_DEVICE"; then
 			tst_res TWARN "Failed to release device '$TST_DEVICE'"
@@ -50,6 +51,8 @@ _tst_do_exit()
 		rm $LTP_IPC_PATH
 	fi
 
+	_tst_cleanup_timer
+
 	if [ $TST_FAIL -gt 0 ]; then
 		ret=$((ret|1))
 	fi
@@ -338,6 +341,11 @@ tst_mkfs()
 
 	opts="$@"
 
+	if [ "$fs_type" = tmpfs ]; then
+		tst_res TINFO "Skipping mkfs for TMPFS filesystem"
+		return
+	fi
+
 	if [ -z "$opts" ]; then
 		if [ "$TST_NEEDS_DEVICE" != 1 ]; then
 			tst_brk "Using default parameters in tst_mkfs requires TST_NEEDS_DEVICE=1"
@@ -461,6 +469,7 @@ LTPROOT              Prefix for installed LTP (default: /opt/ltp)
 LTP_COLORIZE_OUTPUT  Force colorized output behaviour (y/1 always, n/0: never)
 LTP_DEV              Path to the block device to be used (for .needs_device)
 LTP_DEV_FS_TYPE      Filesystem used for testing (default: ext2)
+LTP_SINGLE_FS_TYPE   Testing only - specifies filesystem instead all supported (for TST_ALL_FILESYSTEMS=1)
 LTP_TIMEOUT_MUL      Timeout multiplier (must be a number >=1, ceiled to int)
 TMPDIR               Base directory for template directory (for .needs_tmpdir, default: /tmp)
 EOF
@@ -616,10 +625,9 @@ _prepare_device()
 
 _tst_run_tcases_per_fs()
 {
-	for _tst_fs in $(tst_supported_fs); do
-		tst_res TINFO "Testing on $_tst_fs"
+	for _tst_fs in $(tst_supported_fs -s "$TST_SKIP_FILESYSTEMS"); do
+		tst_res TINFO "=== Testing on $_tst_fs ==="
 		TST_FS_TYPE="$_tst_fs"
-		_prepare_device
 		_tst_run_iterations
 	done
 }
@@ -631,9 +639,11 @@ tst_run()
 	local _tst_fs
 	local _tst_max
 	local _tst_name
+	local _tst_pattern='[='\''"} \t\/:`$\;].*'
+	local ret
 
 	if [ -n "$TST_TEST_PATH" ]; then
-		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed 's/.*TST_//; s/[='\''"} \t\/:`].*//'); do
+		for _tst_i in $(grep '^[^#]*\bTST_' "$TST_TEST_PATH" | sed "s/.*TST_//; s/$_tst_pattern//"); do
 			case "$_tst_i" in
 			ALL_FILESYSTEMS|DISABLE_APPARMOR|DISABLE_SELINUX);;
 			SETUP|CLEANUP|TESTFUNC|ID|CNT|MIN_KVER);;
@@ -649,11 +659,12 @@ tst_run()
 			CHECKPOINT_WAIT|CHECKPOINT_WAKE);;
 			CHECKPOINT_WAKE2|CHECKPOINT_WAKE_AND_WAIT);;
 			DEV_EXTRA_OPTS|DEV_FS_OPTS|FORMAT_DEVICE|MOUNT_DEVICE);;
+			SKIP_FILESYSTEMS);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
 		done
 
-		for _tst_i in $(grep '^[^#]*\b_tst_' "$TST_TEST_PATH" | sed 's/.*_tst_//; s/[="} \t\/:`].*//'); do
+		for _tst_i in $(grep '^[^#]*\b_tst_' "$TST_TEST_PATH" | sed "s/.*_tst_//; s/$_tst_pattern//"); do
 			tst_res TWARN "Private variable or function _tst_$_tst_i used!"
 		done
 	fi
@@ -687,6 +698,12 @@ tst_run()
 	[ "$TST_FORMAT_DEVICE" = 1 ] && TST_NEEDS_DEVICE=1
 	[ "$TST_NEEDS_DEVICE" = 1 ] && TST_NEEDS_TMPDIR=1
 
+	if [ "$TST_ALL_FILESYSTEMS" != 1 ]; then
+		tst_supported_fs -s "$TST_SKIP_FILESYSTEMS" $TST_FS_TYPE
+		ret=$?
+		[ $ret -ne 0 ] && return $ret
+	fi
+
 	if [ "$TST_NEEDS_DEVICE" = 1 ]; then
 		TST_DEVICE=$(tst_device acquire)
 
@@ -713,9 +730,8 @@ tst_run()
 	[ -n "$TST_NEEDS_CHECKPOINTS" ] && _tst_init_checkpoints
 
 	TST_MNTPOINT="${TST_MNTPOINT:-$PWD/mntpoint}"
-	[ -z "$TST_ALL_FILESYSTEMS" ] && _prepare_device
 
-	if [ -n "$TST_ALL_FILESYSTEMS" ]; then
+	if [ "$TST_ALL_FILESYSTEMS" = 1 ]; then
 		_tst_run_tcases_per_fs
 	else
 		_tst_run_iterations
@@ -727,9 +743,12 @@ tst_run()
 _tst_run_iterations()
 {
 	local _tst_i=$TST_ITERATIONS
+	local _tst_j
 
 	[ "$TST_NEEDS_TMPDIR" = 1 ] && cd "$TST_TMPDIR"
 
+	_prepare_device
+
 	_tst_setup_timer
 
 	if [ -n "$TST_SETUP" ]; then
@@ -746,8 +765,8 @@ _tst_run_iterations()
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
@@ -766,9 +785,8 @@ _tst_run_iterations()
 
 	if [ "$TST_MOUNT_FLAG" = 1 ]; then
 		tst_umount
+		TST_MOUNT_FLAG=
 	fi
-
-	_tst_cleanup_timer
 }
 
 _tst_run_tests()
diff --git testcases/misc/lvm/generate_lvm_runfile.sh testcases/misc/lvm/generate_lvm_runfile.sh
index 72b286a69..843dd6bb8 100755
--- testcases/misc/lvm/generate_lvm_runfile.sh
+++ testcases/misc/lvm/generate_lvm_runfile.sh
@@ -16,7 +16,7 @@ generate_runfile()
 	trap 'tst_brk TBROK "Cannot create LVM runfile"' ERR
 	INFILE="$LTPROOT/testcases/data/lvm/runfile.tpl"
 	OUTFILE="$LTPROOT/runtest/lvm.local"
-	FS_LIST=`tst_supported_fs`
+	FS_LIST=$(tst_supported_fs -s tmpfs)
 	echo -n "" >"$OUTFILE"
 
 	for fsname in $FS_LIST; do
diff --git testcases/misc/lvm/prepare_lvm.sh testcases/misc/lvm/prepare_lvm.sh
index d3ae4b23f..29f386df8 100755
--- testcases/misc/lvm/prepare_lvm.sh
+++ testcases/misc/lvm/prepare_lvm.sh
@@ -70,7 +70,7 @@ prepare_mounts()
 
 prepare_lvm()
 {
-	FS_LIST=`tst_supported_fs | sort -u`
+	FS_LIST=$(tst_supported_fs -s tmpfs | sort -u)
 	ROD mkdir -p "$LVM_TMPDIR"
 	ROD mkdir -p "$LVM_IMGDIR"
 	chmod 777 "$LVM_TMPDIR"
diff --git testcases/network/nfs/nfs_stress/nfs_lib.sh testcases/network/nfs/nfs_stress/nfs_lib.sh
index a6557177b..b9872bb31 100644
--- testcases/network/nfs/nfs_stress/nfs_lib.sh
+++ testcases/network/nfs/nfs_stress/nfs_lib.sh
@@ -8,6 +8,7 @@ VERSION=${VERSION:=3}
 NFILES=${NFILES:=1000}
 SOCKET_TYPE="${SOCKET_TYPE:-udp}"
 NFS_TYPE=${NFS_TYPE:=nfs}
+TST_SKIP_FILESYSTEMS="ntfs,vfat"
 
 nfs_usage()
 {
@@ -205,7 +206,9 @@ nfs_cleanup()
 		n=$(( n + 1 ))
 	done
 
-	systemctl restart nfs-server
+	restart_daemon nfs-server
+	tst_sleep 500ms
 }
 
+. daemonlib.sh
 . tst_net.sh

Petr Vorel (10):
  tst_test.sh: Fix tst_mkfs() for tmpfs
  tst_device: Add clear command
  tst_test.sh: Allow $ ; after whitelisted variable
  tst_mount_device.sh: Cover early tst_umount call
  tst_supported_fs: Implement skip list
  tst_supported_fs: Support skip list when query single fs
  shell: Add $TST_SKIP_FILESYSTEMS + tests
  tst_test.sh: Add $TST_ALL_FILESYSTEMS
  shell: Add test for TST_ALL_FILESYSTEMS=1
  nfs: Use TST_ALL_FILESYSTEMS=1

 doc/shell-test-api.txt                        |   5 +
 include/tst_fs.h                              |  10 ++
 lib/newlib_tests/shell/tst_all_filesystems.sh |  27 ++++
 lib/newlib_tests/shell/tst_mount_device.sh    |   7 +-
 .../shell/tst_mount_device_tmpfs.sh           |  15 +++
 .../shell/tst_skip_filesystems.sh             |  34 +++++
 .../shell/tst_skip_filesystems_skip.sh        |  16 +++
 lib/tst_supported_fs_types.c                  |  18 +++
 testcases/lib/tst_device.c                    |  20 ++-
 testcases/lib/tst_supported_fs.c              |  56 ++++++--
 testcases/lib/tst_test.sh                     | 126 ++++++++++++------
 testcases/misc/lvm/generate_lvm_runfile.sh    |   2 +-
 testcases/misc/lvm/prepare_lvm.sh             |   2 +-
 testcases/network/nfs/nfs_stress/nfs_lib.sh   |  28 ++--
 14 files changed, 299 insertions(+), 67 deletions(-)
 create mode 100755 lib/newlib_tests/shell/tst_all_filesystems.sh
 create mode 100755 lib/newlib_tests/shell/tst_mount_device_tmpfs.sh
 create mode 100755 lib/newlib_tests/shell/tst_skip_filesystems.sh
 create mode 100755 lib/newlib_tests/shell/tst_skip_filesystems_skip.sh

-- 
2.37.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
