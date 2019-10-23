Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CFAE1F6A
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 17:36:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89BCC3C2245
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 17:36:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 2E7693C1C89
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 17:36:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 82A95601650
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 17:36:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BF90CBC1E;
 Wed, 23 Oct 2019 15:36:32 +0000 (UTC)
Date: Wed, 23 Oct 2019 17:36:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <20191023153631.GA12897@rei>
References: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
 <1714198769.8739783.1571839133168.JavaMail.zimbra@redhat.com>
 <20191023140408.GC4055@calabresa>
 <6089b924-8dbe-c43d-72d9-a4086a13b0d5@suse.cz>
 <20191023143510.GA10116@rei> <20191023145640.GD4055@calabresa>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023145640.GD4055@calabresa>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_create01: accept kernel ENOTSUPP
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
> > Beware that kernel defines ENOTSUP that is not equal to EOPNOTSUPP and
> > in this case this value leaked to userspace leading to invalid userspace
> > errno value.
> 
> That was ENOTSUPP (the internal kernel error, defined as 524). ENOTSUP, defined
> as EOPNOTSUPP, is the userspace error I guess Martin is saying should not be
> used either.

Ah, right, I misunderstand that.

> In that case, we need to fix the kernel to return EINVAL instead. Looking at
> older changes here, I see commit 98d6f4dd84a134d942827584a3c5f67ffd8ec35f
> ("alarmtimer: return EINVAL instead of ENOTSUPP if rtcdev doesn't exist")
> claiming exactly this. Though it was about clock_getres and clock_gettime,
> quoting from that commit:
> 
> "
>     Second, Posix and Linux man pages agree that clock_gettime and
>     clock_getres should return EINVAL if clk_id argument is invalid.
>     While the arugment that the clockid is valid, but just not supported
>     on this hardware could be made, this is just a technicality that
>     doesn't help userspace applicaitons, and only complicates error
>     handling.
> "

I would disagree, if you check latest POSIX it has:

[ENOTSUP]
    The implementation does not support the creation of a timer attached
    to the CPU-time clock that is specified by clock_id and associated
    with a process or thread different from the process or thread
    invoking timer_create().

https://pubs.opengroup.org/onlinepubs/9699919799/

So the implementation is required to return ENOTSUPP in certain cases
anyways so applying it to CLOCK_REALTIME_ALARM and
CLOCK_BOOTTIME_ALARM certainly makes sense.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
