Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBC72C9850
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 08:43:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E403B3C2BF8
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 08:43:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8FD8A3C2BF8
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 08:42:56 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id DD502600EA3
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 08:42:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606808570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvdVrl+dNRSifIuSl+xK9CYvFoOz9ICyJCOfS6B37Ao=;
 b=QntDFf9M/DBJLUmEXK8aZSk7qG/vACRph9i/IRLImQePtY5T8IZs+5fNL/K6NUcNCL9nvf
 y7KUbmivH814BBKl3O69MrlsvQc5Gj91IArBPrKZCw8HwV5FrjSMtIm++tXL7W6UIxku9o
 6mLaJwUzUH9UZ0d7oD3ACcfxpd0SMpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-M0I_NYq_PEKU8Tb6nF5dPQ-1; Tue, 01 Dec 2020 02:42:48 -0500
X-MC-Unique: M0I_NYq_PEKU8Tb6nF5dPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A79E31005D51;
 Tue,  1 Dec 2020 07:42:47 +0000 (UTC)
Received: from janakin.usersys.redhat.com (unknown [10.36.110.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6B55D9C2;
 Tue,  1 Dec 2020 07:42:46 +0000 (UTC)
Date: Tue, 1 Dec 2020 08:42:43 +0100
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201201074243.GA6306@janakin.usersys.redhat.com>
References: <20201127163150.22903-1-chrubis@suse.cz>
 <20201127163150.22903-3-chrubis@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20201127163150.22903-3-chrubis@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] lib: Add test library design document
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
Cc: ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Nov 27, 2020 at 05:31:50PM +0100, Cyril Hrubis wrote:
>Which tries to explain high level overview and design choices for the
>test library.
>
>Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
>---
> lib/README.md | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 130 insertions(+)
> create mode 100644 lib/README.md
>
>diff --git a/lib/README.md b/lib/README.md
>new file mode 100644
>index 000000000..6efd3cf33
>--- /dev/null
>+++ b/lib/README.md
>@@ -0,0 +1,130 @@
>+# Test library design document
>+
>+## Test lifetime overview
>+
>+When a test is executed the very first thing to happen is that the we check for
>+various test pre-requisities. These are described in the tst\_test structure
>+and range from simple '.require\_root' to a more complicated kernel .config
>+boolean expressions such as:
>+"CONFIG\_X86\_INTEL\_UMIP=y | CONFIG\_X86\_UMIP=y".
>+
>+If all checks are passed the process carries on with setting up the test
>+environment as requested in the tst\_test structure. There are many different
>+setup steps that have been put into the test library again ranging from rather
>+simple creation of a unique test temporary directory to a bit more complicated
>+ones such as preparing, formatting, and mounting a block device.
>+
>+The test library also intializes shrared memory used for IPC at this step.
>+
>+Once all the prerequisities are checked and test environment has been prepared
>+we can move on executing the testcase itself. The actual test is executed in a
>+forked process, however there are a few hops before we get there.
>+
>+First of all there are test variants, which means that the test is re-executed
>+several times with a slightly different settings. This is usually used to test
>+a family of similar syscalls, where we test each of these syscalls exactly the
>+same, but without re-executing the test binary itself. Test varianst are
>+implemented as a simple global variable counter that gets increased on each
>+iteration. In a case of syscall tests we switch between which syscall to call
>+based on the global counter.
>+
>+Then there is all\_filesystems flag which is mostly the same as test variants
>+but executes the test for each filesystem supported by the system. Note that we
>+can get cartesian product between test variants and all filesystems as well.
>+
>+In a pseoudo code it could be expressed as:
>+
>+```
>+for test_variants:
>+	for all_filesystems:
>+		fork_testrun()
>+```
>+
>+Before we fork() the test process the test library sets up a timeout alarm and
>+also a heartbeat signal handlers and also sets up an alarm(2) accordingly to
>+the test timeout. When a test timeouts the test library gets SIGALRM and the
>+alarm handler mercilesly kills all forked children by sending SIGKILL to the
>+whole process group. The heartbeat handler is used by the test process to reset
>+this timer for example when the test functions runs in a loop.
>+
>+With that done we finally fork() the test process. The test process firstly
>+resets signal handlers and sets its pid to be a process group leader so that we
>+can slaughter all children if needed. The test library proceeds with suspending
>+itself in waitpid() syscall and waits for the child to finish at this point.
>+
>+The test process goes ahead and call the test setup() function if present in
>+the tst\_test structure. It's important that we execute all test callbacks
>+after we have forked the process, that way we cannot crash the test library
>+process. The setup can also cause the the test to exit prematurely by either
>+direct or indirect (SAFE\_MACROS()) call to tst\_brk().  In this case the
>+fork\_testrun() function exits, but the loops for test variants or filesystems
>+carries on.
>+
>+All that is left to be done is to actually execute the tests, what happnes now
>+depends on the -i and -I command line parameters that can request that the
>+run() or run\_all() callbacks are executed N times or for a N seconds. Again
>+the test can exit at any time by direct or indirect call to tst\_brk().
>+
>+Once the test is finished all that is left for the test process is the test
>+cleanup(). So if a there is a cleanup() callback in the tst\_test strucuture
>+it's executed. Callback runs in a special context where the tst\_brk(TBROK,
>+...) calls are converted into tst\_res(TWARN, ...) calls. This is because we
>+found out that carrying up with partially broken cleanup is usually better
>+option than exitting it in the middle.
>+
>+The test cleanup() is also called by the tst\_brk() handler in order to cleanup
>+before exitting the test process, hence it must be able to cope even with
>+partiall test setup. Usually it suffices to make sure to clean up only
>+resources that already have been set up and to do that in an inverse order that
>+we did in setup().
>+
>+Once the test process exits or leaves the run() or run\_all() function the test
>+library wakes up from the waitpid() call, and checks if the test process
>+exitted normally.
>+
>+Once the testrun is finished the test library does a cleanup() as well to clean
>+up resources set up in the test library setup(), reports test results and
>+finally exits the process.
>+
>+### Test library and fork()-ing
>+
>+Things are a bit more complicated when fork()-ing is involved, however the
>+tests results are stored in a page of a shared memory and incremented by atomic
>+operations, hence the results are stored rigth after the test reporting
>+fucntion returns from the test library and the access is, by definition,
>+race-free as well.
>+
>+On the other hand the test library, apart from sending a SIGKILL to the whole
>+process group on timeout, does not track granchildren.
>+
>+This especially means that:
>+
>+- The test exits once the main test process exits.
>+
>+- While the test results are, by the desing, propagated to the test library
                                       ^^ typo

