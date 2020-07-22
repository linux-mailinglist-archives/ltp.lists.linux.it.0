Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D402295CE
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 12:15:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 458EC3C4D9F
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 12:15:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A36623C266B
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 12:15:55 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A0EC41401216
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 12:15:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="96744758"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jul 2020 18:15:51 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 0FF024CE506E;
 Wed, 22 Jul 2020 18:15:51 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Jul 2020 18:15:51 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200708140034.GD7276@yuki.lan>
 <1594363189-20972-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200722094502.GB2319@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <13f6db1e-f1b6-1465-b34d-ae418ead2558@cn.fujitsu.com>
Date: Wed, 22 Jul 2020 18:15:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722094502.GB2319@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 0FF024CE506E.A147C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/ioctl_loop06: Using
 LOOP_CONFIGURE to test invalid block size
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

Hi Cyril

> Hi!
> Do we really need to close and open the dev_fd repeatedly and also we
> don't have to attach the device in the test setup?
YES, we don't need to attach the device in the setup because 
LOOP_SET_BLOCK_SIZE checks works well(return ENXIO if supports, return 
EINVAL if not supports) when not attaching device.

But for close and open the dev_fd repeatedly, I think it is necessary 
because when we detach device firstly without closing dev fd, it will 
report the warnging as below:

tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg < 512
ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE
ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg != power_of_2
ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
ioctl_loop06.c:69: INFO: Using LOOP_CONFIGURE with block_size < 512
tst_device.c:223: WARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for 
too long
ioctl_loop06.c:62: FAIL: Set block size failed expected EINVAL got: 
EBUSY (16)

That is why I close dev_fd firstly and then detach device in cleanup 
function.

> 
> I.e. it should work the same with:
> 
> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> index 2f172a09d..7936af4ac 100644
> --- a/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop06.c
> @@ -81,12 +81,9 @@ static void run(unsigned int n)
>                  return;
>          }
>          if (attach_flag) {
> -               SAFE_CLOSE(dev_fd);
>                  tst_detach_device(dev_path);
>                  attach_flag = 0;
>          }
> -       if (dev_fd < 0)
> -               dev_fd = SAFE_OPEN(dev_path, O_RDWR);
>          loopconfig.block_size = *(tc->setvalue);
>          verify_ioctl_loop(n);
>   }
> @@ -101,8 +98,6 @@ static void setup(void)
>                  tst_brk(TBROK, "Failed to find free loop device");
> 
>          tst_fill_file("test.img", 0, 1024, 1024);
> -       tst_attach_device(dev_path, "test.img");
> -       attach_flag = 1;
>          half_value = 256;
>          pg_size = getpagesize();
>          invalid_value = pg_size * 2;
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
