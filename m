Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30027E398
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 10:21:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B1E8D3C2A12
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 10:21:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 743E53C2824
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 10:21:50 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2ADDE6003D0
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 10:21:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7D4D5ACC6;
 Wed, 30 Sep 2020 08:21:49 +0000 (UTC)
Date: Wed, 30 Sep 2020 10:21:47 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200930082147.GA16382@dell5510>
References: <20200929144635.28874-1-rpalethorpe@suse.com>
 <20200929181152.GD15188@dell5510> <20200930081655.GA6611@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930081655.GA6611@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: chrubis@suse.com, Richard Palethorpe <rpalethorpe@suse.com>,
 ltp@lists.linux.it, viresh.kumar@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > Although this fails on NTFS and exfat and FUSE.
> > I don't remember which flag removes these filesystems, there was some
> > workaround. Cyril, Li, Jan, do you remember?

> That's the:

> .dev_fs_flags = TST_FS_SKIP_FUSE,

> Which should fix the failures here. Moreover I do wonder if this is a
> real bug in the fuse implementation or something that have been left out
> intentionally.
Thanks for info. Also vfat needs to be filtered out (if it's not a bug, which
needs to be implemented).
If we decide to filter out it, we'd need one more flag (something like
TST_FS_SKIP_MICROSOFT, which would filter out vfat, ntfs and exfat).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
