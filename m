Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A63D2A4FC3
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 124C53C3026
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Nov 2020 20:14:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 4C7A03C300B
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 85E891A00255
 for <ltp@lists.linux.it>; Tue,  3 Nov 2020 20:13:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4155EAF30;
 Tue,  3 Nov 2020 19:13:40 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  3 Nov 2020 20:13:20 +0100
Message-Id: <20201103191327.11081-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201103191327.11081-1-pvorel@suse.cz>
References: <20201103191327.11081-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 04/11] docparse: Add README
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
Cc: Cyril Hrubis <metan@ucw.cz>, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Cyril Hrubis <metan@ucw.cz>

* example of C source and JSON
* note about exporting timeouts

Signed-off-by: Tim Bird <tim.bird@sony.com>
[ Tim: fix typos and clean up grammar ]
Signed-off-by: Cyril Hrubis <metan@ucw.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 docparse/README.md | 248 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)
 create mode 100644 docparse/README.md

diff --git a/docparse/README.md b/docparse/README.md
new file mode 100644
index 000000000..7e4847ba2
--- /dev/null
+++ b/docparse/README.md
@@ -0,0 +1,248 @@
+Motivation for metadata exctraction
+===================================
+
+Exporting documentation
+-----------------------
+
+This allow us to build browseable documentation for the testcases, e.g. a
+catalogue of test information that would be searchable etc. At this point there
+is a single page generated from the extracted data that tries to outline the
+intent.
+
+
+Propagating test requirements
+-----------------------------
+
+Some subtests require differnt hardware resources/software versions/etc. the
+test execution framework needs to consume these so that it can locate proper
+hardware, install proper software, etc.
+
+Some examples of requriments are:
+
+* Test needs at least 1GB of RAM.
+
+* Test needs a block device at least 512MB in size
+
+* Test needs a NUMA machine with two memory nodes and at least 300 free pages on each node
+
+* Test needs i2c eeprom connected on a i2c bus
+
+* Test needs two serial ports connected via null-modem cable
+
+
+With this information extracted from the tests the testrunner can then map the
+requiremnts on the available machines in a lab and select a proper machine for
+the particular (sub)set of testcases as well as supply a particular test with
+additional information needed for the test, such as address of the i2c device,
+paths to the serial devices, etc. In the case of virtual machines the test could
+also dynamically prepare the correct environment for the test on demand.
+
+
+Parallel test execution
+-----------------------
+
+An LTP testrun on a modern hardware wastes most of the machine resources
+because the testcases are running sequentially. However in order to execute
+tests in parallel we need to know which system resources are utilized by a
+given test, as obviously we cannot run two tests that monopolize the same
+resource. In some cases we would also need to partition the system resource
+accordingly, e.g. if we have two memory stress tests running at the same time
+we will need to cap each of these tests on half of the available memory, or
+make sure that sum of the memory used by these two tests is not greater an
+available memory.
+
+Examples of such tests are:
+
+* Tests that mess with global system state
+   - system time (e.g. settimeofday() test and leap second test)
+   - SysV SHM
+   - ...
+
+* Tests that use block device
+
+* Tests that work with a particular hardware resource
+  - i2c eeprom test
+  - serial port tests
+  - ...
+
+Exporting test runtime/timeout to the testrunner
+------------------------------------------------
+
+Currently most of the testrunners usually do not know for how long is the test
+supposed to run, this means that we have to guess some upper limit on how long
+a test is supposed to run. The value is usually twice of the maximal runtime
+for all testcases or whole suite or even larger. This means that we are wasting
+time in the case that the test ends up stuck and we could have failed it much
+sooner in most of the cases. This becomes quite important for a kernel
+regression tests that do crash the host, if the information that the test is
+supposed to crash a kernel under a minute is exported to the testrunner we can
+reboot the machine much faster in an event of a crash.
+
+Getting rid of runtest files
+----------------------------
+
+This would also allow us to get rid of the unflexible and hard to maintain
+runtest files. Once this system is in place we will have a list of all tests
+along with their respective metadata - which means that we will be able to
+generate subsets of the test easily on the fly.
+
+In order to achieve this we need two things:
+
+Each test will describe which syscall/functionality it tests in the metadata.
+Then we could define groups of tests based on that. I.e. instead of having
+syscall runtest file we would ask the testrunner to run all test that have a
+defined which syscall they test, or whose filename matches a particular syscall name.
+
+Secondly we will have to store the test variants in the test metadata instead
+of putting them in a file that is unrelated to the test.
+
+For example:
+
+* To run CVE related test we would select testcases with CVE tag
+
+* To run IPC test we will define a list of IPC syscalls and run all syscall
+  test that are in the list
+
+* And many more...
+
+
+Implementation
+==============
+
+The docparser is implemented as a minimal C tokenizer that can parse and
+extract code comments and C structures. The docparser then runs over all C
+sources in the testcases directory and if tst\_test structure is present in the
+source it's parsed and the result is included in the resulting metadata.
+
+During parsing the metadata is stored in a simple key/value storage that more
+or less follows C structure layout, i.e. can include hash, array, and string.
+Once the parsing is finished the result is filtered so that only interesting
+fields of the tst\_test structure are included and then converted into JSON
+output.
+
+This process produces one big JSON file with metadata for all tests, that
+is then installed along with the testcases. This would then be used by the
+testrunner.
+
+The test requirements are stored in the tst\_test structure either as
+bitflags, integers or arrays of strings:
+
+```c
+struct tst_test test = {
+	...
+	/* tests needs to run with UID=1 */
+	.needs_root = 1,
+
+	/*
+	 * Tests needs a block device at least 1024MB in size and also
+	 * mkfs.ext4 installed.
+	 */
+	.needs_device = 1,
+	.dev_min_size = 1024,
+	.dev_fs_type = ext4,
+
+	/* Indicates that the test is messing with system wall clock */
+	.restore_wallclock = 1,
+
+	/* Tests needs uinput either compiled in or loaded as a module */
+	.needs_drivers = (const char *[]) {
+		"uinput",
+		NULL
+	},
+
+	/* Tests needs enabled kernel config flags */
+	.needs_kconfigs = (const char *[]) {
+		"CONFIG_X86_INTEL_UMIP=y",
+		NULL
+	},
+
+	/* Additional array of key value pairs */
+	.tags = (const struct tst_tag[]) {
+                {"linux-git", "43a6684519ab"},
+                {"CVE", "2017-2671"},
+                {NULL, NULL}
+        }
+};
+```
+
+The test documentation is stored in a special comment such as:
+
+```
+/*\
+ * Test description
+ *
+ * This is a test description.
+ * Consisting of several lines.
+\*/
+```
+
+Which will yield following json output:
+
+```json
+ "testcaseXY": {
+  "needs_root": "1",
+  "needs_device": "1",
+  "dev_min_size": "1024",
+  "dev_fs_type": "ext4",
+  "restore_wallclock": "1",
+  "needs_drivers": [
+    "uinput",
+  ],
+  "needs_kconfigs": [
+    "CONFIG_X86_INTEL_UMIP=y",
+  ],
+  "tags": [
+    [
+     "linux-git",
+     "43a6684519ab"
+    ],
+    [
+     "CVE",
+     "2017-2671"
+    ],
+   ],
+  "doc": [
+    "Test description",
+    "",
+    "This is a test description.",
+    "Consisting of several lines."
+  ],
+  "fname": "testcases/kernel/syscalls/foo/testcaseXY.c"
+ },
+```
+
+The final JSON file is JSON object of test descriptions indexed by a test name
+with a header describing the testsuite:
+
+```json
+{
+ "testsuite": "Linux Test Project",
+ "testsuite_short": "LTP",
+ "url": "https://github.com/linux-test-project/ltp/",
+ "scm_url_base": "https://github.com/linux-test-project/ltp/tree/master/",
+ "timeout": 300,
+ "version": "20200930",
+ "tests": {
+  "testcaseXY": {
+   ...
+  },
+  ...
+ }
+}
+```
+
+Open Points
+===========
+
+There are stil some loose ends. Mostly it's not well defined where to put
+things and how to format them.
+
+* Some of the hardware requirements are already listed in the tst\_test. Should
+  we put all of them there?
+
+* What would be the format for test documentation and how to store things such
+  as test variants there?
+
+So far this proof of concept generates a metadata file. I guess that we need
+actual consumers which will help to settle things down, I will try to look into
+making use of this in the runltp-ng at least as a reference implementation.
-- 
2.29.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
