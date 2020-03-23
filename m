Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635E18F3D1
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 12:37:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A1AD3C4E42
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Mar 2020 12:37:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 669EB3C4E38
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 12:37:41 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id E067360125C
 for <ltp@lists.linux.it>; Mon, 23 Mar 2020 12:37:40 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3138AAC8F;
 Mon, 23 Mar 2020 11:37:40 +0000 (UTC)
Date: Mon, 23 Mar 2020 12:37:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200323113738.GA4807@dell5510>
References: <20200320134937.16616-1-pvorel@suse.cz>
 <20200320134937.16616-2-pvorel@suse.cz>
 <CAEemH2f7TB9sMt-+YE2zF5KztT4O64VN9L4AZWdS3nU1uJX5_w@mail.gmail.com>
 <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <303d1019-f836-b2ae-ce51-d2c46dd7fb1e@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Use SAFE_RUNCMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Xu,

> >      =A0testcases/kernel/syscalls/add_key/add_key05.c=A0 =A0| 15 ++----=
---------
> >      =A0testcases/kernel/syscalls/quotactl/quotactl01.c | 14 ++--------=
----
> >      =A0testcases/kernel/syscalls/quotactl/quotactl06.c | 12 +---------=
--

> > Apart from the three, do you consider converting to SAFE_RUNCMD for the
> > rest testcases?
> > (it seems not too much work remaining since only a few test case uses
> > tst_run_cmd)
> At the beginning, I have the same idea. But after seeing code, I think we
> should not because these cases have many sub tests(only few test deponds =
on
> the result of the cmd execution.

> > kernel/syscalls/setpriority/setpriority01.c
> One year ago has a commit db82b596(setpriority01: Skip only PRIO_USER when
> unable to add test user). It only affects PRIO_USER sub test.
+ 1. I didn't want to break the case when useradd is not available (android=
 or
some custom embedded linux) or there is no password file (root mounted as r=
o -
custom embedded linux).

BTW I also avoid handling adding user as I want to implement better handling
user and group in LTP (adding a flag), see:
https://github.com/linux-test-project/ltp/issues/468

Feel free to commend this plan.
This patchset is kind of preparation for it.

> > kernel/syscalls/copy_file_range/copy_file_range02.c
> only affect test6 and test7
>  6) Try to copy contents to a file chattred with +i
>  *    flag -> EPERM
>  * 7) Try to copy contents to a swapfile ->ETXTBSY
Yes, it'd be bad to break all tests due it.

Here is also problem with swapoff (or maybe chattr, mkswap, swapon; I don't
remember), which returns exit code 255 on error, so it's not possible to
distinguish this from the case whether command is not available (any idea, =
how
to fix it?).

Looking into old API uses, testcases/kernel/syscalls/swapon/libswapon.c cou=
ld
use it (once it migrates to new API), although it uses tst_brkm(TFAIL).
testcases/kernel/input/input_helper.c probably not.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
