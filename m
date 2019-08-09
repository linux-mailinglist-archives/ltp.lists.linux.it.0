Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB3687666
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 11:43:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BFC93C1D00
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Aug 2019 11:43:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 93D653C1B49
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 11:43:02 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C16991A00E2D
 for <ltp@lists.linux.it>; Fri,  9 Aug 2019 11:43:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 004A6AF7E;
 Fri,  9 Aug 2019 09:43:00 +0000 (UTC)
Date: Fri, 9 Aug 2019 11:42:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190809094259.GA27030@dell5510>
References: <20190807094119.10834-1-pvorel@suse.cz>
 <CAEemH2cM7mhkYBvTTFC4UhjnYxG0D_e-nkCmSF2U8pB61UT0bw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cM7mhkYBvTTFC4UhjnYxG0D_e-nkCmSF2U8pB61UT0bw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: Fix #12 when TMPDIR
 is on tmpfs or ext[234]
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
Cc: "Darrick J . Wong" <darrick.wong@oracle.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Thanks for highlight this.

> > Cyril, Jan, Li, still not sure what the policy about errno is (see
> > Cyril's statements in recent discussion about it in Jinhui's patch [1]
> > [2]). With these frequent changes we should IMHO check for all possible
> > variants (EXDEV, EFBIG, EINVAL).

> > Or should we investigate all fixes and keep errors which highlight
> > important fix was not backported (to both stable and LTS/enterprise
> > distros kernels?). That'd be weird but approach practical :).

> That sounds not very realistic. We can't satisfy all distributions for
> errno checking, because we don't know when/wheather it backports the
> patch.
I meant it like taking individual approach: insist on errno when different errno
means something important hasn't been fixed.


> > Anyway, we should define and write down LTP policy / rules about it.

> I think we might have these ways of choosing:

> 1. Only align with the latest kernel behavior
>     e.g limit the latest kernel version and verify that valid errno
> The disadvantage of this is only tested on a small kernel range.
Sticking only for latest kernel is a big advantage.

> 2. Guarded by kernel version check as Cyril suggests in [1]
>     e.g  kernel >= 4.10; Check errno == EBADF
>            kernel < 4.10; Check errno == EISDIR
We use this one
278bbbb35 syscalls/fgetxattr02.c: Fix errno EPERM on older kernels
21c27c11c syscalls/bind03: Add version compare according to behaviour difference.

>            ....
> The disadvantage is that the test result is affected by LTS with a
> backport-patch.
Yep, that's problematic.

> 3. Regards all acceptable errnos as valid on any kernel version
>     e.g  whatever errno get any of them EXDEV, EFBIG, EINVAL, regard valid
> This sounds obviously awful.
Yep, but the problem is that we considered changed errno as a bug, but for kernel
developers it's not always a bug. See fix "RFC: changed error code when binding unix
socket twice" [1], which was never merged (it fixed a bug, so changing errno was
not a big issue). I'm sure there more cases like this one.

> Or, anything else?

How about try errno for latest kernel for any kernel (in case it has been
backported) and if not do the check based on kernel version?
Probably combined with TWARN.

Kind regards,
Petr

[1] https://marc.info/?l=linux-kernel&m=149880810113888&w=2

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
