Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE996456B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 12:52:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F9953C1C7C
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 12:52:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4B2853C07AD
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 12:52:11 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CCF1B60042E
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 12:52:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9BF8AF3E;
 Wed, 10 Jul 2019 10:52:08 +0000 (UTC)
Date: Wed, 10 Jul 2019 12:52:07 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190710105207.GC30934@rei.lan>
References: <20190709105303.GA4914@rei.lan>
 <1562366936-26456-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562366936-26456-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RESEND] syscalls/prctl06.c: New test for prctl()
 with PR_{SET, GET}_NO_NEW_PRIVS
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
>  pread01 pread01
>  pread01_64 pread01_64
> diff --git a/testcases/kernel/syscalls/prctl/.gitignore b/testcases/kernel/syscalls/prctl/.gitignore
> index 9ecaf9854..f52f6f665 100644
> --- a/testcases/kernel/syscalls/prctl/.gitignore
> +++ b/testcases/kernel/syscalls/prctl/.gitignore
> @@ -3,3 +3,4 @@
>  /prctl03
>  /prctl04
>  /prctl05
> +/prctl06

Missing prctl06_execve

> diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
> new file mode 100644
> index 000000000..9dd82a241
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl06.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * Test PR_GET_NO_NEW_PRIVS and PR_SET_NO_NEW_PRIVS of prctl(2).
> + *
> + * 1)Return the value of the no_new_privs bit for the calling thread.
> + *  A value of 0 indicates the regular execve(2) behavior.  A value of
> + *  1 indicates execve(2) will operate in the privilege-restricting mode.
> + * 2)With no_new_privs set to 1, diables privilege granting operations
> + *  at execve-time. For example, a process will not be able to execute a
> + *  setuid binary to change their uid or gid if this bit is set. The same
> + *  is true for file capabilities.
> + * 3)The setting of this bit is inherited by children created by fork(2).
> + *  We also check NoNewPrivs field in /proc/[pid]/status if it supports.
> + */
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <sys/prctl.h>
> +#include <pwd.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <sys/capability.h>
> +#include <lapi/prctl.h>
> +#include "tst_test.h"
> +
> +#define IPC_ENV_VAR        "LTP_IPC_PATH"
> +#define MNTPOINT           "mntpoint"
> +#define TESTBIN            "prctl06_execve"
> +#define TEST_REL_BIN_DIR   MNTPOINT"/"
> +#define SUID_MODE          (S_ISUID|S_ISGID|S_IXUSR|S_IXGRP|S_IXOTH)
> +
> +static int flag = 1;
> +static char CapEff[20];
> +
> +static void check_proc_field(int val, char *name)
> +{
> +	char path[50];
> +	pid_t pid;
> +	int field = 0;

Also it would be a bit cleaner if we do:

	if (flag)
		return;

here and called the function unconditionaly down below.

> +	pid = getpid();
> +	sprintf(path, "/proc/%d/status", pid);
                       ^
		       /proc/self/status ?

> +	TEST(FILE_LINES_SCANF(path, "NoNewPrivs:%d", &field));
> +	if (TST_RET == 1) {
> +		tst_res(TCONF,
> +			"/proc/[pid]/status doesn't support NoNewPrivs field");
> +		flag = 0;
> +		return;
> +	}
> +	if (val == field)
> +		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
> +			name, path, val, field);
> +	else
> +		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
> +			name, path, val, field);
> +
> +	SAFE_FILE_LINES_SCANF(path, "CapEff:%s", CapEff);
> +}
> +
> +static void check_no_new_privs(int val, char *name)
> +{
> +	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
> +	if (TST_RET == val)
> +		tst_res(TPASS,
> +			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %d",
> +			name, val, val);
> +	else
> +		tst_res(TFAIL,
> +			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
> +			name, val, TST_RET);
> +	if (flag)
> +		check_proc_field(val, name);
> +}
> +
> +static void do_prctl(void)
> +{
> +	char ipc_env_var[1024];
> +	char *const argv[] = {"prctl06_execve", "parent process", CapEff, NULL};
> +	char *const childargv[] = {"prctl06_execve", "child process", CapEff, NULL};
> +	char *const envp[] = {"LTP_TEST_ENV_VAR=test", ipc_env_var, NULL };
                                ^
				This is not really needed here. We use
				that only in the execve tests...
> +	int childpid;
> +	struct passwd *pw;
> +	uid_t nobody_uid;
> +	gid_t nobody_gid;
> +
> +	pw = SAFE_GETPWNAM("nobody");
> +	nobody_uid = pw->pw_uid;
> +	nobody_gid = pw->pw_gid;
          ^
	  This can be done once in test setup

> +	check_no_new_privs(0, "parent");
> +	tst_res(TINFO,
> +		"parent process CapEff %s when no new privs was 0", CapEff);
> +
> +	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_NO_NEW_PRIVS) failed");
> +		return;
> +	}
> +	tst_res(TPASS, "prctl(PR_SET_NO_NEW_PRIVS) succeeded");
> +
> +	SAFE_CHMOD("prctl06_execve", SUID_MODE);
         ^
	 This can be done in setup() as well.

