Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3C27E794
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:24:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B25AB3C4C11
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 13:24:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E822F3C297E
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:24:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1DE4E1400E19
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 13:24:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E537ABC1;
 Wed, 30 Sep 2020 11:24:21 +0000 (UTC)
References: <20200929144635.28874-1-rpalethorpe@suse.com>
 <20200929181152.GD15188@dell5510> <20200930081655.GA6611@yuki.lan>
 <20200930082147.GA16382@dell5510>
User-agent: mu4e 1.4.13; emacs 27.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20200930082147.GA16382@dell5510>
Date: Wed, 30 Sep 2020 12:24:20 +0100
Message-ID: <87sgazwlqz.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] utimensat01: Test all available FS and handle FS
 with no attributes
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
Reply-To: rpalethorpe@suse.de
Cc: chrubis@suse.com, ltp@lists.linux.it, viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Cyril,
>
>> Hi!
>> > Although this fails on NTFS and exfat and FUSE.
>> > I don't remember which flag removes these filesystems, there was some
>> > workaround. Cyril, Li, Jan, do you remember?
>
>> That's the:
>
>> .dev_fs_flags = TST_FS_SKIP_FUSE,
>
>> Which should fix the failures here. Moreover I do wonder if this is a
>> real bug in the fuse implementation or something that have been left out
>> intentionally.
> Thanks for info. Also vfat needs to be filtered out (if it's not a bug, which
> needs to be implemented).
> If we decide to filter out it, we'd need one more flag (something like
> TST_FS_SKIP_MICROSOFT, which would filter out vfat, ntfs and exfat).

I sent in a patch which just uses ext4 as a temp solution. We should
probably specify the filesystems we expect this test to work on and
accept failure for others. This seems like a complex issue as it can be
different for every FS.

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
