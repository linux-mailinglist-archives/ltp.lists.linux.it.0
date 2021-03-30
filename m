Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1B34E2FF
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:19:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E66123C258A
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 10:19:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 189E03C2476
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:19:43 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A39E11A00920
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 10:19:02 +0200 (CEST)
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4F8j1j5Bp1zWRR0;
 Tue, 30 Mar 2021 16:15:37 +0800 (CST)
Received: from DGGEML531-MBX.china.huawei.com ([169.254.6.126]) by
 DGGEML404-HUB.china.huawei.com ([fe80::b177:a243:7a69:5ab8%31]) with mapi id
 14.03.0513.000; Tue, 30 Mar 2021 16:18:46 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: "yangx.jy@fujitsu.com" <yangx.jy@fujitsu.com>
Thread-Topic: [LTP] [PATCH] min_kver: Add kernel version requestions
Thread-Index: AdclPUWCVB0ckTDPQrOjP7cNve4wJA==
Date: Tue, 30 Mar 2021 08:18:45 +0000
Message-ID: <F3D3F6AC3820BB4C9FCA340DB5C32CB40389E765@dggeml531-mbx.china.huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] min_kver: Add kernel version requestions
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

Hi Yang,

I have seen the function definition in lapi/preadv2.h or lapi/pwritev2.h, but it seems not enough.

I run the testcases preadv201 and pwritev201 on my qemu, kernel version 4.4, arch is armeb, and report as follows: 

# ./preadv201
tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
preadv201.c:91: TPASS: preadv2() read 64 bytes with content 'a' expectedly
preadv201.c:91: TPASS: preadv2() read 64 bytes with content 'a' expectedly
preadv201.c:91: TPASS: preadv2() read 32 bytes with content 'b' expectedly
preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)
preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)
preadv201.c:64: TFAIL: preadv2() failed: EINVAL (22)

Summary:
passed   3
failed   3
broken   0
skipped  0
warnings 0


# ./pwritev201
tst_test.c:1294: TINFO: Timeout per run is 0h 05m 00s
pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
pwritev201.c:96: TPASS: pwritev2() wrote 64 bytes successfully with content 'a' expectedly
pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)
pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)
pwritev201.c:62: TFAIL: pwritev2() failed: EINVAL (22)

Summary:
passed   3
failed   3
broken   0
skipped  0
warnings 0


See man 2, we known preadv2() and pwritev2() first appeared in Linux 4.6, so I think we need to check kernel version in testcases.

Thanks!

Best Regards,
Gongyi


> Hi Zhongyi,
> 
> Do you get any issue here?
> 
> It is unncessary to add version check because LTP has check the support of
> preadv2/pwritev2:
> 1) Call preadv2/pwritev2 directly if glibc provides it.
> 2) Call syscall(__NR_preadv2/__NR_pwritev2) if glibc doesn't provides
> preadv2/pwritev.
> 3) Report TCONF if kernel doesn't support __NR_preadv2/__NR_pwritev2.
> 
> Please reference "include/lapi/preadv2.h"
> 
> Best Regards,
> Xiao Yang
> On 2021/3/30 15:44, Zhao Gongyi wrote:
> > We need add kernel version requestions sinc preadv2() and pwritev2()
> > first appeared in Linux 4.6.
> >
> > For those:
> > 	testcases/kernel/syscalls/preadv2/preadv201.c
> > 	testcases/kernel/syscalls/pwritev2/pwritev201.c
> >
> > Signed-off-by: Zhao Gongyi<zhaogongyi@huawei.com>
> > ---
> >   testcases/kernel/syscalls/preadv2/preadv201.c   | 1 +
> >   testcases/kernel/syscalls/pwritev2/pwritev201.c | 1 +
> >   2 files changed, 2 insertions(+)
> >
> > diff --git a/testcases/kernel/syscalls/preadv2/preadv201.c
> > b/testcases/kernel/syscalls/preadv2/preadv201.c
> > index 91e2b9889..e8220f94c 100644
> > --- a/testcases/kernel/syscalls/preadv2/preadv201.c
> > +++ b/testcases/kernel/syscalls/preadv2/preadv201.c
> > @@ -111,6 +111,7 @@ static void cleanup(void)
> >   }
> >
> >   static struct tst_test test = {
> > +	.min_kver = "4.6",
> >   	.tcnt = ARRAY_SIZE(tcases),
> >   	.setup = setup,
> >   	.cleanup = cleanup,
> > diff --git a/testcases/kernel/syscalls/pwritev2/pwritev201.c
> > b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> > index eba45b7d3..a8273e59d 100644
> > --- a/testcases/kernel/syscalls/pwritev2/pwritev201.c
> > +++ b/testcases/kernel/syscalls/pwritev2/pwritev201.c
> > @@ -111,6 +111,7 @@ static void cleanup(void)
> >   }
> >
> >   static struct tst_test test = {
> > +	.min_kver = "4.6",
> >   	.tcnt = ARRAY_SIZE(tcases),
> >   	.setup = setup,
> >   	.cleanup = cleanup,
> > --
> > 2.17.1
> >
> >

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