> +	SAFE_SETGID(nobody_gid);
> +	SAFE_SETUID(nobody_uid);
> +
> +	sprintf(ipc_env_var, IPC_ENV_VAR "=%s", getenv(IPC_ENV_VAR));
> +
> +	childpid = SAFE_FORK();
> +	if (childpid == 0) {
> +		check_no_new_privs(1, "child");
> +		execve("prctl06_execve", childargv, envp);
> +		tst_brk(TFAIL | TTERRNO,
> +			"child process failed to execute prctl_execve");
> +
> +	} else {
> +		tst_reap_children();
> +		check_no_new_privs(1, "parent");
> +		tst_res(TINFO,
> +			"parent process CapEff %s when no new privs was 1", CapEff);
> +		execve("prctl06_execve", argv, envp);
> +		tst_brk(TFAIL | TTERRNO,
> +			"parent process failed to execute prctl_execve");
> +	}
> +}
> +
> +static void verify_prctl(void)
> +{
> +	int pid;
> +
> +	pid = SAFE_FORK();
> +	if (pid == 0) {
> +		do_prctl();
> +		exit(0);
> +	}
> +	tst_reap_children();

No need to reap children here if you do exit(0) the library will reap
them for you.

> +}
> +
> +static void setup(void)
> +{
> +	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
> +	if (TST_RET == 0) {
> +		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
> +		SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
> +		return;
> +	}
> +
> +	if (TST_ERR == EINVAL)
> +		tst_brk(TCONF,
> +			"kernel doesn't support PR_GET/SET_NO_NEW_PRIVS");
> +
> +	tst_brk(TBROK | TTERRNO,
> +		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
> +}
> +
> +static const char *const resfile[] = {
> +	TESTBIN,
> +	NULL,
> +};
> +
> +static struct tst_test test = {
> +	.resource_files = resfile,
> +	.setup = setup,
> +	.test_all = verify_prctl,
> +	.forks_child = 1,
> +	.needs_root = 1,
> +	.mount_device = 1,
> +	.mntpoint = MNTPOINT,
> +	.child_needs_reinit = 1,
> +};
> diff --git a/testcases/kernel/syscalls/prctl/prctl06_execve.c b/testcases/kernel/syscalls/prctl/prctl06_execve.c
> new file mode 100644
> index 000000000..6b256afae
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
> @@ -0,0 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
> + * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> + *
> + * dummy program which is used by prctl06 testcase
> + */
> +#define TST_NO_DEFAULT_MAIN
> +#include <stdlib.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <errno.h>
> +#include <pwd.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include "tst_test.h"
> +
> +int main(int argc, char **argv)
> +{
> +	struct passwd *pw;
> +	uid_t unknown_uid;
> +	gid_t unknown_gid;
> +	char path[50];
> +	char CapEff[20];
> +	pid_t pid;
> +
> +	tst_reinit();
> +	if (argc != 3)
> +		tst_brk(TFAIL, "argc is %d, expected 3", argc);
> +
> +	pid = getpid();
> +	sprintf(path, "/proc/%d/status", pid);
                        ^
			/proc/self/status

> +	SAFE_FILE_LINES_SCANF(path, "CapEff:%s", CapEff);
> +
> +	if (strncmp(CapEff, argv[2], sizeof(CapEff)))
> +		tst_res(TFAIL,
> +			"%s gains root privileges, current CapEff %s, expect %s",
> +			argv[1], CapEff, argv[2]);
> +	else
> +		tst_res(TPASS,
> +			"%s doesn't gain root privileges, CapEff %s",
> +			argv[1], CapEff);
> +
> +	pw = SAFE_GETPWNAM("nobody");
> +	unknown_uid = pw->pw_uid + 1;
> +	unknown_gid = pw->pw_gid + 1;
> +
> +	TEST(setgid(unknown_gid));
> +	if (TST_RET == -1)
> +		tst_res(TPASS,
> +			"%s setgid(%d) isn't permmit", argv[1], unknown_gid);
> +	else
> +		tst_res(TFAIL, "%s setgid(%d) succeed expectedly",
> +			argv[1], unknown_gid);
> +
> +	TEST(setuid(unknown_uid));
> +	if (TST_RET == -1)
> +		tst_res(TPASS,
> +			"%s setuid(%d) isn't permmit", argv[1], unknown_uid);
> +	else
> +		tst_res(TFAIL, " %s setuid(%d) succeed unexpectedly",
> +			argv[1], unknown_gid);

We are executing setuid binary that was created by root here so
shouldn't we just check that getuid() and getgid() returns 0?

I guess that we can also chown the file to uid=0 and gid=0 once it has
been copied to be 100% sure that the ids are correct in the test setup.

> +	return 0;
> +}

Otherwise the test looks very good.


Also I guess that we need another test that would set the prctl value
and check that it cannot be unset. If you are going to do that please do
that in a separate file, this one is complex enough...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
