Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE619F137
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 09:53:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C899D3C2DFE
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 09:53:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 17B213C2DE0
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 09:53:13 +0200 (CEST)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 994FB14012A4
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 09:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=8o8Pn
 8bxII5fDPA5HoYTV4ruvX7nkxHZ9eaXGqG8LPs=; b=V3GMrZ+mfoWcgOlVG/zJa
 l79f6PokUDteq5E3+3m+/3rL6pfqQxzcqes6nLptgpCbwoVZVyyQ5Z1x2rsPEPq/
 1beU32WGCJw4A/5hlFgy5EUedE20HcIafdbegqdgizZUpXSr+dYRoHSfPJse0CGZ
 N8Uyh9EF0I0qusvTenkecI=
Received: from [192.168.0.105] (unknown [112.22.73.173])
 by smtp14 (Coremail) with SMTP id EsCowABXXKjg34pedSDTCg--.1S2;
 Mon, 06 Apr 2020 15:53:05 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-8-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200403164416.GA11850@yuki.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <1847306e-f00c-a484-9080-8d1b7f62ce60@163.com>
Date: Mon, 6 Apr 2020 15:53:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403164416.GA11850@yuki.lan>
X-CM-TRANSID: EsCowABXXKjg34pedSDTCg--.1S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtFW3Gr17WFykKw48Wry7GFg_yoWxXF4rpF
 WkJFs0yrs7tr1xGr9aqFn7GrWFv34UCr4qkr17ua4jyF1vyr95ZFs3Wa13urn8ZrW3ZFyF
 v3W8Zr47Gw15tFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ju_M-UUUUU=
X-Originating-IP: [112.22.73.173]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBzgL9hFQHIVa4nwAAs2
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 07/10] syscalls/ioctl_loop05: Add
 LOOP_SET_DIRECT_IO ioctl test
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
>> LOOP_SET_DIRECT_IO can updata a live loop device dio mode. It needs the
>> backing file also supports dio mode and the lo_offset is aligned with
>> the logical I/O size.
>>
>> It was introduced into kernel since 4.10
>> commit ab1cb278bc70 ("block: loop: introduce ioctl command of LOOP_SET_DIRECT_IO").
>>
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>> ---
>>   runtest/syscalls                              |   1 +
>>   testcases/kernel/syscalls/ioctl/.gitignore    |   1 +
>>   .../kernel/syscalls/ioctl/ioctl_loop05.c      | 120 ++++++++++++++++++
>>   3 files changed, 122 insertions(+)
>>   create mode 100644 testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index 6e8d71d44..9644588f3 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -531,6 +531,7 @@ ioctl_loop01 ioctl_loop01
>>   ioctl_loop02 ioctl_loop02
>>   ioctl_loop03 ioctl_loop03
>>   ioctl_loop04 ioctl_loop04
>> +ioctl_loop05 ioctl_loop05
>>   
>>   ioctl_ns01 ioctl_ns01
>>   ioctl_ns02 ioctl_ns02
>> diff --git a/testcases/kernel/syscalls/ioctl/.gitignore b/testcases/kernel/syscalls/ioctl/.gitignore
>> index 039a5251c..f484d98d6 100644
>> --- a/testcases/kernel/syscalls/ioctl/.gitignore
>> +++ b/testcases/kernel/syscalls/ioctl/.gitignore
>> @@ -10,6 +10,7 @@
>>   /ioctl_loop02
>>   /ioctl_loop03
>>   /ioctl_loop04
>> +/ioctl_loop05
>>   /ioctl_ns01
>>   /ioctl_ns02
>>   /ioctl_ns03
>> diff --git a/testcases/kernel/syscalls/ioctl/ioctl_loop05.c b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>> new file mode 100644
>> index 000000000..43bad6c18
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/ioctl/ioctl_loop05.c
>> @@ -0,0 +1,120 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
>> + * Author: Yang Xu <xuyang2018.jy@cn.jujitsu.com>
>> + *
>> + * This is a basic ioctl test about loopdevice.
>> + *
>> + * It is designed to test LOOP_SET_DIRECT_IO can updata a live
>> + * loop device dio mode. It need the backing file also supports
>> + * dio mode and the lo_offset is aligned with the logical I/O size.
>> + */
>> +#include <stdio.h>
>> +#include <unistd.h>
>> +#include <string.h>
>> +#include <stdlib.h>
>> +#include "ioctl_loop_support.h"
>> +#include "lapi/loop.h"
>> +#include "tst_test.h"
>> +
>> +#define DIO_MESSAGE "In dio mode"
>> +#define NON_DIO_MESSAGE "In non dio mode"
>> +
>> +static char dev_path[1024], sys_loop_diopath[1024];
>> +static int dev_num, dev_fd, attach_flag;
>> +
>> +static void check_dio_value(int flag)
>> +{
>> +	struct loop_info loopinfoget;
>> +
>> +	memset(&loopinfoget, 0, sizeof(loopinfoget));
>> +
>> +	SAFE_IOCTL(dev_fd, LOOP_GET_STATUS, &loopinfoget);
>> +	tst_res(TINFO, "%s", flag ? DIO_MESSAGE : NON_DIO_MESSAGE);
>> +
>> +	if (loopinfoget.lo_flags & LO_FLAGS_DIRECT_IO)
>> +		tst_res(flag ? TPASS : TFAIL, "lo_flags has LO_FLAGS_DIRECT_IO flag");
>> +	else
>> +		tst_res(flag ? TFAIL : TPASS, "lo_flags doesn't have LO_FLAGS_DIRECT_IO flag");
>> +
>> +	check_sys_value(sys_loop_diopath, flag);
>> +}
>> +
>> +static void verify_ioctl_loop(void)
>> +{
>> +	struct loop_info loopinfo;
>> +
>> +	memset(&loopinfo, 0, sizeof(loopinfo));
>> +
>> +	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
>> +	check_dio_value(0);
>> +	tst_res(TINFO, "Without setting lo_offset or sizelimit");
>> +	SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 1);
>> +	check_dio_value(1);
>> +
>> +	tst_res(TINFO, "With offset equal to sector size");
>> +	loopinfo.lo_offset = 512;
> 
> We should use BLKSSZGET ioctl() to get the block size for direct I/O
> otherwise I would expect that it would break on one of the less common
> architectures. See also discussion at the end of man 2 open.
>
I see. Also, when testing LOOP_SET_BLOCK_SIZE ioctl, we can also call 
this to check whether this ioctl succeed.

