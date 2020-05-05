Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6985B1C5189
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:05:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A1AB3C284A
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 11:05:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 559BD3C267A
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:05:41 +0200 (CEST)
Received: from albireo.enyo.de (albireo.enyo.de [37.24.231.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 491231400982
 for <ltp@lists.linux.it>; Tue,  5 May 2020 11:05:40 +0200 (CEST)
Received: from [172.17.203.2] (helo=deneb.enyo.de)
 by albireo.enyo.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1jVtWD-0004fp-Hu; Tue, 05 May 2020 09:05:37 +0000
Received: from fw by deneb.enyo.de with local (Exim 4.92)
 (envelope-from <fw@deneb.enyo.de>)
 id 1jVtWD-0004bH-Fj; Tue, 05 May 2020 11:05:37 +0200
From: Florian Weimer <fw@deneb.enyo.de>
To: Christian Brauner <christian.brauner@ubuntu.com>
References: <1038674044.11248021.1588663714272.JavaMail.zimbra@redhat.com>
 <87pnbi4y8x.fsf@mid.deneb.enyo.de>
 <20200505083205.qwwdiotmmjl23aje@wittgenstein>
Date: Tue, 05 May 2020 11:05:37 +0200
In-Reply-To: <20200505083205.qwwdiotmmjl23aje@wittgenstein> (Christian
 Brauner's message of "Tue, 5 May 2020 10:32:05 +0200")
Message-ID: <87a72m4uqm.fsf@mid.deneb.enyo.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

* Christian Brauner:

> Hm, as you observed, the kernel always defines the flags argument as
> unsigned long and afaict this has been the case since forever. So I'm
> not sure why the userspace wrapper is defined as taking an int for
> flags in the first place(?).

We have different types in many places.  Sometimes this is required by
POSIX, sometimes not.  See the recent effort to fix the x32 interface
(mostly for size_t arguments).

Flags arguments that depend on the word size are incompatible with
portable system calls, so arguably what the kernel is doing here is
wrong: the additional bits can never be used for anything.

> And I wonder if we should just do:
>
> if (clone_flags & ~CLONE_LEGACY_FLAGS) /* 
> 	return -EINVAL;
>
> but that might be a change in behavior, as legacy clone _never_ failed
> when invalid values where passed.

Have any flags been added recently?

> (Note, that CLONE_LEGACY_FLAGS is already defined as
> #define CLONE_LEGACY_FLAGS 0xffffffffULL
> and used in clone3().)
>
> So the better option might be to do what you suggested, Florian:
> if (clone_flags & ~CLONE_LEGACY_FLAGS)
> 	clone_flags = CLONE_LEGACY_FLAGS?
> and move on?

Not sure what you are suggesting here.  Do you mean an unconditional
masking of excess bits?

  clone_flags &= CLONE_LEGACY_FLAGS;

I think I would prefer this:

  /* Userspace may have passed a sign-extended int value. */
  if (clone_flags != (int) clone_flags) /* 
 	return -EINVAL;
  clone_flags = (unsigned) clone_flags;

> (Btw, iiuc, this would've always been a problem, right? In the sense that
> userspace only got away with this because there were no additional flags
> defined and couldn't.)

It depends on how the clone system call wrapper is implemented, and
what the C function call ABI is like.  In some cases, you probably get
zero-extension, as expected by the kernel.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
