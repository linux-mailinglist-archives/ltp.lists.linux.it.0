Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41D2298D4
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 14:59:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F8AD3C4DB7
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 14:59:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2A94D3C266B
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 14:59:26 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9F1FC1A00155
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 14:59:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 659F2AB55;
 Wed, 22 Jul 2020 12:59:32 +0000 (UTC)
Date: Wed, 22 Jul 2020 14:59:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200722125946.GA22573@yuki.lan>
References: <20200708140034.GD7276@yuki.lan>
 <1594363189-20972-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200722094502.GB2319@yuki.lan>
 <13f6db1e-f1b6-1465-b34d-ae418ead2558@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13f6db1e-f1b6-1465-b34d-ae418ead2558@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Do we really need to close and open the dev_fd repeatedly and also we
> > don't have to attach the device in the test setup?
> YES, we don't need to attach the device in the setup because 
> LOOP_SET_BLOCK_SIZE checks works well(return ENXIO if supports, return 
> EINVAL if not supports) when not attaching device.
> 
> But for close and open the dev_fd repeatedly, I think it is necessary 
> because when we detach device firstly without closing dev fd, it will 
> report the warnging as below:
> 
> tst_device.c:89: INFO: Found free device 0 '/dev/loop0'
> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg < 512
> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg > PAGE_SIZE
> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
> ioctl_loop06.c:69: INFO: Using LOOP_SET_BLOCK_SIZE with arg != power_of_2
> ioctl_loop06.c:60: PASS: Set block size failed as expected: EINVAL (22)
> ioctl_loop06.c:69: INFO: Using LOOP_CONFIGURE with block_size < 512
> tst_device.c:223: WARN: ioctl(/dev/loop0, LOOP_CLR_FD, 0) no ENXIO for 
> too long
> ioctl_loop06.c:62: FAIL: Set block size failed expected EINVAL got: 
> EBUSY (16)
> 
> That is why I close dev_fd firstly and then detach device in cleanup 
> function.

Ah, right, the tst_detach_device() opens the dev_path so the function
fails to destroy it because the device is opened twice at that point.

I guess that proper solution would be to add a tst_detach_device_by_fd()
and change the library so that tst_detach_device() opens the dev_path
and calls tst_detach_device_by_fd() internally.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
