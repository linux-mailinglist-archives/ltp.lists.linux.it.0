Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A1384360084
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 05:31:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5904A3C7185
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 05:31:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A45313C04B0
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 05:30:58 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1A13614004FE
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 05:30:56 +0200 (CEST)
Received: from DGGEML403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FLPvL2XG2zYWpf
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 11:28:46 +0800 (CST)
Received: from dggeml708-chm.china.huawei.com (10.3.17.138) by
 DGGEML403-HUB.china.huawei.com (10.3.17.33) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Thu, 15 Apr 2021 11:30:52 +0800
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml708-chm.china.huawei.com (10.3.17.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Thu, 15 Apr 2021 11:30:52 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2106.013;
 Thu, 15 Apr 2021 11:30:52 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "rpalethorpe@suse.de" <rpalethorpe@suse.de>, Cyril Hrubis <chrubis@suse.cz>
Thread-Topic: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
Thread-Index: AdcxoxeNC5uX6zQtS7uunFo2Xh5LUg==
Date: Thu, 15 Apr 2021 03:30:52 +0000
Message-ID: <7d9792a7d9d742efbbbc567b316417d2@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard, Cyril,

Thanks for your review!

1) I can't agree with you more that correctly written test depends on valid assumptions we can make about the operation system the test is supposed to run on

2)when we use tst_res/tst_brk to print information to STDIO, it seems have not trig kmem allocation, I have checked the kernel log,
there is only one malloc failed log in dmesg info. And we can see the STDIO info is printed as expected. 

3)when we use tst_res/tst_brk to print information to other file, it might trig memory alloction. So, we need remove the calling of tst_res/tst_brk for safety.

I have resubmit the patch according to your review, please see: https://patchwork.ozlabs.org/project/ltp/patch/20210415032911.7542-1-zhaogongyi@huawei.com/


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
> > That's right. I have a Misunderstanding of cgroup.procs. Actrually, we can
> write pid or tgid to cgroup.procs instead of pgid.
> >
> > I'll update the code as:
> >
> > 	SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpid());
> >
> > BTW I find that the testcase run passed on my local system, it seems
> > that tst_* will not trig memory allocation:
> 
> After a short search I found do_tty_write can return ENOMEM due to a
> call to kmalloc with GFP_KERNEL.
> 
> As I said previously stderr can point to many things with different write
> implementations. Some of these are likely to trigger memory allocation.
> Please see my previous reply and suggestion.
> 
> Also please note the warning message in the kernel log when using
> memory.kmem.limit_in_bytes.
> 
> >
> > tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
> > memcg_kmem_limit_in_bytes.c:58: TPASS: fork fail as expected
> > memcg_kmem_limit_in_bytes.c:73: TPASS: kmem alloc is controled by
> > memory.kmem.limit_in_bytes
> >
> > Summary:
> > passed   2
> > failed   0
> > broken   0
> > skipped  0
> > warnings 0
> >
> >
> > Thanks very much!
> >
> > Best Regards,
> > Gongyi
> >
> >>
> >> Hello,
> >>
> >> zhaogongyi <zhaogongyi@huawei.com> writes:
> >>
> >> > Hi Richard,
> >> >
> >> > Calling setpgid in this testcase is aim to make the task group be
> >> controlled by memory.kmem.limit_in_bytes since we have set the pgid
> >> to cgroup.procs.
> >> >
> >>
> >> Please see cgroup_procs_write_start in cgroup/cgroup.c. It calls
> >> find_task_by_vpid which interprets pid as PIDTYPE_PID not
> PIDTYPE_PGID.
> >>
> >> --
> >> Thank you,
> >> Richard.
> 
> 
> --
> Thank you,
> Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
