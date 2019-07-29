Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3605A78BBD
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:26:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 06C773C1D22
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jul 2019 14:26:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8FC133C1CF8
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:26:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 47C221401240
 for <ltp@lists.linux.it>; Mon, 29 Jul 2019 14:26:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 76058AC20;
 Mon, 29 Jul 2019 12:26:21 +0000 (UTC)
Date: Mon, 29 Jul 2019 14:26:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190729122621.GB5872@dell5510>
References: <1b8b7f73-fd31-58d2-5162-3648fa9729a5@163.com>
 <1563789167-2328-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563789167-2328-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] m4: remove some useless m4
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Since commit fe9d9218c, we have detected linux/securebits.h in
> confiure.ac. one place used the HAVE_SECUREBITS defined), it only
> controls compile. kernel/security/securebits/check_keepcaps.c has
> HAVE_LINUX_SECUREBITS_H check in internal, so removing it is safe.

> No testcase used these macros defined in ltp/time.m4, and these
> (CLOCK_MONOTONIC_RAW, CLOCK_REALTIME_COARSE, CLOCK_MONOTONIC_COARSE)
> have been defined in lapi/posix_clocks.h. Removing it is safe.

> FS_IOC_GETFLAGS and FS_IOC_SETFLAGS have been defined in lapi/fs.h.
> setxattr03.c checked this ioctl return value, so removing it is safe.

> Since commit ef772539, LTP_CHECK_CGROUPSTATS has been removed. But
> testcase still used it. It looks like a mistakenly deletion. Removing
> ltp-cgroupstats.m4, check linux/cgroupstats.h in configure.ac.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Acked-by: Petr Vorel <pvorel@suse.cz>

Although I wonder whether mixing 4 changes (even related to autoconf)
in single commit is a good idea (makes it a bit hard to review).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
