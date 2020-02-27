Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC6D17111B
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 07:44:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B84543C2239
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Feb 2020 07:44:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 5F9723C013A
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 07:44:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 23006200FF1
 for <ltp@lists.linux.it>; Thu, 27 Feb 2020 07:44:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB688B1DA;
 Thu, 27 Feb 2020 06:44:43 +0000 (UTC)
Date: Thu, 27 Feb 2020 07:44:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200227064442.GB7096@dell5510>
References: <20200226232649.8736-1-pvorel@suse.cz>
 <20200227032524.yldx3diebom3wqod@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227032524.yldx3diebom3wqod@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] lap/syscalls: Update syscall numbers
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

Hi Viresh,

> > to sync with the kernel v5.6-rc3.

> This doesn't look right, you missed some text here ?
I dared to change this

Get Syscall numbers in sync with latest Linux kernel source

    This gets the Syscall numbers in sync with latest kernel source.

to this:
lap/syscalls: Update syscall numbers

    to sync with the kernel v5.6-rc3.

=> typo: s/lap/lapi/
Hope you don't mind.

> > As this was performed in some sort of automated way, few extra changes
> > may be noticed while converting from kernel files to LTP, like a
> > different format of defining syscalls or removal of obsolete syscalls.

> > The diff generated against sh.in file is enormous and looks like someone
> > did a mistake while adding the syscall numbers there as they look to be
> > mostly incorrect from 220 to 393. They are fixed as a consequence of
> > this exercise.

> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > [ pvorel: various fixes for 32bit syscalls in 64bit arch and vice versa ]

> Sorry about making these mistakes :(
No problem and thanks for your work.
I sent fixes as a new patch as it might be easier to review for others
(off course, you're the author).
I can be wrong as well, other review is welcome :).

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Changes v1->v2:
> > * remove wrong umount in ia64
> > * fixed typo sched_rr_get_interval_ti (=> sched_rr_get_interval_time64)
> > * various fixes for 32bit syscalls in 64bit arch and vice versa

> > TODO: not sure about spu and nospu ABI in powerpc (whether they go to
> > 32 bit or 64 bit or is ignored)

> > === DIFF from v1 ===
> > diff --git include/lapi/syscalls/s390.in include/lapi/syscalls/s390.in
> >  pkey_free 386
> > -semtimedop 392

> Why is this removed ?
arch/s390/kernel/syscalls/syscall.tbl
392	64	semtimedop		sys_semtimedop			-
=> only for 64 bit ABI. s390.in is for 32 bit.

> > diff --git include/lapi/syscalls/s390x.in include/lapi/syscalls/s390x.in
> > index dfb7ee811..88cc9b86b 100644
> > --- include/lapi/syscalls/s390x.in
> > +++ include/lapi/syscalls/s390x.in
> > @@ -10,17 +10,12 @@ link 9
> >  unlink 10
> >  execve 11
> >  chdir 12
> > -time 13
arch/s390/kernel/syscalls/syscall.tbl
13   32		time			-				sys_time32
=> only for 32 bit ABI. s390x.in is for 64 bit.

> And the ones like these..

> Because they are only for 32 bit arch and not 64 ?

> > diff --git include/lapi/syscalls/sparc.in include/lapi/syscalls/sparc.in
> > -sched_rr_get_interval_ti423
> > +sched_rr_get_interval_time64 423

> Really bad that I made these mistakes with my vim tricks.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
