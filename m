Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8222ABE0
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:41:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71A753C2651
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 11:41:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id D080C3C1447
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 11:41:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 6CDA71001576
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 11:41:29 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,386,1589212800"; d="scan'208";a="96797347"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Jul 2020 17:41:27 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E3E804CE5070;
 Thu, 23 Jul 2020 17:41:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 17:41:25 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200708140034.GD7276@yuki.lan>
 <1594363189-20972-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200722094502.GB2319@yuki.lan>
 <13f6db1e-f1b6-1465-b34d-ae418ead2558@cn.fujitsu.com>
 <20200722125946.GA22573@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <66653092-9167-5bb0-3000-7f9662e2cfdc@cn.fujitsu.com>
Date: Thu, 23 Jul 2020 17:41:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200722125946.GA22573@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E3E804CE5070.AD1F7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.7 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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

HI Cyril


> Hi!
>>> Do we really need to close and open the dev_fd repeatedly and also we
>>> don't have to attach the device in the test setup?
>> YES, we don't need to attach the device in the setup because
>> LOOP_SET_BLOCK_SIZE checks works well(return ENXIO if supports, return
>> EINVAL if not supports) when not attaching device.
>>
>> But for close and open the dev_fd repeatedly, I think it is necessary
>> because when we detach device firstly without closing dev fd, it will
>> report the warnging as below:
>>
>> tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
>> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg < 512
>> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
>> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE
>> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
>> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg != power_of_2
>> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
>> ioctl_loop06.c:69: INFO: Using LOOP_CONFIGURE with block_size < 512
>> tst_device.c:223: WARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for
>> too long
>> ioctl_loop06.c:62: FAIL: Set block size failed expected EINVAL got:
>> EBUSY (16)
>>
>> That is why I close dev_fd firstly and then detach device in cleanup
>> function.
> 
> Ah, right, the tst_detach_device() opens the dev_path so the function
> fails to destroy it because the device is opened twice at that point.
> 
> I guess that proper solution would be to add a tst_detach_device_by_fd()
> and change the library so that tst_detach_device() opens the dev_path
> and calls tst_detach_device_by_fd() internally.
Should I send a v3 patch or you directly use the new api for this patch?
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
