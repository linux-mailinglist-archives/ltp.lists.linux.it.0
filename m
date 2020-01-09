Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C2D1355E0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:35:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 447923C24F4
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 10:35:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 467F53C2433
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:35:09 +0100 (CET)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ABCC21401FB5
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 10:35:08 +0100 (CET)
Received: by mail-lf1-x143.google.com with SMTP id v201so4661904lfa.11
 for <ltp@lists.linux.it>; Thu, 09 Jan 2020 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m8sV+VAOjcTrTsZCNEbai4eFW7T8PjvPD0NcQF7hl/s=;
 b=q5ROR/ysFXqHy/ZaiPh2M51JBN40/5ZtyjNGHyuW51gm9DAPRT+4bogBIcLmQjGpgc
 pBz3DExOnzGDS69Cgve6GviL6hxjCyfFcEN72YO+KW1A8CQI80rx5LdQ1qM6d62lJEMG
 c5tH5ZFBOSdD3atcSl169ALO3EBDlgl88fWTk+YggSzah2i+Ovv9Hunim4/pxuoab24P
 sxdiSwX7NU71fYr+05QKBOGBvDSQ1Jqre0HhOYV0CbEsCFGKc7r0+vqfeMYJxEU+Sfp3
 pMkiDXwwnJVluJBDPqTEENJ9PXOReMteFyisKKs3aBGpy8gG6RxC/zcduskIez7gcf4C
 twyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m8sV+VAOjcTrTsZCNEbai4eFW7T8PjvPD0NcQF7hl/s=;
 b=NM7W1xB9c2HfkmxuETaoWuxgic6dS+bcj+xnaYgdzmal688f/vrvRzp+hv9ZSW1pgl
 xEgRNKU+2VggY0h8qf/bjXG7WIv1/c9qrKUP8UcaSXdZVJe0Fhh9yr0kpy19FlXylHhn
 S3t8MWnkKzfmkTL8MN1wRUJGa4pemyXnjiZuBbgwYSm279XSbNEhul3za6RK7z2G68mR
 oqtiEePkMvxdsxTKdTpiFYpht1VGAKH/J2Bz/dwrvckPXNaKe9a6lzHErypVBugneip6
 W4XlNe6piEH23Vp3bnSCwLkwSLEQVoel8lJgHO0W7ryI82F838A9mbI+ZKlPmuMM23Xr
 Em2A==
X-Gm-Message-State: APjAAAX5TGLCkS6GAcPUoB6s/XJHNeexz2+SKXyaqEerTrmoT528BfFq
 5foTJGLaYVQtQ/Q6bh8/tYH0dvjNo2g3jWwKlSBnEw==
X-Google-Smtp-Source: APXvYqyvG4oSbtW+AaWaEP4fmFMlNoMrbxK/DZd+qFLXReHqJR9IDzoWCDeJGV2WlyI60BdNIdTbUpzngGXH7M6Kbtk=
X-Received: by 2002:ac2:5f49:: with SMTP id 9mr3966140lfz.151.1578562507927;
 Thu, 09 Jan 2020 01:35:07 -0800 (PST)
MIME-Version: 1.0
References: <1578299418-4961-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200108131231.GA23619@rei.lan>
 <bee8d39f-723f-491d-8676-a1c303f0a5bb@cn.fujitsu.com>
In-Reply-To: <bee8d39f-723f-491d-8676-a1c303f0a5bb@cn.fujitsu.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 9 Jan 2020 15:04:56 +0530
Message-ID: <CAFA6WYMk-bT7xKG7nov8mzd=b4T1gzghxrFz9x_OegU8mtSNVA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] tst_dev_bytes_written: parsing /proc/diskstats
 instead of sys file
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Yang,

On Thu, 9 Jan 2020 at 14:05, Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
>
> Hi
> > Hi!
> >> Now, tst_dev_bytes_written api can get the whole disk stat correctly(such as /dev/sda),
> >> but can not get partition stat correctly(such as /dev/sda5).
> >> fail as below:
> >> export LTP_DEV=/dev/sda5
> >> tst_device.c:388: CONF: Test device stat file: /sys/block/sda5/stat not found
> >
> > It seems that in case of partitions the stat file is available under
> > /sys/block/sda/sda5/stat.
> >
> > For NVME it's similar as:
> >
> > /sys/block/nvme0n1/nvme0n1p1/stat
> >
> > I do wonder if it wouldn't be easier to try to match the prefix of the
> > device name first, then try a directory with a full name after that.

I did checked earlier that we could use partition specific
sub-directory for "stat" file but I thought it would be complex in
comparison to referring a single file. But your implementation doesn't
look that complex.

> Maybe, I am fine with your way(I tested it). I only  refer to kernel
> documention [1] .sysfs and proc file  use the same source for the
> information and so should not differ. So I use fixed format as kernel
> function to exact.  Also, I want to listen advise from Sumit.
>

TBH, I think it's just a matter of taste. I am fine with either approach.

-Sumit

> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/iostats.rst
>
> Best Regards
> Yang Xu
> >
>
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