>> +	safe_set_status(dev_fd, loopinfo);
>> +	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
>> +	if (TST_RET == 0) {
>> +		tst_res(TPASS, "LOOP_SET_DIRECT_IO succeeded");
>> +		check_dio_value(1);
>> +	} else {
>> +		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed");
>> +	}
>> +
>> +	tst_res(TINFO, "With offset less than or unalign sector size");
>> +	loopinfo.lo_offset = 256;
>> +	safe_set_status(dev_fd, loopinfo);
>> +
>> +	TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
>> +	if (TST_RET == 0) {
>> +		tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded unexpectedly");
>> +		return;
>> +	}
>> +	if (TST_ERR == EINVAL)
>> +		tst_res(TPASS | TTERRNO, "LOOP_SET_DIRECT_IO failed as expected");
>> +	else
>> +		tst_res(TFAIL | TTERRNO, "LOOP_SET_DIRECT_IO failed expected EINVAL got");
>> +
>> +	loopinfo.lo_offset = 0;
>> +	safe_set_status(dev_fd, loopinfo);
>> +}
>> +
>> +static void setup(void)
>> +{
>> +	if (tst_fs_type(".") == TST_TMPFS_MAGIC)
>> +		tst_brk(TCONF, "tmpfd doesn't support O_DIRECT flag, skip it");
>> +
>> +	dev_num = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>> +	if (dev_num < 0)
>> +		tst_brk(TBROK, "Failed to find free loop device");
>> +
>> +	sprintf(sys_loop_diopath, "/sys/block/loop%d/loop/dio", dev_num);
>> +	tst_fill_file("test.img", 0, 1024, 1024);
>> +	tst_attach_device(dev_path, "test.img");
>> +	attach_flag = 1;
>> +	dev_fd = SAFE_OPEN(dev_path, O_RDWR);
>> +	check_support_cmd(dev_fd, LOOP_SET_DIRECT_IO, 0, "LOOP_SET_DIRECT_IO");
>> +}
>> +
>> +static void cleanup(void)
>> +{
>> +	if (dev_fd > 0)
>> +		SAFE_CLOSE(dev_fd);
>> +	if (attach_flag)
>> +		tst_detach_device(dev_path);
>> +	unlink("test.img");
> 
> We don't have to remove the image here once the needs_tmpdir has been
> uncommented below, right?
Yes.
> 
>> +}
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.cleanup = cleanup,
>> +	.test_all = verify_ioctl_loop,
>> +	.needs_root = 1,
>> +//	.needs_tmpdir = 1,
> 
> Looks like a forgotten debug measure.
> 
Yes, because some distribution use tmpfs in tmp directory, then this 
case will TCONF(tmpfs doesn't supprt DIO).  I am indecisive, or I should 
  use all_filesystem =1, so it will not report TCONF? Or, keep it?
>> +	.needs_drivers = (const char *const []) {
>> +		"loop",
>> +		NULL
>> +	}
>> +};
>> -- 
>> 2.23.0
>>
>>
>>
>>
>> -- 
>> Mailing list info: https://lists.linux.it/listinfo/ltp
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
