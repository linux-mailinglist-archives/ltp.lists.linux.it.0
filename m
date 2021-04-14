Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EA35F350
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 14:18:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 195ED3C70DB
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 14:18:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C58F33C1B0E
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 14:18:25 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9BFB21000D3A
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 14:18:23 +0200 (CEST)
Received: from dggeml405-hub.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FL1fM39ZkzYWgG
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 20:16:11 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.205]) by
 dggeml405-hub.china.huawei.com ([10.3.17.49]) with mapi id 14.03.0513.000;
 Wed, 14 Apr 2021 20:18:09 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "rpalethorpe@suse.de" <rpalethorpe@suse.de>
Thread-Topic: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
Thread-Index: AdcxJj2oA3h5mj3UQoyO1c4Vsjzfwg==
Date: Wed, 14 Apr 2021 12:18:08 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B5467@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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

That's right. I have a Misunderstanding of cgroup.procs. Actrually, we can write pid or tgid to cgroup.procs instead of pgid.

I'll update the code as:

	SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpid());

BTW I find that the testcase run passed on my local system, it seems that tst_* will not trig memory allocation:

tst_test.c:1291: TINFO: Timeout per run is 0h 05m 00s
memcg_kmem_limit_in_bytes.c:58: TPASS: fork fail as expected
memcg_kmem_limit_in_bytes.c:73: TPASS: kmem alloc is controled by memory.kmem.limit_in_bytes

Summary:
passed   2
failed   0
broken   0
skipped  0
warnings 0


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
> > Calling setpgid in this testcase is aim to make the task group be
> controlled by memory.kmem.limit_in_bytes since we have set the pgid to
> cgroup.procs.
> >
> 
> Please see cgroup_procs_write_start in cgroup/cgroup.c. It calls
> find_task_by_vpid which interprets pid as PIDTYPE_PID not PIDTYPE_PGID.
> 
> --
> Thank you,
> Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
