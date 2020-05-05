Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AEE1C563A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 057353C57ED
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:05:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0BEEC3C267A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:15:59 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 31D9A1A01206
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:15:58 +0200 (CEST)
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jVtgB-0001LN-Fz; Tue, 05 May 2020 09:15:55 +0000
Date: Tue, 5 May 2020 11:15:54 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Florian Weimer <fw@deneb.enyo.de>
Message-ID: <20200505091554.eq7kzvb4twe2wgvl@wittgenstein>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
 <87a72m4uqm.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a72m4uqm.fsf@mid.deneb.enyo.de>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 05 May 2020 15:05:13 +0200
Subject: Re: [LTP] [bug?] clone(CLONE_IO) failing after kernel commit commit
 ef2c41cf38a7
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
Cc: Jan Stancek via Libc-alpha <libc-alpha@sourceware.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, May 05, 2020 at 11:05:37AM +0200, Florian Weimer wrote:
> * Christian Brauner:
> 
> > Hm, as you observed, the kernel always defines the flags argument as
> > unsigned long and afaict this has been the case since forever. So I'm
> > not sure why the userspace wrapper is defined as taking an int for
> > flags in the first place(?).
> 
> We have different types in many places.  Sometimes this is required by
> POSIX, sometimes not.  See the recent effort to fix the x32 interface
> (mostly for size_t arguments).
> 
> Flags arguments that depend on the word size are incompatible with
> portable system calls, so arguably what the kernel is doing here is
> wrong: the additional bits can never be used for anything.

I mean, the unsigned long is odd. Most syscalls are using unsigned int
and new ones are basically expected to.

> 
> > And I wonder if we should just do:
> >
> > if (clone_flags & ~CLONE_LEGACY_FLAGS) /* 
> > 	return -EINVAL;
> >
> > but that might be a change in behavior, as legacy clone _never_ failed
> > when invalid values where passed.
> 
> Have any flags been added recently?

/* Flags for the clone3() syscall. */
#define CLONE_CLEAR_SIGHAND 0x100000000ULL /* Clear any signal handler and reset to SIG_DFL. */
#define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */

> 
> > (Note, that CLONE_LEGACY_FLAGS is already defined as
> > #define CLONE_LEGACY_FLAGS 0xffffffffULL
> > and used in clone3().)
> >
> > So the better option might be to do what you suggested, Florian:
> > if (clone_flags & ~CLONE_LEGACY_FLAGS)
> > 	clone_flags = CLONE_LEGACY_FLAGS?
> > and move on?
> 
> Not sure what you are suggesting here.  Do you mean an unconditional
> masking of excess bits?
> 
>   clone_flags &= CLONE_LEGACY_FLAGS;
> 
> I think I would prefer this:
> 
>   /* Userspace may have passed a sign-extended int value. */
>   if (clone_flags != (int) clone_flags) /* 
>  	return -EINVAL;
>   clone_flags = (unsigned) clone_flags;

My worry is that this will cause regressions because clone() has never
failed on invalid flag values. I was looking for a way to not have this
problem. But given what you say below this change might be ok/worth
risking?

> 
> > (Btw, iiuc, this would've always been a problem, right? In the sense that
> > userspace only got away with this because there were no additional flags
> > defined and couldn't.)
> 
> It depends on how the clone system call wrapper is implemented, and
> what the C function call ABI is like.  In some cases, you probably get
> zero-extension, as expected by the kernel.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
