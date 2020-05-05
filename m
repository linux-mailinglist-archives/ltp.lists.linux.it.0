Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8491C563F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:06:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 69DD83C57F2
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 15:06:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BBAED3C2660
 for <ltp@lists.linux.it>; Tue,  5 May 2020 12:21:59 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A50AA1A01197
 for <ltp@lists.linux.it>; Tue,  5 May 2020 12:21:58 +0200 (CEST)
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1jVui2-0001ht-VB; Tue, 05 May 2020 10:21:55 +0000
Date: Tue, 5 May 2020 12:21:54 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Florian Weimer <fw@deneb.enyo.de>
Message-ID: <20200505102154.2sxm7yt5v3up55v3@wittgenstein>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
 <87a72m4uqm.fsf@mid.deneb.enyo.de>
 <20200505091554.eq7kzvb4twe2wgvl@wittgenstein>
 <871rny4taz.fsf@mid.deneb.enyo.de>
 <20200505095813.z7kakdbiwq7ewnmx@wittgenstein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095813.z7kakdbiwq7ewnmx@wittgenstein>
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

On Tue, May 05, 2020 at 11:58:13AM +0200, Christian Brauner wrote:
> On Tue, May 05, 2020 at 11:36:36AM +0200, Florian Weimer wrote:
> > * Christian Brauner:
> > >> Have any flags been added recently?
> > >
> > > /* Flags for the clone3() syscall. */
> > > #define CLONE_CLEAR_SIGHAND 0x100000000ULL /* Clear any signal handler and reset to SIG_DFL. */
> > > #define CLONE_INTO_CGROUP 0x200000000ULL /* Clone into a specific cgroup given the right permissions. */
> > 
> > Are those flags expected to be compatible with the legacy clone
> > interface on 64-bit architectures?
> 
> No, they are clone3() only. clone() is deprecated wrt to new features.
> 
> > 
> > >> > (Note, that CLONE_LEGACY_FLAGS is already defined as
> > >> > #define CLONE_LEGACY_FLAGS 0xffffffffULL
> > >> > and used in clone3().)
> > >> >
> > >> > So the better option might be to do what you suggested, Florian:
> > >> > if (clone_flags & ~CLONE_LEGACY_FLAGS)
> > >> > 	clone_flags = CLONE_LEGACY_FLAGS?
> > >> > and move on?
> > >> 
> > >> Not sure what you are suggesting here.  Do you mean an unconditional
> > >> masking of excess bits?
> > >> 
> > >>   clone_flags &= CLONE_LEGACY_FLAGS;
> > >> 
> > >> I think I would prefer this:
> > >> 
> > >>   /* Userspace may have passed a sign-extended int value. */
> > >>   if (clone_flags != (int) clone_flags) /* 
> > >>  	return -EINVAL;
> > >>   clone_flags = (unsigned) clone_flags;
> > >
> > > My worry is that this will cause regressions because clone() has never
> > > failed on invalid flag values. I was looking for a way to not have this
> > > problem. But given what you say below this change might be ok/worth
> > > risking?
> > 
> > I was under the impression that current kernels perform such a check,
> > causing the problem with sign extension.
> 
> No, it doesn't, it never did. It only does it for clone3(). Legacy
> clone() _never_ reported an error no matter if you passed garbage flags
> or not. That's why we can't re-use clone() flags that have essentially
> been removed in kernel version before I could even program. :) Unless
> I'm misunderstanding what check you're referring to.
> 
> If I understood the original mail correctly, then the issue is caused by
> an interaction with sign extension and a the new flag value
> CLONE_INTO_CGROUP being defined.
> So from what I gather from Jan's initial mail is that when clone() is
> called on ppc64le with the CLONE_IO|SIGCHLD flag:
> clone(do_child, stack+1024*1024, CLONE_IO|SIGCHLD, NULL, NULL, NULL, NULL);
> that the sign extension causes bits to be set that raise the
> CLONE_INTO_CGROUP flag. And since the do_fork() codepath is the same for
> legacy clone() and clone3() the kernel will think that someone requested
> CLONE_INTO_CGROUP but hasn't passed a valid fd to a cgroup. If that is
> the only issue here then couldn't we just do:
> 
> clone_flags &= ~CLONE3_ONLY_FLAGS?
> 
> and move on, i.e. all future clone3() flags we'll just remove since we
> can assume that they have been accidently set. Even if they have been
> intentionally set we can just ignore them since that's in line with
> legacy clone()'s (questionable) tradition of ignoring unknown flags.
> Thoughts? Or am I missing some subtlety here?

So essentially:

diff --git a/kernel/fork.c b/kernel/fork.c
index 8c700f881d92..e192089f133e 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2569,12 +2569,15 @@ SYSCALL_DEFINE5(clone, unsigned long, clone_flags, unsigned long, newsp,
                 unsigned long, tls)
 #endif
 {
+       /* Ignore the upper 32 bits. */
+       unsigned int flags = (clone_flags & 0xfffffff);
+
        struct kernel_clone_args args = {
-               .flags          = (clone_flags & ~CSIGNAL),
+               .flags          = (flags & ~CSIGNAL),
                .pidfd          = parent_tidptr,
                .child_tid      = child_tidptr,
                .parent_tid     = parent_tidptr,
-               .exit_signal    = (clone_flags & CSIGNAL),
+               .exit_signal    = (flags & CSIGNAL),
                .stack          = newsp,
                .tls            = tls,
        }

(Note that kernel_clone_args->flags is a 64 bit unsigned integer.)

Christian

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
