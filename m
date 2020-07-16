Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A342222443
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 15:49:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E58993C29BD
	for <lists+linux-ltp@lfdr.de>; Thu, 16 Jul 2020 15:49:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A72573C1D4B
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 15:49:46 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 366541A0145A
 for <ltp@lists.linux.it>; Thu, 16 Jul 2020 15:49:44 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F94A31B;
 Thu, 16 Jul 2020 06:49:43 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3912A3F66B;
 Thu, 16 Jul 2020 06:49:42 -0700 (PDT)
Date: Thu, 16 Jul 2020 14:49:39 +0100
From: Qais Yousef <qais.yousef@arm.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200716134939.tqxswbdd2lcpcwp3@e107158-lin.cambridge.arm.com>
References: <20200714152510.13470-1-qais.yousef@arm.com>
 <20200716060710.GA3812@dell5510>
 <20200716093316.re67arcm3tbxtwas@e107158-lin.cambridge.arm.com>
 <20200716095738.GA9395@dell5510>
 <20200716101250.vd7nan2u2nydzbnf@e107158-lin.cambridge.arm.com>
 <20200716120852.GA22657@dell5510>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="g33yett6uu63253e"
Content-Disposition: inline
In-Reply-To: <20200716120852.GA22657@dell5510>
User-Agent: NeoMutt/20171215
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Huacai Chen <chenhc@lemote.com>, ltp@lists.linux.it
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


--g33yett6uu63253e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Petr

On 07/16/20 14:08, Petr Vorel wrote:
> Hi Qais,
> 
> > > > > BTW this has already been reviewed and tested by Huacai Chen [1].
> > > > > LGTM, although I'd prefer to detect with with polling, isn't it possible? [1].
> 
> > > > FWIW I did try to avoid the sleep [1].
> > > Yes, I know, but that was in kernel code (great you tried to fix the problem in
> > > the kernel). Here I mean avoid blind sleep in the test. Reporting problem and
> > > taking "sleep 1" fix would be most probably just enough. Below are suggestions to
> > > consider before taking your posted fix as is.
> 
> > We're probably talking about the same thing. But to clarify further, my
> > original fix in kernel had no sleep and would force a wait by flushing the
> > workqueue when the userspace does the read
> 
> > https://lore.kernel.org/lkml/20200211141554.24181-1-qais.yousef@arm.com/
> 
> > But the maintainer was suggesting to do the sleep in the test instead. Which I
> > didn't like and I didn't understand why my fix isn't good.
> Maybe ask to reconsider your patch again? But cpuset_wait_for_hotplug() might be
> needed on more places, what a shame that turning code into synchronous didn't
> work :(.

Yeah it was a shame. The locking depdency seemed a tricky one too.

> 
> > Anyways. Looking forward.. :)
> 
> 
> > > > Were you thinking of something like that (pseudo code)?
> 
> > > > 	for i in $(seq 3)
> > > > 	do
> > > > 		sleep 1
> > > > 		verify()
> > > > 		if [ sucess ]; then
> > > > 			break;
> > > > 		fi
> > > > 	done
> 
> > > > Or you had something more sophisticated in mind?
> > > No, certainly not more sophisticated :). You can also use TST_RETRY_FUNC helper
> > > instead of creating loop manually. It sleeps in 1 sec.
> 
> > > NOTE: TST_RETRY_FUNC is a wrapper for TST_RETRY_FN_EXP_BACKOFF, using it you can
> > > define sleep time. Unfortunately current code does not allow to loop over less
> > > than 1s, maybe it'd be worth for some cases, where the event is really fast.
> 
> > > @Metan, @Li: would it be worth to change TST_RETRY_FUNC (in both C and shell) to
> > > use ms instead of s?
> 
> > > Also, we have tst_sleep helper, which supports also ms and us (but using
> > > TST_RETRY_FUNC is IMHO better).
> 
> > > I'd have to look more deeply into the test to figure out the verifier.
> 
> > I'd be happy to consider this as long as it won't steal my day. I'm just
> > a by-passer developer and my knowledge about the code base is minimal :)
> Understand. I'm not myself familiar with LTP cpuset tests, nor with the kernel code.
> 
> > Let me know what would be the preferred approach.
> Just please try to send a patch using TST_RETRY_FUNC (thus you need to figure
> out the verifier), or let us know and we either figure that or just simply use
> your original patch.

