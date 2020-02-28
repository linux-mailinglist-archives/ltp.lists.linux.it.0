Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A688F173512
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:14:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22DF43C6AE3
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 11:14:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 565D83C2457
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:14:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 99C5A1002762
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 11:14:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C90CEB1AF;
 Fri, 28 Feb 2020 10:14:29 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 28 Feb 2020 11:14:21 +0100
Message-Id: <20200228101422.31011-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] doc: Remove Style Guide
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

it was outdated and partly redundant with test-writing-guidelines.txt.

Acked-by: Li Wang <liwang@redhat.com>
Acked-by: Jan Stancek <jstancek@redhat.com>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 doc/style-guide.txt | 442 --------------------------------------------
 1 file changed, 442 deletions(-)
 delete mode 100644 doc/style-guide.txt

diff --git a/doc/style-guide.txt b/doc/style-guide.txt
deleted file mode 100644
index b853fa8dc..000000000
--- a/doc/style-guide.txt
+++ /dev/null
@@ -1,442 +0,0 @@
-LTP Style Guide
-===============
-
-**********************************************************************
-Welcome to the *LTP Project Coding Guideline* document! This document is
-designed to guide committers and contributors in producing consistent, quality
-deterministic testcases and port testcases from other sources to LTP so that
-they can be easily maintained by project members and external contributors.
-
-Please refer to the *Linux Kernel Coding Guidelines* unless stated otherwise
-in this document.
-
-Changelog:
-
- * Initial version: Ngie Cooper <yaneurabeya@gmail.com>
- * Reformatted for asciidoc: Cyril Hrubis <chrubis@suse.cz>
-**********************************************************************
-
-Using libltp
-------------
-
-Of course the manpages should be the primary source of information in
-terms of how you should use libltp, but this section provides a quick
-set of guidelines to hit the ground running with libltp.
-
-When you can use libltp please observe the following guidelines:
-
-1. Should I use tst_*() interface in forked processes?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-No, only use libltp in non-forked processes and functions +perror(3)+ /
-+exit(3)+ otherwise. Reason being:
-
- * Calling +tst_resm()+ from multiple processes is messy.
- * Calling cleanup can break test execution.
- * Establishing a complicated scheme of tracking the testcase state
-   for teardown is undesirable.
-
-2. Use SAFE_* macros
-~~~~~~~~~~~~~~~~~~~~
-
-Use +SAFE_*+ macros (see +safe_macros.h+) instead of bare calls to libcalls and
-syscalls. This will:
-
- * Reduce number of lines wasted on repeated in multiple files with
-   error catching logic.
- * Ensure that error catching is consistent and informative; all
-   +SAFE_*+ macros contain the line number of the failure as well as
-   the file where the failure occurred by design. So unless the
-   stack gets stomped on, you will be able to determine where
-   the failures occurred if and when they do occur with absolute
-   determinism.
- * Mute some unchecked return code warnings.
-
-3. Don't call cleanup() from within setup()
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Unless you need to clean up or reset system state that wouldn't otherwise be
-handled by a proper release of all OS resources.
-
-This includes (but is not limited to):
-
- * Memory mapped pages.
- * Mounted filesystems.
- * File descriptors (if they're in temporary directories, etc).
- * Temporary files / directories.
- * Waiting for child processes.
- * +/proc+ & +/sysfs+ tunable states.
-
-You don't need to clean up the following:
-
- * +malloc(3)+'ed memory.
- * Read-only file descriptors in persistent paths (i.e. not
-   temporary directories).
-
-Please be aware of some of the caveats surrounding forking,
-exec'ing and descriptor inheritance, etc.
-
-4. Call APIs that don't require freeing up resources on failure first
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
- * +tst_require_root()+
- * +tst_sig(...)+
- * +malloc(3)+
- * +tst_tmpdir()+
-
-That way you can simplify your setup and avoid calling cleanup whenever
-possible!
-
-5. If the test needs to run as root
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-If the test need to run as root, check to make sure that you're root
-*before doing any other setup* via +tst_require_root()+.
-
-6. No custom reporting APIs
-~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Don't roll your own reporting APIs unless you're porting testcases or are
-concerned about portability.
-
-7. Handle TBROK and TFAIL correctly
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Use +TBROK+ when an unexpected failure unrelated to the goal of the testcase
-occurred, and use +TFAIL+ when an unexpected failure related to the goal of
-the testcase occurred.
-
-8. Don't roll your own syscall numbers
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Header +lapi/syscalls.h+ exists for this purpose and does a pretty
-dang good job.
-
-9. Keep errors as short and sweet as possible
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-For example:
-[source,c]
-----------------------------------------------------
-if (fork() == -1)
-	tst_brkm(TBROK, cleanup, "fork failed");
-
-/* or */
-
-if (fork() == -1)
-	tst_brkm(TBROK, cleanup, "fork # 1 failed");
-
-if (fork() == -1)
-	tst_brkm(TBROK, cleanup, "fork # 2 failed");
-----------------------------------------------------
-
-If you can't determine where the failure has occurred in a testcase based on
-the entire content of the failure messages, then determining the cause of
-failure may be impossible.
-
-10. Reporting errno and the TEST() macro
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Don't roll your own +errno+ / +strerror()+ printout when you use +tst_resm()+
-calls. Use either +TERRNO+ or +TTERRNO+. Similarly, if a testcase passed and
-it's obvious why it passed (for example a function call returns +0+ or
-+TEST_RETURN == 0+).
-
-[source,c]
--------------------------------------------------------------------------------
-/* Example without TEST(...) macro */
-
-exp_errno = ENOENT;
-
-if (fn() == -1) {
-	/*
-	 * Using TERRNO here is valid because the error case
-	 * isn't static.
-	 */
-	if (exp_errno == ENOENT)
-		tst_resm(TPASS|TERRNO,
-		    "fn failed as expected");
-	/*
-	 * Using strerror(TEST_ERRNO) here is valid because
-	 * the error case isn't static.
-	 */
-	else
-		tst_resm(TFAIL|TERRNO,
-		    "fn failed unexpectedly; expected "
-		    "%d - %s",
-		    exp_errno, strerror(exp_errno));
-} else
-	tst_resm(TBROK, "fn passed unexpectedly");
-
-/* Example using TEST(...) macro */
-
-TEST(fn());
-if (TEST_RETURN == 0)
-	tst_resm(TPASS, "fn passed as expected");
-else
-	tst_resm(TFAIL|TTERRNO, "fn failed");
--------------------------------------------------------------------------------
-
-[NOTE]
-The +TEST()+ macro is not thread-safe as it saves return value and errno into
-global variable.
-
-12. Use tst_brkm() when possible
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Use...
-[source,c]
-------------------------------
-tst_brkm(TBROK, cleanup, ...);
-------------------------------
-...instead of...
-[source,c]
-------------------------------
-tst_resm(TBROK, ...);
-cleanup();
-tst_exit();
-------------------------------
-
-[NOTE]
-As you see the +tst_brkm()+ no longer requires non +NULL+ cleanup_fn argument
-in order to call +tst_exit()+.
-
-13. Indentation
-~~~~~~~~~~~~~~~
-
-Use hard tabs for first-level indentation, and 4 spaces for every line longer
-than 80 columns. Use a linebreak with string constants in format functions
-like +*printf()+, the +tst_resm()+ APIs, etc.
-
-Example:
-[source,c]
--------------------------------------------------------------------------------
-if ((this_is_a_poorly_formed_really_long_variable = function_call()) == NULL &&
-    statement1() && i < j && l != 5) {
-	/* Use tabs here */
-	printf("The rain in Spain falls mainly in the plain.\nThe quick brown "
-	    "fox jumped over the lazy yellow dog\n");
-	tst_resm(TPASS,
-	    "Half would turn and fight. The other half would try to swim "
-	    "across. But my uncle told me about a few that... they'd swim "
-	    "halfway out, turn with the current, and ride it all the way out "
-	    "to sea. Fisherman would find them a mile offshore, swimming.");
-}
--------------------------------------------------------------------------------
-
-14. System headers
-~~~~~~~~~~~~~~~~~~
-
-Don't use +linux/+ headers if at all possible. Usually they are replaced with
-+sys/+ headers as things work their way into glibc.  Furthermore, +linux/+
-headers get shuffled around a lot more than their +sys/+ counterparts it
-seems.
-
-15. Signal handlers
-~~~~~~~~~~~~~~~~~~~~
-
-Avoid doing tricky things in signal handlers. Calling most of the libc
-functions from signal handler may lead to deadlocks or memory corruption.  If
-you really need to do anything more complicated that +should_run = 0;+ in your
-signal handler consult +man 7 signal+ for async-signal-safe functions.
-
-Porting Testcases
------------------
-
-If one of the following is true...
-
- 1. You are porting a testcase directly to LTP which doesn't need to
-    be ported outside of Linux.
- 2. The beforementioned project or source is no longer contributing
-    changes to the testcases.
-
-Then please fully port the testcase(s) to LTP. Otherwise, add robust porting
-shims around the testcases using libltp APIs to reduce longterm maintenance
-and leave the sources alone so it's easier to sync the testcases from the
-upstream source.
-
-New Testcases
--------------
-
- 1. Always use libltp for Linux centric tests. No ifs, ands, or buts
-    about it.
- 2. Sort headers, like:
-
-[source,c]
----------------------------------------------------------------------------
-/*
- * sys/types.h is usually (but not always) required by POSIX
- * APIs.
- */
-#include <sys/types.h>
-/* sys headers, alphabetical order. */
-/* directory prefixed libc headers. */
-/* non-directory prefixed libc headers. */
-/* directory prefixed non-libc (third-party) headers. */
-/* non-directory prefixed non-libc (third-party) headers. */
-/* Sourcebase relative includes. */
-
-/* e.g. */
-
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <netinet/icmp.h>
-#include <stdio.h>
-#include <dbus-1.0/dbus/dbus.h>
-#include <archive.h>
-#include "foo/bar.h"
-#include "test.h"
----------------------------------------------------------------------------
-
-3. Comments
-~~~~~~~~~~~
-
-Do not use obvious comments ("child process", "parse options", etc). This
-leads to visual comment noise pollution.
-
-4. Inline assignments
-~~~~~~~~~~~~~~~~~~~~
-
-Don't do inline assignment, i.e.
-
-[source,c]
----------------------------------------------------------------------------
-int foo = 0;
-
-Use separate statements:
-
-int foo;
-
-foo = 0;
----------------------------------------------------------------------------
-
-The only exception to this is when you define global variables.
-
-5. How to assert test is running as root?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Your testcase should be runnable as root and non-root. What does that mean? It
-should fail gracefully as non-root if it has insufficient privileges, or use
-+tst_require_root()+ if root access is absolutely required.
-
-A lot of newer testcases don't honor this fact and it causes random
-unnecessary errors when run as non-privileged users.
-
-6. Do I need to create temporary directory?
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Use +tst_tmpdir()+ if your testcase will:
-
-* Create temporary files.
-* Dump core.
-* Etc. Otherwise, don't bother with the API.
-
-[NOTE]
-If you created temporary directory with +tst_tmpdir()+ don't forget to call
-+tst_rmdir()+ when the test is cleaning up. This is *NOT* done automatically.
-
-7. Setting up signal handlers
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Use +tst_sig()+ instead of bothering with sigaction / signal. This reduces
-potential of leaving a mess around if your test doesn't exit cleanly (now,
-there are some signals that can't be blocked, i.e. +SIGKILL+ and +SIGSTOP+,
-but the rest can be caught).
-
-8. Basic template
-~~~~~~~~~~~~~~~~~
-
-The following is a basic testcase template:
-[source,c]
----------------------------------------------------------------------------
-#include "test.h"
-
-char *TCID = "testname";
-int TST_TOTAL = /* ... */
-
-static void setup(void)
-{
-	/* ... */
-
-	tst_require_root();
-
-	tst_tmpdir();
-
-	/* ... */
-
-	TEST_PAUSE;
-}
-
-static void cleanup(void)
-{
-
-	TEST_CLEANUP;
-
-	/* ... */
-
-	tst_rmdir();
-}
-
-int main(void)
-{
-	/* ... */
-
-	setup();	/* Optional */
-
-	cleanup();	/* Optional */
-	tst_exit();	/* DON'T FORGET THIS -- this must be last! */
-}
----------------------------------------------------------------------------
-
-Fixing Legacy Testcases
------------------------
-
-Unless you interested in exercising self-masochism, do minimal changes
-to testcases when fixing them so it's easier to track potential
-breakage in testcases after a commit is made (mistakes happen and no
-one is perfect). If it works after you fix it -- great -- move on.
-It's more the job of the committers / maintainers to do things like
-style commits.
-
-It's better to focus on adding more content to LTP as a contributor
-and fixing functional issues with existing tests than it is worrying
-about whitespace, unnecessary pedanticness of function calls, etc.
-
-As ugly as the style is in the surrounding code may be, stick to it.
-Otherwise anyone reading the code will cringe at the chaos and
-non-uniform `style', and it will be more difficult to fix later.
-
-
-Fixing Open Posix Testsuite
----------------------------
-
-The *Open Posix Testsuite* does not use libltp interface and moreover aims to
-be usable on any *POSIX* compatible operating system.
-
-So *NO* Linux, BSD specific syscalls there.
-
-Contribution to the project
----------------------------
-
-Since CVS is effectively dead for LTP proper, we ask that you submit
-patches that are git friendly and patchable.
-
-Guidelines for submitting patches are as follows:
-
-1. Use +git commit -s+ . You know you want to ;) .. (you may need to
-   submit a correct signed-off-by line, e.g. use git config first).
-2. Provide a short (<= 50 character) description of the commit.
-3. Provide a little more terse (1-2 paragraph maximum, <= 72 character
-   lines) description of what the commit does.
-4. Format the email with +git format-patch --attach+ command .
-
-Example of a commit message:
-
--------------------------------------------------------------------
-Short description of my commit.
-
-This is a much longer description of my commit. Blah blah blah blah
-blah blah blah blah blah.
-
-Signed-off-by: John Smith <dev@null>
--------------------------------------------------------------------
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
