Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A77135E094
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 15:50:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D04F83C7216
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 15:50:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD12F3C71D9
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 15:50:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C26F51400255
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 15:50:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10D8DAF75;
 Tue, 13 Apr 2021 13:50:07 +0000 (UTC)
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B49D0@dggeml531-mbx.china.huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: zhaogongyi <zhaogongyi@huawei.com>
In-reply-to: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B49D0@dggeml531-mbx.china.huawei.com>
Date: Tue, 13 Apr 2021 14:50:05 +0100
Message-ID: <87lf9m2t0y.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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
Reply-To: rpalethorpe@suse.de
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

zhaogongyi <zhaogongyi@huawei.com> writes:

> Hi Richard,
>
> Yes, I will pay attention on your patchs about cgroup API.
>
>> > +static void run(void)
>> > +{
>> > +	pid_t pid;
>> > +	int st;
>> > +
>> > +	pid = SAFE_FORK();
>> > +	if (!pid) {
>> > +		SAFE_SETPGID(0, 0);
>> > +
>> > +		SAFE_FILE_PRINTF(KMEM_LIMIT_IN_BYTES, "%d", 0);
>> > +
>> > +		SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid()));
>> 
>> After setting this we should avoid doing any work in this process except
>> calling fork. AFAIK there is no guarantee that some other syscall or tasklet
>> etc. Won't try to allocate memory and also fail.
>>
>
> It seems that we would not be afraid since there is no asynchronous
> operation in the test process.

IIRC one of the problems with tasklets is they can run in any
process. Also, in theory stdout can point to anything. So write() might
allocate memory.

Why not do something like:

SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid()));
errno = 0;
fork();
exit(errno);

Then check that errno == ENOMEM, in the parent process?

>
>
>> > +		TEST(fork());
>> > +		if (TST_RET == -1) {
>> > +			if (TST_ERR == ENOMEM)
>> > +				tst_res(TPASS, "fork fail as expected");
>> > +			else
>> > +				tst_brk(TFAIL | TTERRNO,
>> > +					"fork fail as unexpected");
>> 
>> This should be "fork failed with unexpected error".
>
> It's right. Thanks for your review.

Thanks :-)