>+  we may still miss a child that gets killed by a signal or exits unexpectedly.
>+
>+The test writer should, because of these, take care for mourning these proceses
>+properly, in most cases this could be simply done by calling
>+tst\_reap\_children() to collect and dissect deceased.
>+
>+Also note that tst\_brk() does exit only the current process, so if child
>+process calls tst\_brk() the counters are incremented and the process exits.
>+
>+### Test library and exec()
>+
>+The piece of mapped memory to store the results to is not preserved over
>+exec(2), hence to use the test library from a binary started by an exec() it
>+has to be remaped. In this case the process must to call tst\_reinit() before
>+calling any other library functions. In order to make this happen the program
>+environment carries LTP\_IPC\_PATH variable with a path to the backing file on
>+tmpfs. This also allows us to use the test library from a shell testcases.
>+
>+### Test library and process synchronization
>+
>+The piece of mapped memory is also used as a base for a futex-based
>+synchronization primitives called checkpoints. And as said previously the
>+memory can be mapped to any process by calling the tst\_reinit() function. As a
>+matter of a fact there is even a tst\_checkpoint binary that allows use to use
>+the checkpoints from shell code as well.
>+

Looks good to me.

What do you think about adding a small ascii picture(s)?
For example, one that shows outline of what's called in
library vs. test process:

        lib process                                                                                    
        +----------------------------+                                                                 
        | main                       |                                                                 
        |  tst_run_tcases            |                                                                 
        |   do_setup                 |                                                                 
        |   for_each_variant         |                                                                 
        |    for_each_filesystem     |          test process                                           
        |     fork_testrun ---------------------+--------------------------------------------+         
        |      waitpid               |          | testrun                                    |         
        |                            |          |  do_test_setup                             |         
        |                            |          |   tst_test->setup                          |         
        |                            |          |  run_tests                                 |         
        |                            |          |   tst_test->test(i) or tst_test->test_all  |         
        |                            |          |  do_test_cleanup                           |         
        |                            |          |   tst_test->cleanup                        |         
        |                            |          |  exit(0)                                   |         
        |   do_exit                  |          +--------------------------------------------+         
        |    do_cleanup              |                                                                 
        |     exit(ret)              |                                                                 
        +----------------------------+                                                                 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
