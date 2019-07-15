Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90869894
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 17:49:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 692453C1D13
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 17:49:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C483C3C1D08
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 17:49:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8987C200ACA
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 17:49:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A7659AD72;
 Mon, 15 Jul 2019 15:49:46 +0000 (UTC)
Date: Mon, 15 Jul 2019 17:49:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190715154945.GA28618@rei>
References: <20190711113405.GA27889@rei.lan>
 <1562907197-2322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1562907197-2322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/prctl06: New test for prctl() with
 PR_{SET, GET}_NO_NEW_PRIVS
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
> +static uid_t nobody_uid;
> +static gid_t nobody_gid;
> +static int flag = 1;
> +
> +static void check_proc_field(int val, char *name)
> +{
> +	int field = 0;
> +	char path[50];
> +
> +	strcpy(path, "/proc/self/status");

Can't we just define PROC_STATUS "/proc/self/status" and use that
instead of copying bytes around at runtime?

> +	TEST(FILE_LINES_SCANF(path, "NoNewPrivs:%d", &field));
> +	if (TST_RET == 1) {
> +		tst_res(TCONF,
> +			"%s doesn't support NoNewPrivs field", path);
> +		flag = 0;
> +		return;
> +	}
> +	if (val == field)
> +		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
> +			name, path, val, field);
> +	else
> +		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
> +			name, path, val, field);
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
> +	char *const argv[] = {"prctl06_execve", "parent process", NULL};
> +	char *const childargv[] = {"prctl06_execve", "child process", NULL};
> +	char *const envp[] = {ipc_env_var, NULL };
> +	int childpid;
> +
> +	check_no_new_privs(0, "parent");
> +
> +	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
> +	if (TST_RET == -1) {
> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_NO_NEW_PRIVS) failed");
> +		return;
> +	}
> +	tst_res(TPASS, "prctl(PR_SET_NO_NEW_PRIVS) succeeded");
> +
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
> +}
> +
> +static void setup(void)
> +{
> +	struct passwd *pw;
> +
> +	pw = SAFE_GETPWNAM("nobody");
> +	nobody_uid = pw->pw_uid;
> +	nobody_gid = pw->pw_gid;
> +
> +	SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
> +	SAFE_CHMOD("prctl06_execve", SUID_MODE);
> +	SAFE_CHOWN("prctl06_execve", 0, 0);

You are actually changing and executing the wrong file here. You are
working directly with the file in the test temporary directory and not
with the file that has been copied over to the mount point.

I guess that we should define BIN_PATH and use it here and also for the
execve() above.

> +	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
> +	if (TST_RET == 0) {
> +		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
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
> index 000000000..92e218020
> --- /dev/null
> +++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
> @@ -0,0 +1,52 @@
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
> +	char path[50];
> +	struct passwd *pw;
> +
> +	pw = SAFE_GETPWNAM("nobody");
> +
> +	tst_reinit();
> +	if (argc != 2)
> +		tst_brk(TFAIL, "argc is %d, expected 2", argc);
> +
> +	strcpy(path, "/proc/self/status");

Here as well, can we use a macro instead?

> +	TEST(getegid());
> +	if (TST_RET == 0)
> +		tst_res(TFAIL,
> +			"%s getegid() returns 0 unexpectedly, it gains root privileges",
> +			argv[1]);
> +	if (TST_RET == pw->pw_gid)
> +		tst_res(TPASS,
> +			"%s getegid() returns nobody, it doesn't gain root privileges",
> +			argv[1]);
> +
> +	TEST(geteuid());
> +	if (TST_RET == 0)
> +		tst_res(TFAIL,
> +			"%s geteuid() returns 0 unexpectedly, it gains root privileges",
> +			argv[1]);
> +	if (TST_RET == pw->pw_uid)
> +		tst_res(TPASS,
> +			"%s geteuid() returns nobody, it doesn't gain root privileges",
> +			argv[1]);
> +
> +	return 0;
> +}

The rest looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
