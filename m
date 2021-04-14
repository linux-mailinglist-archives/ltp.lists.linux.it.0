Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000B35EF2E
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:19:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E946B3C70F0
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:19:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDEDE3C0196
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:19:40 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id EF6E12005FB
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:19:36 +0200 (CEST)
Received: from DGGEML402-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FKwK72GNjz14HMj
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 16:15:55 +0800 (CST)
Received: from DGGEML424-HUB.china.huawei.com (10.1.199.41) by
 DGGEML402-HUB.china.huawei.com (10.3.17.38) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 14 Apr 2021 16:19:33 +0800
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 dggeml424-hub.china.huawei.com ([10.1.199.41]) with mapi id 14.03.0513.000;
 Wed, 14 Apr 2021 16:19:24 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "rpalethorpe@suse.de" <rpalethorpe@suse.de>
Thread-Topic: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
Thread-Index: AdcxBtp8mqAN57aISLqu5uJzHn3Wbw==
Date: Wed, 14 Apr 2021 08:19:23 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B50C0@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

Calling setpgid in this testcase is aim to make the task group be controlled by memory.kmem.limit_in_bytes since we have set the pgid to cgroup.procs.

In this testcase, memory cgroup is just effective for the task group of cgroup.procs. it is no affection for the parent process as expect.

So if fork success, we can use tst_* and would not be failed, otherwise, we can use tst_* since it is in parent process.

I don't know if I express it clearly.


Thanks very much!

Best Regards,
Gongyi

> 
> Hello,
> 
> zhaogongyi <zhaogongyi@huawei.com> writes:
> 
> > Hi Richard,
> >
> > Thanks so much for your review!
> >
> >> >> > +	pid = SAFE_FORK();
> >> >> > +	if (!pid) {
> >> >> > +		SAFE_SETPGID(0, 0);
> >> >> > +
> >> >> > +		SAFE_FILE_PRINTF(KMEM_LIMIT_IN_BYTES, "%d", 0);
> >> >> > +
> >> >> > +		SAFE_FILE_PRINTF(CGROUP_PROCS, "%d",
> getpgid(getpid()));
> >> >>
> >> >> After setting this we should avoid doing any work in this process
> >> >> except calling fork. AFAIK there is no guarantee that some other
> >> >> syscall or tasklet etc. Won't try to allocate memory and also fail.
> >> >>
> >> >
> >> > It seems that we would not be afraid since there is no asynchronous
> >> > operation in the test process.
> >>
> >> IIRC one of the problems with tasklets is they can run in any
> >> process. Also, in theory stdout can point to anything. So write() might
> allocate memory.
> >>
> >> Why not do something like:
> >>
> >> SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid())); errno = 0;
> >> fork(); exit(errno);
> >>
> >> Then check that errno == ENOMEM, in the parent process?
> >>
> >>
> >>> > +		TEST(fork());
> >>> > +		if (TST_RET == -1) {
> >>> > +			if (TST_ERR == ENOMEM)
> >>> > +				tst_res(TPASS, "fork fail as expected");
> >>> > +			else
> >>> > +				tst_brk(TFAIL | TTERRNO,
> >>> > +					"fork fail as unexpected");
> >
> > As far as my personal understanding, after setpgid, the controlled
> > process is the sub process whose process id is pid, excluded from the
> parent process, and the functions tst_res or tst_brk Is executed in its
> parent process.
> 
> setpgid(0, 0) sets the process group id (pgid) to be the same as the (pid),
> which creates a new process group. This probably has the effect that the
> calling process will not recieve signals from the terminal. Also it should
> receive SIGTTOU when calling tst_res and tst_brk, if stdout/stderr point to
> a terminal with the right configuration.
> 
> AFAICT process groups are for shells and affect where signals are sent.
> Nothing else.
> 
> >
> > In this case, is it no affection to this test?
> >
> >
> > Best Regards,
> > Gongyi
> 
> 
> --
> Thank you,
> Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