So I have cooked something quick but I either get

	/root/arm64-ltp/testcases/bin/cpuset_hotplug_test.sh: line 159: TST_RETRY_FUNC: command not found

or

	cpuset_hotplug_test 1 TBROK: Test /root/arm64-ltp/testcases/bin/cpuset_hotplug_test.sh must call tst_run!

Depending whether I impost test.sh or tst_test.sh.

It seems there's a dependency on the overall test construction depending on
what file is imported. And one can import one or the other. It seems
tst_test.sh is the legacy approach?

My WIP patch is attached in case there's somethign obvious to be done here that
I missed.

It looks like the current patch is the simplest thing to do otherwise? :-/

Thanks

--
Qais Yousef

--g33yett6uu63253e
Content-Type: text/x-diff; charset=utf-8
Content-Disposition: attachment; filename="0001-fixup.patch"

From 4e119e36c9d5f486d54b771f1e0d4fb92692e739 Mon Sep 17 00:00:00 2001
From: Qais Yousef <qais.yousef@arm.com>
Date: Thu, 16 Jul 2020 13:51:17 +0100
Subject: [PATCH] fixup

Signed-off-by: Qais Yousef <qais.yousef@arm.com>
---
 .../kernel/controllers/cpuset/cpuset_funcs.sh |   2 +-
 .../cpuset_hotplug_test.sh                    | 126 +++++++++++-------
 2 files changed, 80 insertions(+), 48 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index 935a41ed0..f8066a8bb 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -24,7 +24,7 @@
 ##                                                                            ##
 ################################################################################
 
-. test.sh
+. tst_test.sh
 
 NR_CPUS=`tst_ncpus`
 if [ -f "/sys/devices/system/node/has_high_memory" ]; then
diff --git a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
index 1337e0cd6..af7973b91 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
@@ -57,6 +57,75 @@ check_result()
 	esac
 }
 
+# verify_root <expect_cpus> <expect_task_cpus> <tst_pid>
+verify_root()
+{
+	local expect_cpus="$1"
+	local expect_task_cpus="$2"
+	local tst_pid="$3"
+
+	local root_cpus=
+	local task_cpus=
+	local ret=
+
+	root_cpus="`cat $CPUSET/cpuset.cpus`"
+
+	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
+	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
+
+	check_result "$root_cpus" "$expect_cpus"
+	ret=$?
+	if [ $ret -eq 0 ]
+	then
+		check_result "$task_cpus" "$expect_task_cpus"
+		ret=$?
+		if [ $ret -ne 0 ]; then
+			tst_resm TFAIL "task's allowed list isn't expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
+		fi
+	else
+		tst_resm TFAIL "root group's cpus isn't expected(Result: $root_cpus, Expect: $expect_cpus)."
+	fi
+
+	/bin/kill -9 $tst_pid > /dev/null 2>&1
+
+	return $ret
+}
+
+# verify_general <expect_cpus> <expect_task_cpus> <tst_pid>
+verify_general()
+{
+	local expect_cpus="$1"
+	local expect_task_cpus="$2"
+	local tst_pid="$3"
+
+	local path="$CPUSET/1"
+
+	local cpus=
+	local task_cpus=
+	local ret=
+
+	cpus="`cat $path/cpuset.cpus`"
+
+	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
+	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
+
+	check_result "$cpus" "$expect_cpus"
+	ret=$?
+	if [ $ret -eq 0 ]; then
+		check_result $task_cpus $expect_task_cpus
+		ret=$?
+		if [ $ret -ne 0 ]; then
+			tst_resm TFAIL "task's cpu allowed list isn't expected(Result: $task_cpus, Expect: $expect_task_cpus)."
+		fi
+	else
+		if [ "$cpus" = "" ]; then
+			cpus="EMPTY"
+		fi
+		tst_resm TFAIL "general group's cpus isn't expected(Result: $cpus, Expect: $expect_cpus)."
+	fi
+	/bin/kill -s SIGKILL $tst_pid > /dev/null 2>&1
+}
+
 # root_cpu_hotplug_test <cpuhotplug> <expect_cpus> <expect_task_cpus>
 root_cpu_hotplug_test()
 {
@@ -64,8 +133,6 @@ root_cpu_hotplug_test()
 	local expect_cpus="$2"
 	local expect_task_cpus="$3"
 
-	local root_cpus=
-	local task_cpus=
 	local tst_pid=
 	local ret=
 
@@ -89,27 +156,11 @@ root_cpu_hotplug_test()
 	# cpuset hotplug is asynchronous operation, we could end up reading a
 	# stale value here. sleep is aweful, but we can't do better.
 	# See https://github.com/linux-test-project/ltp/issues/693
-	sleep 1
-
-	root_cpus="`cat $CPUSET/cpuset.cpus`"
-
-	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
-	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
+	TST_RETRY_FUNC "verify_root $expect_cpus $expect_task_cpus $tst_pid" 0
 
-	check_result "$root_cpus" "$expect_cpus"
+	# We don't know the return value, so do one final call to get that
+	verify_root $expect_cpus $expect_task_cpus $tst_pid
 	ret=$?
-	if [ $ret -eq 0 ]
-	then
-		check_result "$task_cpus" "$expect_task_cpus"
-		ret=$?
-		if [ $ret -ne 0 ]; then
-			tst_resm TFAIL "task's allowed list isn't expected.(Result: $task_cpus, Expect: $expect_task_cpus)"
-		fi
-	else
-		tst_resm TFAIL "root group's cpus isn't expected(Result: $root_cpus, Expect: $expect_cpus)."
-	fi
-
-	/bin/kill -9 $tst_pid > /dev/null 2>&1
 
 	return $ret
 }
