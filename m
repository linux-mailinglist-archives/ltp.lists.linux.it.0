Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B402EAE28
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 16:23:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF00D3C54AD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Jan 2021 16:23:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 80AE23C268A
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 16:23:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 420641400E17
 for <ltp@lists.linux.it>; Tue,  5 Jan 2021 16:23:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FE57AA7C;
 Tue,  5 Jan 2021 15:23:45 +0000 (UTC)
Date: Tue, 5 Jan 2021 16:24:39 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <X/SEt8EfjP+w4EYw@yuki.lan>
References: <20201215155650.6496-1-radoslav.kolev@suse.com>
 <5FD96C97.6020602@cn.fujitsu.com>
 <c6340b4dc96458ddd972beb28059324d44f44a99.camel@suse.com>
 <5FD9C58B.9020807@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FD9C58B.9020807@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05.c: skip test on overlay
 filesystem
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
Cc: Radoslav Kolev via ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> diff --git a/lib/tst_device.c b/lib/tst_device.c
> index c096b418b..de64fd908 100644
> --- a/lib/tst_device.c
> +++ b/lib/tst_device.c
> @@ -534,6 +534,10 @@ void tst_find_backing_dev(const char *path, char *dev)
>          if (stat(dev, &buf) < 0)
>                  tst_brkm(TWARN | TERRNO, NULL, "stat(%s) failed", dev);
> 
> -       if (S_ISBLK(buf.st_mode) != 1)
> -               tst_brkm(TCONF, NULL, "dev(%s) isn't a block dev", dev);
> +       if (S_ISBLK(buf.st_mode) != 1) {
> +               if (tst_is_mounted(dev))
> +                       tst_find_backing_dev(dev, dev);
> +               else
> +                       tst_brkm(TCONF, NULL, "dev(%s) isn't a block 
> dev", dev);
> +       }
>   }
> 
> My test environment is that
> /dev/sda10              20G  623M   18G   4% /mnt/xfstests/test
> /mnt/xfstests/test      20G  623M   18G   4% /mnt/xfstests/test/ovl-mnt
> /dev/sda11              20G   46M   19G   1% /mnt/xfstests/scratch
> /mnt/xfstests/scratch   20G   46M   19G   1% /mnt/xfstests/scratch/ovl-mnt
> 
> and my TMPDIR env is /mnt/xfstests/test/ovl-mnt.

Does this code works for everyone or should we apply patch that disables
the test on overlay so that it's fixed for next release?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
