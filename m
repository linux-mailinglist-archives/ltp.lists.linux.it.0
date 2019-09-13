Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C8455B1DF4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C4453C20A4
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 14:58:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A6CCE3C1860
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D0A0A251785
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 14:58:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 73112B618;
 Fri, 13 Sep 2019 12:58:31 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 13 Sep 2019 14:58:22 +0200
Message-Id: <20190913125823.17314-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190913125823.17314-1-pvorel@suse.cz>
References: <20190913125823.17314-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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

to unify shell API with C API.

TST_TIMEOUT should be set in tests only, it's equivalent of
tst_test->timeout in C API.

+ add checks requiring both TST_TIMEOUT and LTP_TIMEOUT_MUL >= 1,
that allow to set TST_TIMEOUT lower than the default 300 sec
(might be useful for some case).
LTP_TIMEOUT_MUL can be float, but that adds awk as a dependency.

+ replace LTP_TIMEOUT_MUL in memcg_stress_test.sh with TST_TIMEOUT.

+ document both variables.

Suggested-by: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/test-writing-guidelines.txt               | 83 ++++++++++++-------
 .../memcg/stress/memcg_stress_test.sh         |  2 +-
 testcases/lib/tst_test.sh                     | 36 +++++++-
 3 files changed, 86 insertions(+), 35 deletions(-)

diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
index 2d118578f..47132e9a7 100644
--- a/doc/test-writing-guidelines.txt
+++ b/doc/test-writing-guidelines.txt
@@ -488,7 +488,18 @@ before calling 'fork()' or 'clone()'. Note that the 'SAFE_FORK()' calls this
 function automatically. See 3.4 FILE buffers and fork() for explanation why is
 this needed.
 
