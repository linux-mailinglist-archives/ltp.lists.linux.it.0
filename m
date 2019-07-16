Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EE56A1D3
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:33:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 203D73C1D0A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 07:33:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id ABAEE3C1808
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:32:58 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id A90C61A0065C
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 07:32:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,496,1557158400"; d="scan'208";a="71540891"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Jul 2019 13:32:50 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id D94464CDDB0D;
 Tue, 16 Jul 2019 13:32:49 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 16 Jul 2019 13:32:53 +0800
Message-ID: <5D2D6180.6040105@cn.fujitsu.com>
Date: Tue, 16 Jul 2019 13:32:48 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190711113405.GA27889@rei.lan>
 <1562907197-2322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190715154945.GA28618@rei>
In-Reply-To: <20190715154945.GA28618@rei>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: D94464CDDB0D.A10D6
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


> Hi!
>> +static uid_t nobody_uid;
>> +static gid_t nobody_gid;
>> +static int flag = 1;
>> +
>> +static void check_proc_field(int val, char *name)
>> +{
>> +	int field = 0;
>> +	char path[50];
>> +
>> +	strcpy(path, "/proc/self/status");
> Can't we just define PROC_STATUS "/proc/self/status" and use that
> instead of copying bytes around at runtime?
>
Hi

Yes. I move PROC_STATUS and check functions into prctl06.h because we also need to check field after execve.
Please see my v4 patch.

>> +	TEST(FILE_LINES_SCANF(path, "NoNewPrivs:%d",&field));
>> +	if (TST_RET == 1) {
>> +		tst_res(TCONF,
>> +			"%s doesn't support NoNewPrivs field", path);
>> +		flag = 0;
>> +		return;
>> +	}
>> +	if (val == field)
>> +		tst_res(TPASS, "%s %s NoNewPrivs field expected %d got %d",
>> +			name, path, val, field);
>> +	else
>> +		tst_res(TFAIL, "%s %s NoNewPrivs field expected %d got %d",
>> +			name, path, val, field);
>> +}
>> +
>> +static void check_no_new_privs(int val, char *name)
>> +{
>> +	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
>> +	if (TST_RET == val)
>> +		tst_res(TPASS,
>> +			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %d",
>> +			name, val, val);
>> +	else
>> +		tst_res(TFAIL,
>> +			"%s prctl(PR_GET_NO_NEW_PRIVS) expected %d got %ld",
>> +			name, val, TST_RET);
>> +	if (flag)
>> +		check_proc_field(val, name);
>> +}
>> +
>> +static void do_prctl(void)
>> +{
>> +	char ipc_env_var[1024];
>> +	char *const argv[] = {"prctl06_execve", "parent process", NULL};
>> +	char *const childargv[] = {"prctl06_execve", "child process", NULL};
>> +	char *const envp[] = {ipc_env_var, NULL };
>> +	int childpid;
>> +
>> +	check_no_new_privs(0, "parent");
>> +
>> +	TEST(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0));
>> +	if (TST_RET == -1) {
>> +		tst_res(TFAIL | TTERRNO, "prctl(PR_SET_NO_NEW_PRIVS) failed");
>> +		return;
>> +	}
>> +	tst_res(TPASS, "prctl(PR_SET_NO_NEW_PRIVS) succeeded");
>> +
>> +	SAFE_SETGID(nobody_gid);
>> +	SAFE_SETUID(nobody_uid);
>> +
>> +	sprintf(ipc_env_var, IPC_ENV_VAR "=%s", getenv(IPC_ENV_VAR));
>> +
>> +	childpid = SAFE_FORK();
>> +	if (childpid == 0) {
>> +		check_no_new_privs(1, "child");
>> +		execve("prctl06_execve", childargv, envp);
>> +		tst_brk(TFAIL | TTERRNO,
>> +			"child process failed to execute prctl_execve");
>> +
>> +	} else {
>> +		tst_reap_children();
>> +		check_no_new_privs(1, "parent");
>> +		execve("prctl06_execve", argv, envp);
>> +		tst_brk(TFAIL | TTERRNO,
>> +			"parent process failed to execute prctl_execve");
>> +	}
>> +}
>> +
>> +static void verify_prctl(void)
>> +{
>> +	int pid;
>> +
>> +	pid = SAFE_FORK();
>> +	if (pid == 0) {
>> +		do_prctl();
>> +		exit(0);
>> +	}
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	struct passwd *pw;
>> +
>> +	pw = SAFE_GETPWNAM("nobody");
>> +	nobody_uid = pw->pw_uid;
>> +	nobody_gid = pw->pw_gid;
>> +
>> +	SAFE_CP(TESTBIN, TEST_REL_BIN_DIR);
>> +	SAFE_CHMOD("prctl06_execve", SUID_MODE);
>> +	SAFE_CHOWN("prctl06_execve", 0, 0);
> You are actually changing and executing the wrong file here. You are
> working directly with the file in the test temporary directory and not
> with the file that has been copied over to the mount point.
>
> I guess that we should define BIN_PATH and use it here and also for the
> execve() above.
Yes .

>> +	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
>> +	if (TST_RET == 0) {
>> +		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
>> +		return;
>> +	}
>> +
>> +	if (TST_ERR == EINVAL)
>> +		tst_brk(TCONF,
>> +			"kernel doesn't support PR_GET/SET_NO_NEW_PRIVS");
>> +
>> +	tst_brk(TBROK | TTERRNO,
>> +		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
>> +}
>> +
>> +static const char *const resfile[] = {
>> +	TESTBIN,
>> +	NULL,
>> +};
>> +
>> +static struct tst_test test = {
>> +	.resource_files = resfile,
>> +	.setup = setup,
>> +	.test_all = verify_prctl,
>> +	.forks_child = 1,
>> +	.needs_root = 1,
>> +	.mount_device = 1,
>> +	.mntpoint = MNTPOINT,
>> +	.child_needs_reinit = 1,
>> +};
>> diff --git a/testcases/kernel/syscalls/prctl/prctl06_execve.c b/testcases/kernel/syscalls/prctl/prctl06_execve.c
>> new file mode 100644
>> index 000000000..92e218020
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/prctl/prctl06_execve.c
>> @@ -0,0 +1,52 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2019 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> + *
>> + * dummy program which is used by prctl06 testcase
>> + */
>> +#define TST_NO_DEFAULT_MAIN
>> +#include<stdlib.h>
>> +#include<sys/types.h>
>> +#include<unistd.h>
>> +#include<errno.h>
>> +#include<pwd.h>
>> +#include<stdio.h>
>> +#include<string.h>
>> +#include "tst_test.h"
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	char path[50];
>> +	struct passwd *pw;
>> +
>> +	pw = SAFE_GETPWNAM("nobody");
>> +
>> +	tst_reinit();
>> +	if (argc != 2)
>> +		tst_brk(TFAIL, "argc is %d, expected 2", argc);
>> +
>> +	strcpy(path, "/proc/self/status");
> Here as well, can we use a macro instead?
Yes

>> +	TEST(getegid());
>> +	if (TST_RET == 0)
>> +		tst_res(TFAIL,
>> +			"%s getegid() returns 0 unexpectedly, it gains root privileges",
>> +			argv[1]);
>> +	if (TST_RET == pw->pw_gid)
>> +		tst_res(TPASS,
>> +			"%s getegid() returns nobody, it doesn't gain root privileges",
>> +			argv[1]);
>> +
>> +	TEST(geteuid());
>> +	if (TST_RET == 0)
>> +		tst_res(TFAIL,
>> +			"%s geteuid() returns 0 unexpectedly, it gains root privileges",
>> +			argv[1]);
>> +	if (TST_RET == pw->pw_uid)
>> +		tst_res(TPASS,
>> +			"%s geteuid() returns nobody, it doesn't gain root privileges",
>> +			argv[1]);
>> +
>> +	return 0;
>> +}
> The rest looks good.
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
