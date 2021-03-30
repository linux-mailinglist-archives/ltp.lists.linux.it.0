Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568834DDD8
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 03:58:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 12EF33C8CFE
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 03:58:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D83E53C25B5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 03:58:34 +0200 (CEST)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id BF1F5200AD4
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 03:58:32 +0200 (CEST)
Received: from dggeml406-hub.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4F8Xc84mf5z5k6g;
 Tue, 30 Mar 2021 09:56:24 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.126]) by
 dggeml406-hub.china.huawei.com ([10.3.17.50]) with mapi id 14.03.0513.000;
 Tue, 30 Mar 2021 09:58:20 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
Thread-Index: AdclCByf6oZyis7MRiGNj+RIFBjtDA==
Date: Tue, 30 Mar 2021 01:58:20 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E550@dggeml531-mbx.china.huawei.com>
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
Subject: Re: [LTP] [PATCH] syscalls/shmctl04: Add kernel version requestions
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

Hi Xu,

It looks good to me.

On the other hand, msgctl06.c, semctl09.c have the same problem for MSG_STAT_ANY and SEM_STAT_ANY,  we can also fix them similarly?

Thanks!

Best Regards,
Gongyi

> 
> Hi Gongyi
> > SHM_STAT_ANY is imported to linux in v4.17.
> >
> > Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> > ---
> >   testcases/kernel/syscalls/ipc/shmctl/shmctl04.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> > b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> > index 9e8ec4199..18ac8ba0a 100644
> > --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> > +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> > @@ -168,6 +168,7 @@ static void cleanup(void)
> >   }
> >
> >   static struct tst_test test = {
> > +	.min_kver = "4.17",
> Some linux distribution such as centos7.8 has backported this feature, so
> we should call SHM_STAT_ANY directly to detect whether kernel supports
> SHM_STAT_ANY instead of using min_kver.
> 
> code as below:
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl04.c
> @@ -155,10 +155,19 @@ static void verify_shminfo(unsigned int n)
>   static void setup(void)
>   {
>          struct passwd *ltpuser = SAFE_GETPWNAM("nobody");
> +       struct shmid_ds temp_ds;
>          nobody_uid = ltpuser->pw_uid;
>          root_uid = 0;
> 
>          shm_id = SAFE_SHMGET(IPC_PRIVATE, SHM_SIZE, IPC_CREAT |
> SHM_RW);
> +       TEST(shmctl(shm_id, SHM_STAT_ANY, &temp_ds));
> +       if (TST_RET == -1) {
> +               if (TST_ERR == EINVAL)
> +                       tst_brk(TCONF, "kernel doesn't support
> SHM_STAT_ANY");
> +               else
> +                       tst_brk(TBROK | TTERRNO,
> +                               "Current environment doesn't permit
> SHM_STAT_ANY");
> +       }
>   }
> 
> 
> Also, On your environment, does semctl09.c/msgctl06.c have the same
> problem?
> 
> >   	.setup = setup,
> >   	.cleanup = cleanup,
> >   	.test = verify_shminfo,
> > --
> > 2.17.1
> >
> >

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