-2.2.3 Test temporary directory
+2.2.3 Library environment variables for C
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+[options="header"]
+|=============================================================================
+| Variable name      | Action done
+| 'LTP_TIMEOUT_MUL'  | Multiply timeout, must be number >= 1 (> 1 is useful for
+                       slow machines to avoid unexpected timeout).
+                       Variable is also used in shell tests.
+|=============================================================================
+
+2.2.4 Test temporary directory
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 If '.needs_tmpdir' is set to '1' in the 'struct tst_test' unique test
@@ -500,7 +511,7 @@ IMPORTANT: Close all file descriptors (that point to files in test temporary
 	   or in the test 'cleanup()' otherwise the test may break temporary
 	   directory removal on NFS (look for "NFS silly rename").
 
-2.2.4 Safe macros
+2.2.5 Safe macros
 ^^^^^^^^^^^^^^^^^
 
 Safe macros aim to simplify error checking in test preparation. Instead of
@@ -539,7 +550,7 @@ example, do:
 See 'include/tst_safe_macros.h', 'include/tst_safe_stdio.h' and
 'include/tst_safe_file_ops.h' and 'include/tst_safe_net.h' for a complete list.
 
-2.2.5 Test specific command line options
+2.2.6 Test specific command line options
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -617,7 +628,7 @@ static struct tst_test test = {
 -------------------------------------------------------------------------------
 
 
-2.2.6 Runtime kernel version detection
+2.2.7 Runtime kernel version detection
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Testcases for newly added kernel functionality require kernel newer than a
@@ -655,7 +666,7 @@ test may be relevant even if the kernel version does not suggests so. See
 WARNING: The shell 'tst_kvercmp' maps the result into unsigned integer - the
          process exit value.
 
-2.2.7 Fork()-ing
+2.2.8 Fork()-ing
 ^^^^^^^^^^^^^^^^
 
 Be wary that if the test forks and there were messages printed by the
@@ -671,7 +682,7 @@ To avoid that you should use 'SAFE_FORK()'.
 IMPORTANT: You have to set the '.forks_child' flag in the test structure
            if your testcase forks.
 
-2.2.8 Doing the test in the child process
+2.2.9 Doing the test in the child process
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Results reported by 'tst_res()' are propagated to the parent test process via
@@ -747,7 +758,7 @@ library prepares for it and has to make sure the 'LTP_IPC_PATH' environment
 variable is passed down, then the very fist thing the program has to call in
 'main()' is 'tst_reinit()' that sets up the IPC.
 
-2.2.9 Fork() and Parent-child synchronization
+2.2.10 Fork() and Parent-child synchronization
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 As LTP tests are written for Linux, most of the tests involve fork()-ing and
@@ -826,7 +837,7 @@ The 'TST_PROCESS_STATE_WAIT()' waits until process 'pid' is in requested
 It's mostly used with state 'S' which means that process is sleeping in kernel
 for example in 'pause()' or any other blocking syscall.
 
-2.2.10 Signals and signal handlers
+2.2.11 Signals and signal handlers
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 If you need to use signal handlers, keep the code short and simple. Don't
@@ -867,14 +878,14 @@ they subsequently modify RLIMIT_CORE.
 Note that LTP library will reap any processes that test didn't reap itself,
 and report any non-zero exit code as failure.
 
-2.2.11 Kernel Modules
+2.2.12 Kernel Modules
 ^^^^^^^^^^^^^^^^^^^^^
 
 There are certain cases where the test needs a kernel part and userspace part,
 happily, LTP can build a kernel module and then insert it to the kernel on test
 start for you. See 'testcases/kernel/device-drivers/block' for details.
 
-2.2.12 Useful macros
+2.2.13 Useful macros
 ^^^^^^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -892,7 +903,7 @@ LTP_ALIGN(x, a)
 
 Aligns the x to be next multiple of a. The a must be power of 2.
 
-2.2.13 Filesystem type detection
+2.2.14 Filesystem type detection
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests are known to fail on certain filesystems (you cannot swap on TMPFS,
@@ -927,7 +938,7 @@ below:
 	}
 -------------------------------------------------------------------------------
 
-2.2.14 Thread-safety in the LTP library
+2.2.15 Thread-safety in the LTP library
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 It is safe to use library 'tst_res()' function in multi-threaded tests.
@@ -979,7 +990,7 @@ static void cleanup(void)
 -------------------------------------------------------------------------------
 
 
-2.2.15 Testing with a block device
+2.2.16 Testing with a block device
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests needs a block device (inotify tests, syscall 'EROFS' failures,
@@ -1071,7 +1082,7 @@ unsigned long tst_dev_bytes_written(const char *dev);
 This function reads test block device stat file (/sys/block/<device>/stat) and
 returns the bytes written since the last invocation of this function.
 
-2.2.16 Formatting a device with a filesystem
+2.2.17 Formatting a device with a filesystem
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -1098,7 +1109,7 @@ The extra options 'extra_opts' should either be 'NULL' if there are none, or a
 will be passed after device name. e.g: +mkfs -t ext4 -b 1024 /dev/sda1 102400+
 in this case.
 
-2.2.17 Verifying a filesystem's free space
+2.2.18 Verifying a filesystem's free space
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests have size requirements for the filesystem's free space. If these
@@ -1123,7 +1134,7 @@ The required free space is calculated by 'size * mult', e.g.
 filesystem, which '"/tmp/testfile"' is in, has 64MB free space at least, and 0
 if not.
 
-2.2.18 Files, directories and fs limits
+2.2.19 Files, directories and fs limits
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests need to know the maximum count of links to a regular file or
@@ -1198,7 +1209,7 @@ int tst_fill_file(const char *path, char pattern, size_t bs, size_t bcount);
 
 Creates/overwrites a file with specified pattern using file path.
 
-2.2.19 Getting an unused PID number
+2.2.20 Getting an unused PID number
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests require a 'PID', which is not used by the OS (does not belong to
@@ -1224,7 +1235,7 @@ int tst_get_free_pids(void);
 Returns number of unused pids in the system. Note that this number may be
 different once the call returns and should be used only for rough estimates.
 
-2.2.20 Running executables
+2.2.21 Running executables
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -1266,7 +1277,7 @@ const char *const cmd[] = { "ls", "-l", NULL };
 ...
 -------------------------------------------------------------------------------
 
-2.2.21 Measuring elapsed time and helper functions
+2.2.22 Measuring elapsed time and helper functions
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -1380,7 +1391,7 @@ between two times.
 
 NOTE: All conversions to ms and us rounds the value.
 
-2.2.22 Datafiles
+2.2.23 Datafiles
 ^^^^^^^^^^^^^^^^
 
 [source,c]
@@ -1418,7 +1429,7 @@ was installed.
 The file(s) are copied to the newly created test temporary directory which is
 set as the test working directory when the 'test()' functions is executed.
 
-2.2.23 Code path tracing
+2.2.24 Code path tracing
 ^^^^^^^^^^^^^^^^^^^^^^^^
 
 'tst_res' is a macro, so on when you define a function in one file:
@@ -1465,7 +1476,7 @@ common.h:9: FAIL: check failed
 test.c:8: INFO: do_action(arg) failed
 -------------------------------------------------------------------------------
 
-2.2.24 Tainted kernels
+2.2.25 Tainted kernels
 ^^^^^^^^^^^^^^^^^^^^^^
 
 If you need to detect, if a testcase triggers a kernel warning, bug or oops,
@@ -1507,13 +1518,13 @@ For reference to tainted kernels, see kernel documentation:
 Documentation/admin-guide/tainted-kernels.rst or
 https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html
 
-2.2.25 Checksums
+2.2.26 Checksums
 ^^^^^^^^^^^^^^^^
 
 CRC32c checksum generation is supported by LTP. In order to use it, the
 test should include "tst_checksum.h" header, then can call tst_crc32c().
 
-2.2.26 Checking kernel for the driver support
+2.2.27 Checking kernel for the driver support
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests may need specific kernel drivers, either compiled in, or built
@@ -1524,7 +1535,7 @@ first missing driver.
 Since it relies on modprobe command, the check will be skipped if the command
 itself is not available on the system.
 
-2.2.27 Saving & restoring /proc|sys values
+2.2.28 Saving & restoring /proc|sys values
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 LTP library can be instructed to save and restore value of specified
@@ -1563,7 +1574,7 @@ static struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
-2.2.28 Parsing kernel .config
+2.2.29 Parsing kernel .config
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Generally testcases should attempt to autodetect as much kernel features as
@@ -1598,7 +1609,7 @@ static struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
-2.2.29 Changing the Wall Clock Time during test execution
+2.2.30 Changing the Wall Clock Time during test execution
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 There are some tests that, for different reasons, might need to change the
@@ -1634,7 +1645,7 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
-2.2.30 Testing similar syscalls in one test
+2.2.31 Testing similar syscalls in one test
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 In some cases kernel has several very similar syscalls that do either the same
@@ -1699,7 +1710,7 @@ struct tst_test test = {
 };
 -------------------------------------------------------------------------------
 
-2.2.31 Guarded buffers
+2.2.32 Guarded buffers
 ^^^^^^^^^^^^^^^^^^^^^^
 
 The test library supports guarded buffers, which are buffers allocated so
@@ -1769,7 +1780,7 @@ setting up the size or struct iovec, which is allocated recursively including
 the individual buffers as described by an '-1' terminated array of buffer
 sizes.
 
-2.2.32 Adding and removing capabilities
+2.2.33 Adding and removing capabilities
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Some tests may require the presence or absence of particular
@@ -2030,8 +2041,8 @@ tst_run
 '$TST_TEST_DATA' can be used with '$TST_CNT'. If '$TST_TEST_DATA_IFS' not specified,
 space as default value is used. Of course, it's possible to use separate functions.
 
-2.3.2 Library variables
-^^^^^^^^^^^^^^^^^^^^^^^
+2.3.2 Library environment variables for shell
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 Similarily to the C library various checks and preparations can be requested
 simply by setting right '$TST_NEEDS_FOO'.
@@ -2047,6 +2058,14 @@ simply by setting right '$TST_NEEDS_FOO'.
                        the test (see below).
 | 'TST_NEEDS_MODULE' | Test module name needed for the test (see below).
 | 'TST_NEEDS_DRIVERS'| Checks kernel drivers support for the test.
+| 'TST_TIMEOUT'      | Maximum timeout set for the test in sec. Must be float
+                       >= 1 for C, int >=1 for shell. Default value is 300 sec,
+                       timeout can be disabled by setting it to -1.
+                       Variable should be set in tests, not by user.
+| 'LTP_TIMEOUT_MUL'  | Multiply timeout, must be number >= 1 (> 1 is useful for
+                       slow machines to avoid unexpected timeout).
+                       Variable is also used in C tests,
+                       it should be set by user, not in tests.
 |=============================================================================
 
 NOTE: Network tests (see testcases/network/README.md) use additional variables
diff --git a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
index 5b19cc292..ad8605e16 100755
--- a/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
+++ b/testcases/kernel/controllers/memcg/stress/memcg_stress_test.sh
@@ -17,7 +17,7 @@ TST_NEEDS_CMDS="mount umount cat kill mkdir rmdir grep awk cut"
 
 # Each test case runs for 900 secs when everything fine
 # therefore the default 5 mins timeout is not enough.
-LTP_TIMEOUT_MUL=7
+TST_TIMEOUT=2100
 
 . cgroup_lib.sh
 
diff --git a/testcases/lib/tst_test.sh b/testcases/lib/tst_test.sh
index ca63745fd..b206fc0bb 100644
--- a/testcases/lib/tst_test.sh
+++ b/testcases/lib/tst_test.sh
@@ -379,9 +379,41 @@ _tst_rescmp()
 
 _tst_setup_timer()
 {
+	TST_TIMEOUT=${TST_TIMEOUT:-300}
 	LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}
 
-	local sec=$((300 * LTP_TIMEOUT_MUL))
+	if [ "$TST_TIMEOUT" = -1 ]; then
+		tst_res TINFO "Timeout per run is disabled"
+		return
+	fi
+
+	local err is_float
+	if tst_is_num "$LTP_TIMEOUT_MUL"; then
+		if tst_is_int "$LTP_TIMEOUT_MUL"; then
+			[ "$LTP_TIMEOUT_MUL" -ge 1 ] || err=1
+		else
+			tst_test_cmds awk
+			echo | awk '{if ('"$LTP_TIMEOUT_MUL"' < 1) {exit 1}}' || err=1
+			is_float=1
+		fi
+	else
+		err=1
+	fi
+	if [ "$err" ]; then
+		tst_brk TCONF "LTP_TIMEOUT_MUL must be number >= 1! ($LTP_TIMEOUT_MUL)"
+	fi
+
+	if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
+		tst_brk TBROK "TST_TIMEOUT must be int >= 1! ($TST_TIMEOUT)"
+	fi
+
+	local sec
+	if [ "$is_float" ]; then
+		sec=`echo |awk '{printf("%d\n", '$TST_TIMEOUT' * '$LTP_TIMEOUT_MUL')}'`
+	else
+		sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
+	fi
+
 	local h=$((sec / 3600))
 	local m=$((sec / 60 % 60))
 	local s=$((sec % 60))
@@ -418,7 +450,7 @@ tst_run()
 			NEEDS_CMDS|NEEDS_MODULE|MODPATH|DATAROOT);;
 			NEEDS_DRIVERS|FS_TYPE|MNTPOINT|MNT_PARAMS);;
 			IPV6|IPVER|TEST_DATA|TEST_DATA_IFS);;
-			RETRY_FUNC|RETRY_FN_EXP_BACKOFF);;
+			RETRY_FUNC|RETRY_FN_EXP_BACKOFF|TIMEOUT);;
 			NET_MAX_PKT);;
 			*) tst_res TWARN "Reserved variable TST_$_tst_i used!";;
 			esac
-- 
2.22.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
