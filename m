Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 774761429FA
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 13:03:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 248953C234E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 13:03:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9BF313C2259
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 13:03:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2A1F01000D94
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 13:03:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BDD7AC24;
 Mon, 20 Jan 2020 12:03:11 +0000 (UTC)
Date: Mon, 20 Jan 2020 13:03:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200120120309.GA24136@dell5510>
References: <20200117113715.22786-1-pvorel@suse.cz>
 <20200117113715.22786-3-pvorel@suse.cz>
 <20200120103108.GA15405@dell5510>
 <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <558281761.2778139.1579517819187.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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

> ----- Original Message -----
> > >  #include <unistd.h>
> > > -#include <sys/syscall.h>
> > > +#include "lapi/syscalls.h"
> > Hm, maybe this fix wasn't a good idea.
> > It effectively uses lapi/syscalls.h everywhere instead of <sys/syscall.h>.
> > Not sure if this is what we want.

> We already include lapi/syscalls.h at several places, so I wouldn't expect
> this to be as bad.

Yes, it's in many places, the same as lapi/syscalls.h:
git grep -l sys/syscall.h |wc -l
136

git grep -l lapi/syscalls.h |wc -l
206

But none of lapi/syscalls.h use is in the API headers (only in API C and tests)

> > Example of the error is #634 [1], which is caused by __NR_socketcall being -1
> > instead of not defined (socketcall is not defined on some archs, e.g. x86-64
> > and ARM).
> > We can fix the condition

> Tests using tst_syscall or ltp_syscall should be fine, since those check
> for ENOSYS.
OK, if lapi/syscalls.h include is ok, using tst_syscall() in socketcall01.c is
trivial fix. But I'd worry about these uses:

$ git grep -e '^#if.*\bSYS_' $(git grep -l sys/syscall.h)
testcases/kernel/containers/libclone/libclone.h:#ifndef SYS_unshare
testcases/kernel/containers/libclone/libclone.h:#ifdef __NR_unshare
testcases/kernel/containers/libclone/libclone.h:#ifndef __NR_unshare
testcases/kernel/fs/scsi/ltpscsi/llseek.c:#ifdef __NR_lseek
testcases/kernel/fs/scsi/ltpscsi/llseek.c:#ifndef __NR_llseek
testcases/kernel/hotplug/memory_hotplug/commands.c:#ifndef __NR_migrate_pages
testcases/kernel/mem/vma/vma03.c:#ifdef __NR_mmap2
testcases/kernel/security/tomoyo/include.h:#ifdef __NR_uselib
testcases/kernel/security/tomoyo/include.h:#ifdef __NR_pivot_root
testcases/kernel/syscalls/accept4/accept4_01.c:#if defined(SYS_ACCEPT4) /* the socketcall() number */
testcases/kernel/syscalls/readahead/readahead01.c:#if defined(__NR_readahead)
testcases/kernel/syscalls/set_robust_list/set_robust_list01.c:#ifdef __NR_set_robust_list
testcases/kernel/syscalls/set_robust_list/set_robust_list01.c:#ifdef __NR_set_robust_list
testcases/kernel/syscalls/set_robust_list/set_robust_list01.c:#ifdef __NR_set_robust_list
testcases/kernel/syscalls/set_robust_list/set_robust_list01.c:#ifdef __NR_set_robust_list
testcases/kernel/syscalls/setns/setns01.c:#if defined(__NR_setns)
testcases/kernel/syscalls/setns/setns02.c:#if defined(__NR_setns) && defined(CLONE_NEWIPC) && defined(CLONE_NEWUTS)
testcases/kernel/syscalls/socketcall/socketcall01.c:#ifdef __NR_socketcall
testcases/kernel/syscalls/socketcall/socketcall02.c:#ifdef __NR_socketcall
testcases/kernel/syscalls/socketcall/socketcall03.c:#ifdef __NR_socketcall
testcases/kernel/syscalls/socketcall/socketcall04.c:#ifdef __NR_socketcall
testcases/kernel/syscalls/timerfd/timerfd01.c:#ifdef __NR_timerfd_create
testcases/misc/crash/crash02.c:#if defined(__NR_vfork) && __NR_vfork
testcases/misc/crash/crash02.c:#if defined(__NR_clone) && __NR_clone

which IMHO fail unless transformed into tst_syscall/ltp_syscall().

That's why I'd apply my fix https://patchwork.ozlabs.org/patch/1225869/.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
