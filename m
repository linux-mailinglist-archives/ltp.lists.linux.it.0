Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAB4160426
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 14:17:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4BC013C24FF
	for <lists+linux-ltp@lfdr.de>; Sun, 16 Feb 2020 14:17:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id C78A53C1CDB
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 14:17:31 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6BDBA2000E7
 for <ltp@lists.linux.it>; Sun, 16 Feb 2020 14:17:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C66AABD1;
 Sun, 16 Feb 2020 13:17:26 +0000 (UTC)
Date: Sun, 16 Feb 2020 14:17:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200216131723.GA2725117@x230>
References: <20200207144105.19947-1-pvorel@suse.cz>
 <20200207144105.19947-2-pvorel@suse.cz>
 <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f0db1i7Tpg-4jqa5h5j9KZpH+d4aRg-M3Xn3Mw9NU1eA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/2] syscalls/fsmount01: Add test for new mount
 API v5.2
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
Cc: viresh.kumar@linaro.org, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> Patch v6 looks almost good besides tiny issues:

> I don't like the commit summary with kernel version number, can we just
> note as:
>     "syscalls/fsmount01: Add test for fsmount series API"?
Sure.

> >  configure.ac                                  |  4 +
> >  include/lapi/newmount.h                       | 95 +++++++++++++++++++
> >  include/lapi/syscalls/powerpc64.in            |  4 +
> Is there any reason why only add syscall num for ppc64?
The other numbers are already there:
01e4dc222 lapi/syscalls: Add MIPS support
c2f27f6e9 Add syscall numbers for new file-system related syscalls

Not sure if we should add a note in the commit message to prevent confusion
later (probably not needed).

> > +++ b/include/lapi/newmount.h
> Maybe rename to fsmount.h is better? Now we think it new since mainline
> v5.2 is new to us, one year later it probably not new actually, to use a
> name can indicate the functionality is wiser I guess.
+1

> BTW, I like the way Viresh Kumar gives in his fsmount.h, it looks more tidy
> and clean.
> http://lists.linux.it/pipermail/ltp/2020-February/015413.html
Hm, competing implementations.
Both tries to handle preventing redefinitions (e.g. FSOPEN_CLOEXEC) once
the API hits libc headers (at least in musl it might be soon).
Zorro tries to bind them to function check (e.g. #ifndef HAVE_FSMOUNT, #ifndef
HAVE_MOVE_MOUNT), Viresh just use single check #ifndef OPEN_TREE_CLONE.
I slightly prefer Viresh way (it's unlikely that libc headers would include just
part of the new mount API definitions, although obviously the most safest way
would be to either guard with #ifndef each definition or just give up on testing
header and copy whole include/uapi/linux/mount.h (+ avoid using sys/mount.h;
that's the way used for include/lapi/bpf.h).

> > +++ b/testcases/kernel/syscalls/fsmount/fsmount01.c
...
> > +static void test_newmount(void)
> static void test_fsmount(void)? Or, static void run(void).
+1.


> > +       if (ismount(MNTPOINT)) {
> > +               tst_res(TPASS, "new mount API from v5.2 works");


> Can we avoid appearance the v5.2? I guess many Enterprise Linux
> Distributions will backport the fsmount() series API, v5.2 in test log
> looks strange if the kernel is older than it.
+1. That was added by myself.

I've prepared fixed version, we just need to decide how to handle LAPI header.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
