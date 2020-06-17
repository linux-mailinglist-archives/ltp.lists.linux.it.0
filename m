Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B181FD095
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 17:11:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A2BB3C2CB5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jun 2020 17:11:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 582763C1C9A
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 17:11:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 976736009EB
 for <ltp@lists.linux.it>; Wed, 17 Jun 2020 17:10:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id F2081B040;
 Wed, 17 Jun 2020 15:11:23 +0000 (UTC)
Date: Wed, 17 Jun 2020 17:11:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200617151135.GA7370@yuki.lan>
References: <9b9e3d35b4fddb668b02595e418a997332f98491.1591347655.git.jstancek@redhat.com>
 <e6c7e4022e9b99ce768dfdd92d388526feecfe11.1591347655.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6c7e4022e9b99ce768dfdd92d388526feecfe11.1591347655.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/setns: convert to new API
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  testcases/kernel/syscalls/setns/setns.h   |   8 +-
>  testcases/kernel/syscalls/setns/setns01.c |  78 +++++--------
>  testcases/kernel/syscalls/setns/setns02.c | 128 ++++++++++------------
>  3 files changed, 91 insertions(+), 123 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/setns/setns.h b/testcases/kernel/syscalls/setns/setns.h
> index a05e6736c64a..942d0833b782 100644
> --- a/testcases/kernel/syscalls/setns/setns.h
> +++ b/testcases/kernel/syscalls/setns/setns.h
> @@ -22,6 +22,8 @@
>   * 02110-1301, USA.
>   */
>  
> +#include <stdio.h>
> +
>  #define NS_MAX 5
>  static int ns_types[NS_MAX];
>  static int ns_fds[NS_MAX];
> @@ -37,10 +39,10 @@ static int get_ns_fd(int pid, const char *ns)
>  	if (stat(tmp, &st) == 0) {
>  		fd = open(tmp, O_RDONLY);
>  		if (fd == -1)
> -			tst_brkm(TBROK|TERRNO, NULL, "failed to open %s", tmp);
> +			tst_brk(TBROK|TERRNO, "failed to open %s", tmp);
>  	} else {
>  		if (errno != ENOENT)
> -			tst_brkm(TBROK|TERRNO, NULL, "failed to stat %s", tmp);
> +			tst_brk(TBROK|TERRNO, "failed to stat %s", tmp);
>  	}
>  	return fd;
>  }
> @@ -53,7 +55,7 @@ static void init_ns_type(int clone_type, const char *proc_name)
>  	if (fd != -1) {
>  		ns_types[ns_total] = clone_type;
>  		ns_fds[ns_total] = fd;
> -		tst_resm(TINFO, "ns_name=%s, ns_fds[%d]=%d, ns_types[%d]=0x%x",
> +		tst_res(TINFO, "ns_name=%s, ns_fds[%d]=%d, ns_types[%d]=0x%x",
>  			 proc_name, ns_total, fd, ns_total, clone_type);
>  		ns_total++;
>  	}

I guess that we can as well include the lapi/namespace_constants.h and
remove the #ifdefs in the init_available_ns() function.

> diff --git a/testcases/kernel/syscalls/setns/setns01.c b/testcases/kernel/syscalls/setns/setns01.c
> index 864899205aa8..0cf2684ba6ef 100644
> --- a/testcases/kernel/syscalls/setns/setns01.c
> +++ b/testcases/kernel/syscalls/setns/setns01.c
> @@ -26,20 +26,14 @@
>   */

Can we please change the GPL comment to SPDX as well?

>  #define _GNU_SOURCE
>  #include <sys/stat.h>
> -#include <sys/syscall.h>
>  #include <sys/types.h>
>  #include <errno.h>
>  #include <sched.h>
>  #include <pwd.h>
>  #include <string.h>
>  #include "config.h"
> -#include "test.h"
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> -#include "safe_macros.h"
> -
> -char *TCID = "setns01";
> -
> -#if defined(__NR_setns)
>  #include "setns.h"
>  
>  struct testcase_t {
> @@ -53,8 +47,6 @@ struct testcase_t {
>  	void (*cleanup) (struct testcase_t *);
>  };
>  
> -static void setup(void);
> -static void cleanup(void);
>  static void setup0(struct testcase_t *, int);
>  static void setup1(struct testcase_t *, int);
>  static void setup2(struct testcase_t *, int);
> @@ -63,7 +55,7 @@ static void setup4(struct testcase_t *, int);
>  static void cleanup1(struct testcase_t *);
>  static void cleanup4(struct testcase_t *);
>  
> -struct testcase_t tdat[] = {
> +struct testcase_t tcases[] = {
>  	{
>  		.msg = "invalid fd",
>  		.fd = -1,
> @@ -100,7 +92,6 @@ struct testcase_t tdat[] = {
>  	}
>  };
>  
> -static int TST_TOTAL = sizeof(tdat) / sizeof(tdat[0]);
>  static const char nobody_uid[] = "nobody";
>  static struct passwd *ltpuser;
>  
> @@ -114,7 +105,7 @@ static void setup1(struct testcase_t *t, int i)
>  	t->ns_type = ns_types[i];
>  	t->fd = open("dummy", O_RDWR|O_CREAT, 0600);
>  	if (t->fd == -1)
> -		tst_brkm(TFAIL|TERRNO, cleanup, "setup1:open failed");
> +		tst_brk(TFAIL|TERRNO, "setup1:open failed");
>  	unlink("dummy");
>  }
>  
> @@ -141,41 +132,42 @@ static void setup3(struct testcase_t *t, int i)
>  
>  static void setup4(struct testcase_t *t, int i)
>  {
> -	SAFE_SETEUID(NULL, ltpuser->pw_uid);
> +	SAFE_SETEUID(ltpuser->pw_uid);
>  
>  	t->fd = ns_fds[i];
>  	t->ns_type = ns_types[i];
>  }
>  
> -static void cleanup4(struct testcase_t *t)
> +static void cleanup4(LTP_ATTRIBUTE_UNUSED struct testcase_t *t)
>  {
> -	SAFE_SETEUID(NULL, 0);
> +	SAFE_SETEUID(0);
>  }

I would move these functions before the testcsese_t structure so that we
do not have to define the function prototypes.

Also I guess that we can open the regular file once in the test setup
and set only the t->fd in the setup1()

> -static void test_setns(struct testcase_t *t)
> +static void test_setns(unsigned int testno)
>  {
>  	int ret, i;
> +	struct testcase_t *t = &tcases[testno];
>  
>  	for (i = 0; i < ns_total; i++) {
>  		if (t->setup)
>  			t->setup(t, i);
>  
>  		if (t->skip) {
> -			tst_resm(TINFO, "skip %s", tdat->msg);
> +			tst_res(TINFO, "skip %s", t->msg);
>  			continue;
>  		}
>  
> -		tst_resm(TINFO, "setns(%d, 0x%x)", t->fd, t->ns_type);
> -		ret = syscall(__NR_setns, t->fd, t->ns_type);
> +		tst_res(TINFO, "setns(%d, 0x%x)", t->fd, t->ns_type);
> +		ret = tst_syscall(__NR_setns, t->fd, t->ns_type);
>  		if (ret == t->exp_ret) {
>  			if (ret == -1 && errno == t->exp_errno)
> -				tst_resm(TPASS, "%s exp_errno=%d", t->msg,
> +				tst_res(TPASS, "%s exp_errno=%d", t->msg,
>  						t->exp_errno);
>  			else
> -				tst_resm(TFAIL|TERRNO, "%s exp_errno=%d",
> +				tst_res(TFAIL|TERRNO, "%s exp_errno=%d",
>  					t->msg, t->exp_errno);
>  		} else {
> -			tst_resm(TFAIL, "%s ret=%d expected=%d", t->msg,
> +			tst_res(TFAIL, "%s ret=%d expected=%d", t->msg,
>  					ret, t->exp_ret);

Can we also print the expected errno name with tst_strerrno() ?

>  		}
>  
> @@ -184,50 +176,32 @@ static void test_setns(struct testcase_t *t)
>  	}
>  }
>  
> -int main(int argc, char *argv[])
> -{
> -	int lc, testno;
> -
> -	tst_parse_opts(argc, argv, NULL, NULL);
> -
> -	setup();
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		for (testno = 0; testno < TST_TOTAL; testno++)
> -			test_setns(&tdat[testno]);
> -	}
> -	cleanup();
> -	tst_exit();
> -}
> -
>  static void setup(void)
>  {
> -	tst_require_root();
> -
>  	/* runtime check if syscall is supported */
> -	ltp_syscall(__NR_setns, -1, 0);
> +	tst_syscall(__NR_setns, -1, 0);
>  
>  	init_available_ns();
>  	if (ns_total == 0)
> -		tst_brkm(TCONF, NULL, "no ns types/proc entries");
> +		tst_brk(TCONF, "no ns types/proc entries");
>  
>  	ltpuser = getpwnam(nobody_uid);
>  	if (ltpuser == NULL)
> -		tst_brkm(TBROK | TERRNO, NULL, "getpwnam failed");
> +		tst_brk(TBROK | TERRNO, "getpwnam failed");
>  
> -
> -	tst_tmpdir();
> -	TEST_PAUSE;
>  }
>  
>  static void cleanup(void)
>  {
>  	close_ns_fds();
> -	tst_rmdir();
>  }
> -#else
> -int main(int argc, char *argv[])
> -{
> -	tst_brkm(TCONF, NULL, "__NR_setns is not defined on your system.");
>  
> -}
> -#endif
> +static struct tst_test test = {
> +	.tcnt = ARRAY_SIZE(tcases),
> +	.test = test_setns,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +	.needs_tmpdir = 1,
> +};
> +
> diff --git a/testcases/kernel/syscalls/setns/setns02.c b/testcases/kernel/syscalls/setns/setns02.c
> index 0f49028450b7..ce97be807256 100644
> --- a/testcases/kernel/syscalls/setns/setns02.c
> +++ b/testcases/kernel/syscalls/setns/setns02.c
> @@ -33,24 +33,20 @@
>  #include <sys/ipc.h>
>  #include <sys/shm.h>
>  #include <sys/stat.h>
> -#include <sys/syscall.h>
>  #include <sys/types.h>
>  #include <sys/utsname.h>
>  #include <sys/wait.h>
>  #include <errno.h>
>  #include <sched.h>
> +#include <stdlib.h>
>  #include <string.h>
>  #include "config.h"
> -#include "test.h"
> +#include "tst_test.h"
>  #include "lapi/syscalls.h"
> -#include "safe_macros.h"
> +#include "setns.h"
>  
>  #define CHILD_STACK_SIZE (1024*1024)
>  #define CP "(child) "
> -char *TCID = "setns02";
> -
> -#if defined(__NR_setns) && defined(CLONE_NEWIPC) && defined(CLONE_NEWUTS)
> -#include "setns.h"
>  
>  static char *dummy_hostname = "setns_dummy_uts";
>  static int ns_ipc_fd;
> @@ -67,37 +63,37 @@ static int do_child_newuts(void *arg)
>  	int ns_flag = *(int *)arg;
>  
>  	if (uname(&uts_parent) == -1)
> -		tst_resm(TFAIL|TERRNO, CP"uname");
> -	tst_resm(TINFO, CP"hostname (inherited from parent): %s",
> +		tst_res(TFAIL|TERRNO, CP"uname");
> +	tst_res(TINFO, CP"hostname (inherited from parent): %s",
>  		uts_parent.nodename);
>  
>  	if (sethostname(dummy_hostname, strlen(dummy_hostname)) == -1)
> -		tst_resm(TFAIL|TERRNO, CP"sethostname");
> +		tst_res(TFAIL|TERRNO, CP"sethostname");
>  	if (uname(&uts) == -1)
> -		tst_resm(TFAIL|TERRNO, CP"uname");
> +		tst_res(TFAIL|TERRNO, CP"uname");
>  
> -	tst_resm(TINFO, CP"hostname changed to: %s", uts.nodename);
> +	tst_res(TINFO, CP"hostname changed to: %s", uts.nodename);
>  	if (strcmp(uts_parent.nodename, uts.nodename) == 0) {
> -		tst_resm(TFAIL, CP"expected hostname to be different");
> +		tst_res(TFAIL, CP"expected hostname to be different");
>  		return 1;
>  	} else {
> -		tst_resm(TPASS, CP"hostname is different in parent/child");
> +		tst_res(TPASS, CP"hostname is different in parent/child");
>  	}
>  
> -	tst_resm(TINFO, CP"attempting to switch ns back to parent ns");
> -	if (syscall(__NR_setns, ns_uts_fd, ns_flag) == -1) {
> -		tst_resm(TFAIL|TERRNO, CP"setns");
> +	tst_res(TINFO, CP"attempting to switch ns back to parent ns");
> +	if (tst_syscall(__NR_setns, ns_uts_fd, ns_flag) == -1) {
> +		tst_res(TFAIL|TERRNO, CP"setns");
>  		return 2;
>  	}
>  	if (uname(&uts) == -1)
> -		tst_resm(TFAIL|TERRNO, CP"uname");
> +		tst_res(TFAIL|TERRNO, CP"uname");
>  
> -	tst_resm(TINFO, CP"hostname: %s", uts.nodename);
> +	tst_res(TINFO, CP"hostname: %s", uts.nodename);
>  	if (strcmp(uts_parent.nodename, uts.nodename) != 0) {
> -		tst_resm(TFAIL, CP"expected hostname to match parent");
> +		tst_res(TFAIL, CP"expected hostname to match parent");
>  		return 3;
>  	} else {
> -		tst_resm(TPASS, CP"hostname now as expected");
> +		tst_res(TPASS, CP"hostname now as expected");
>  	}
>  	return 0;
>  }
> @@ -109,25 +105,25 @@ static int do_child_newipc(void *arg)
>  
>  	p = shmat(shmid, NULL, 0);
>  	if (p == (void *) -1) {
> -		tst_resm(TPASS|TERRNO, CP"shmat failed as expected");
> +		tst_res(TPASS|TERRNO, CP"shmat failed as expected");
>  	} else {
> -		tst_resm(TFAIL, CP"shmat unexpectedly suceeded");
> +		tst_res(TFAIL, CP"shmat unexpectedly suceeded");
>  		shmdt(p);
>  		return 1;
>  	}
>  
> -	tst_resm(TINFO, CP"attempting to switch ns back to parent ns");
> -	if (syscall(__NR_setns, ns_ipc_fd, ns_flag) == -1) {
> -		tst_resm(TFAIL|TERRNO, CP"setns");
> +	tst_res(TINFO, CP"attempting to switch ns back to parent ns");
> +	if (tst_syscall(__NR_setns, ns_ipc_fd, ns_flag) == -1) {
> +		tst_res(TFAIL|TERRNO, CP"setns");
>  		return 2;
>  	}
>  
>  	p = shmat(shmid, NULL, 0);
>  	if (p == (void *) -1) {
> -		tst_resm(TFAIL|TERRNO, CP"shmat failed after setns");
> +		tst_res(TFAIL|TERRNO, CP"shmat failed after setns");
>  		return 3;
>  	} else {
> -		tst_resm(TPASS, CP"shmat suceeded");
> +		tst_res(TPASS, CP"shmat suceeded");
>  		shmdt(p);
>  	}
>  
> @@ -141,70 +137,66 @@ static void test_flag(int clone_flag, int ns_flag, int (*fn) (void *arg))
>  
>  	child_stack = malloc(CHILD_STACK_SIZE);
>  	if (child_stack == NULL)
> -		tst_brkm(TBROK, cleanup, "Cannot allocate stack for child");
> +		tst_brk(TBROK, "Cannot allocate stack for child");
>  
> -	tst_resm(TINFO, "creating child with clone_flag=0x%x, ns_flag=0x%x",
> +	tst_res(TINFO, "creating child with clone_flag=0x%x, ns_flag=0x%x",
>  		clone_flag, ns_flag);
>  	ret = ltp_clone(SIGCHLD|clone_flag, fn, &ns_flag,
>  		CHILD_STACK_SIZE, child_stack);
>  	if (ret == -1)
> -		tst_brkm(TBROK|TERRNO, cleanup, "ltp_clone");
> +		tst_brk(TBROK|TERRNO, "ltp_clone");
>  
> -	SAFE_WAITPID(cleanup, ret, &status, 0);
> +	SAFE_WAITPID(ret, &status, 0);
>  	if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
> -		tst_resm(TFAIL, "child returns %d", status);
> +		tst_res(TFAIL, "child returns %d", status);
>  	else
> -		tst_resm(TPASS, "child finished succesfully");
> +		tst_res(TPASS, "child finished succesfully");
>  	free(child_stack);
>  }

Do we still need to propagate the test result via exit value?

That shouldn't be needed in new API test, right?

> -int main(int argc, char *argv[])
> +void test_all(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(argc, argv, NULL, NULL);
> -
> -	setup();
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -		if (ns_uts_fd != -1) {
> -			tst_resm(TINFO, "test_newuts");
> -			test_flag(CLONE_NEWUTS, CLONE_NEWUTS, do_child_newuts);
> -			test_flag(CLONE_NEWUTS, 0, do_child_newuts);
> -		}
> -		if (ns_ipc_fd != -1) {
> -			tst_resm(TINFO, "test_newipc");
> -			test_flag(CLONE_NEWIPC, CLONE_NEWIPC, do_child_newipc);
> -			test_flag(CLONE_NEWIPC, 0, do_child_newipc);
> -		}
> +	int report_tconf = 1;
> +#if defined(CLONE_NEWUTS)
> +	if (ns_uts_fd != -1) {
> +		tst_res(TINFO, "test_newuts");
> +		test_flag(CLONE_NEWUTS, CLONE_NEWUTS, do_child_newuts);
> +		test_flag(CLONE_NEWUTS, 0, do_child_newuts);
>  	}
> -	cleanup();
> -	tst_exit();
> +	report_tconf = 0;
> +#endif
> +#if defined(CLONE_NEWIPC)
> +	if (ns_ipc_fd != -1) {
> +		tst_res(TINFO, "test_newipc");
> +		test_flag(CLONE_NEWIPC, CLONE_NEWIPC, do_child_newipc);
> +		test_flag(CLONE_NEWIPC, 0, do_child_newipc);
> +	}
> +	report_tconf = 0;
> +#endif
> +	if (report_tconf)
> +		tst_brk(TCONF, "CLONE_NEWIPC and CLONE_NEWUTS is not defined");

Can we get rid of these ifdefs as well? If we include the
lapi/namespace_constants.h in the setns.h we can just remove these,
right?

>  }
>  
>  static void setup(void)
>  {
>  	char tmp[PATH_MAX];
>  
> -	tst_require_root();
> -
>  	/* runtime check if syscall is supported */
> -	ltp_syscall(__NR_setns, -1, 0);
> +	tst_syscall(__NR_setns, -1, 0);
>  
>  	/* check if kernel has CONFIG_*_NS set and exports /proc entries */
>  	ns_ipc_fd = get_ns_fd(getpid(), "ipc");
>  	ns_uts_fd = get_ns_fd(getpid(), "uts");
>  	if (ns_ipc_fd == -1 && ns_uts_fd == -1)
> -		tst_brkm(TCONF, NULL, "your kernel has CONFIG_IPC_NS, "
> +		tst_brk(TCONF, "your kernel has CONFIG_IPC_NS, "
>  			"CONFIG_UTS_NS or CONFIG_PROC disabled");
>  
>  	if (getcwd(tmp, PATH_MAX) == NULL)
> -		tst_brkm(TBROK|TERRNO, NULL, "getcwd");
> +		tst_brk(TBROK|TERRNO, "getcwd");
>  	ipc_key = ftok(tmp, 65);
>  	shmid = shmget(ipc_key, getpagesize(), IPC_CREAT | 0666);
>  	if (shmid == -1)
> -		tst_brkm(TBROK|TERRNO, NULL, "shmget");
> -
> -	TEST_PAUSE;
> +		tst_brk(TBROK|TERRNO, "shmget");
>  }
>  
>  static void cleanup(void)
> @@ -216,10 +208,10 @@ static void cleanup(void)
>  
>  	shmctl(shmid, IPC_RMID, NULL);
>  }
> -#else
> -int main(int argc, char *argv[])
> -{
> -	tst_brkm(TCONF, NULL, "__NR_setns, CLONE_NEWIPC or CLONE_NEWUTS "
> -		" is not defined on your system.");
> -}
> -#endif
> +
> +static struct tst_test test = {
> +	.test_all = test_all,
> +	.setup = setup,
> +	.cleanup = cleanup,
> +	.needs_root = 1,
> +};
> -- 
> 2.18.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
