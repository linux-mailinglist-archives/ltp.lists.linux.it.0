Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A32DE02C
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 10:01:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7DFF43C6180
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 10:01:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 984943C2555
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 10:01:50 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D29F91A016CD
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 10:01:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1512ABC6;
 Fri, 18 Dec 2020 09:01:48 +0000 (UTC)
Date: Fri, 18 Dec 2020 10:01:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X9xv+6e0tJgVDN/9@pevik>
References: <20201218070631.1182292-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218070631.1182292-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] inotify tests for v5.9 regression
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
Cc: Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Hi Petr,

> Here is the test for the other v5.9 regression that I mentioned earlier.
> The fix commit has just been merged to master.
Thanks for your patch, LGTM. I'll probably merge it later today.

> History:
> Originally, inotify10 was written to cover a bug that was detected during
> the review of the fsnotify changes for v5.9, but was not merged to v5.9.
> Later, I wrote test case #3 to cover another bug that was merged to v5.9.
> While testing the v5.9-bug-fix in linux-next, Hugh Dickins reported [1]
> a bug introduced by the v5.9-bug-fix, so I added two more test cases
> to cover the bug-in-the-bug-fix.
> The bug-in-the-bug-fix was fixed before the v5.9-bug-fix was merged.

> Long story short, the only test case expected to fail is test case #3 on
> kernel >= v5.9 and now fixed in master :-)
Correct, it fails on my openSUSE 5.10.0-rc5 kernel.
I tested it on someold kernels (patched 4.4; 4.9) and on some newer ones
(5.8.14 and on current devel SLES kernel).

BTW interesting (nothing to be fixed in the test) that second commit slower down
on newer kernels (0,200s), while on old kernels is the same (0.010s).

Kind regards,
Petr

> Thanks,
> Amir.

> [1] https://lore.kernel.org/linux-fsdevel/alpine.LSU.2.11.2012101507080.1100@eggly.anvils/

> Amir Goldstein (3):
>   syscalls/inotify10: Generalize for more test cases
>   syscalls/inotify10: Add test cases with two groups
>   syscalls/inotify10: Test two inotify groups with parent and child
>     watches

>  testcases/kernel/syscalls/inotify/inotify10.c | 126 ++++++++++++++----
>  1 file changed, 98 insertions(+), 28 deletions(-)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