@@ -124,8 +175,6 @@ general_cpu_hotplug_test()
 	local path="$CPUSET/1"
 
 	local tst_pid=
-	local task_cpus=
-	local ret=
 
 	setup_test_environment $cpuhotplug 2> $CPUSET_TMP/stderr
 	if [ $? -ne 0 ]; then
@@ -160,16 +209,6 @@ general_cpu_hotplug_test()
 		return 1
 	fi
 
-	# cpuset hotplug is asynchronous operation, we could end up reading a
-	# stale value here. sleep is aweful, but we can't do better.
-	# See https://github.com/linux-test-project/ltp/issues/693
-	sleep 1
-
-	cpus="`cat $path/cpuset.cpus`"
-
-	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
-	task_cpus="`echo $task_cpus | sed -e 's/Cpus_allowed_list: //'`"
-
 	if [ "$expect_cpus" = "EMPTY" ]; then
 		local tasks=`cat $path/tasks | grep "\b$tst_pid\b"`
 		check_result "$tasks" "EMPTY"
@@ -188,21 +227,14 @@ general_cpu_hotplug_test()
 		fi
 	fi
 
-	check_result "$cpus" "$expect_cpus"
+	# cpuset hotplug is asynchronous operation, we could end up reading a
+	# stale value here. sleep is aweful, but we can't do better.
+	# See https://github.com/linux-test-project/ltp/issues/693
+	TST_RETRY_FUNC "verify_general $expect_cpus $expect_task_cpus $tst_pid" 0
+
+	# We don't know the return value, so do one final call to get that
+	verify_general $expect_cpus $expect_task_cpus $tst_pid
 	ret=$?
-	if [ $ret -eq 0 ]; then
-		check_result $task_cpus $expect_task_cpus
-		ret=$?
-		if [ $ret -ne 0 ]; then
-			tst_resm TFAIL "task's cpu allowed list isn't expected(Result: $task_cpus, Expect: $expect_task_cpus)."
-		fi
-	else
-		if [ "$cpus" = "" ]; then
-			cpus="EMPTY"
-		fi
-		tst_resm TFAIL "general group's cpus isn't expected(Result: $cpus, Expect: $expect_cpus)."
-	fi
-	/bin/kill -s SIGKILL $tst_pid > /dev/null 2>&1
 
 	return $ret
 }
-- 
2.17.1


--g33yett6uu63253e
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--g33yett6uu63253e--