>
> Best Regards,
> Gongyi
>
>
>> 
>> Hello,
>> 
>> Zhao Gongyi <zhaogongyi@huawei.com> writes:
>> 
>> > Add memory cgroup testcase for checking that kmem overflow is
>> > controlled by kmem.limit_in_bytes.
>> 
>> I am currently working on a new LTP CGroups API, please see:
>> https://patchwork.ozlabs.org/project/ltp/list/?series=238773
>> 
>> If the new API is merged quickly, then this test will need to be converted
>> to it. Also please see comments below.
>> 
>> >
>> > Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
>> > ---
>> > v1->v2:
>> > 	1) add testcase to runtest/controllers
>> > 	2) add testcase to testcases/kernel/controllers/memcg/.gitignore
>> > ---
>> >  runtest/controllers                           |  1 +
>> >  testcases/kernel/controllers/memcg/.gitignore |  1 +
>> >  .../functional/memcg_kmem_limit_in_bytes.c    | 87
>> +++++++++++++++++++
>> >  3 files changed, 89 insertions(+)
>> >  create mode 100644
>> >
>> testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in_b
>> yte
>> > s.c
>> >
>> > diff --git a/runtest/controllers b/runtest/controllers index
>> > e3d0243f1..f13a112c7 100644
>> > --- a/runtest/controllers
>> > +++ b/runtest/controllers
>> > @@ -15,6 +15,7 @@ memcg_use_hierarchy
>> 	memcg_use_hierarchy_test.sh
>> >  memcg_usage_in_bytes	memcg_usage_in_bytes_test.sh
>> >  memcg_stress		memcg_stress_test.sh
>> >  memcg_control		memcg_control_test.sh
>> > +memcg_kmem_limit_in_bytes memcg_kmem_limit_in_bytes
>> >
>> >  cgroup_fj_function_debug cgroup_fj_function.sh debug
>> > cgroup_fj_function_cpuset cgroup_fj_function.sh cpuset diff --git
>> > a/testcases/kernel/controllers/memcg/.gitignore
>> > b/testcases/kernel/controllers/memcg/.gitignore
>> > index c0b6d0714..dce8412de 100644
>> > --- a/testcases/kernel/controllers/memcg/.gitignore
>> > +++ b/testcases/kernel/controllers/memcg/.gitignore
>> > @@ -1,5 +1,6 @@
>> >  /control/mem_process
>> >  /functional/memcg_process
>> > +/functional/memcg_kmem_limit_in_bytes
>> >  /regression/memcg_test_1
>> >  /regression/memcg_test_2
>> >  /regression/memcg_test_3
>> > diff --git
>> >
>> a/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in
>> _by
>> > tes.c
>> >
>> b/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_in
>> _by
>> > tes.c
>> > new file mode 100644
>> > index 000000000..61f3f6fd5
>> > --- /dev/null
>> > +++
>> b/testcases/kernel/controllers/memcg/functional/memcg_kmem_limit_i
>> > +++ n_bytes.c
>> > @@ -0,0 +1,87 @@
>> > +// SPDX-License-Identifier: GPL-2.0-or-later
>> > +/*
>> > + * Copyright (c) 2021 HUAWEI LIMITED
>> > + * Author: Zhao Gongyi <zhaogongyi@huawei.com>  */
>> > +
>> > +/*\
>> > + * [Description]
>> > + * Check that kmem overflow is controlled by kmem.limit_in_bytes.
>> > + *
>> > + * [Algorithm]
>> > + * 1) mount memory cgroup
>> > + * 2) set 0 to memory.kmem.limit_in_bytes
>> > + * 3) set test process group to cgroup.procs
>> > + * 4) fork in test process group to trig kmem overflow  */
>> > +
>> > +#include <sys/wait.h>
>> > +#include "tst_test.h"
>> > +
>> > +#define MNT_POINT "memcg"
>> > +#define TESTDIR "memcg/ltpmemcg"
>> > +#define CGROUP_PROCS "memcg/ltpmemcg/cgroup.procs"
>> > +#define KMEM_LIMIT_IN_BYTES
>> "memcg/ltpmemcg/memory.kmem.limit_in_bytes"
>> > +
>> > +static void cleanup(void)
>> > +{
>> > +	SAFE_RMDIR(TESTDIR);
>> > +	SAFE_UMOUNT(MNT_POINT);
>> > +	SAFE_RMDIR(MNT_POINT);
>> > +}
>> > +
>> > +static void setup(void)
>> > +{
>> > +	SAFE_MKDIR(MNT_POINT, 0755);
>> > +	SAFE_MOUNT("memcg", MNT_POINT, "cgroup", 0, "memory");
>> > +	SAFE_MKDIR(TESTDIR, 0755);
>> > +}
>> > +
>> > +static void run(void)
>> > +{
>> > +	pid_t pid;
>> > +	int st;
>> > +
>> > +	pid = SAFE_FORK();
>> > +	if (!pid) {
>> > +		SAFE_SETPGID(0, 0);
>> > +
>> > +		SAFE_FILE_PRINTF(KMEM_LIMIT_IN_BYTES, "%d", 0);
>> > +
>> > +		SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid()));
>> 
>> After setting this we should avoid doing any work in this process except
>> calling fork. AFAIK there is no guarantee that some other syscall or tasklet
>> etc. Won't try to allocate memory and also fail.
>> 
>> > +
>> > +		TEST(fork());
>> > +		if (TST_RET == -1) {
>> > +			if (TST_ERR == ENOMEM)
>> > +				tst_res(TPASS, "fork fail as expected");
>> > +			else
>> > +				tst_brk(TFAIL | TTERRNO,
>> > +					"fork fail as unexpected");
>> 
>> This should be "fork failed with unexpected error".
>> 
>> > +		} else if (TST_RET == 0) {
>> > +			tst_brk(TFAIL, "fork success as unexpected");
>> > +		} else {
>> > +			SAFE_WAIT(NULL);
>> > +			tst_brk(TFAIL, "fork success as unexpected");
>> > +		}
>> > +	} else {
>> > +		SAFE_WAIT(&st);
>> > +		if (WIFEXITED(st))
>> > +			if (!WEXITSTATUS(st)) {
>> > +				tst_res(TPASS, "kmem alloc is controled "
>> > +					"by memory.kmem.limit_in_bytes");
>> > +				return;
>> > +			}
>> > +
>> > +		tst_res(TFAIL,"kmem alloc is not controled "
>> > +			"by memory.kmem.limit_in_bytes");
>> > +	}
>> > +}
>> > +
>> > +static struct tst_test test = {
>> > +	.needs_root = 1,
>> > +	.needs_tmpdir = 1,
>> > +	.forks_child = 1,
>> > +	.setup = setup,
>> > +	.test_all = run,
>> > +	.cleanup = cleanup,
>> > +};
>> > --
>> > 2.17.1
>> 
>> 
>> --
>> Thank you,
>> Richard.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
