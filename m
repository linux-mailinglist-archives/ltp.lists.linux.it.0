Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E93CF706
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 11:40:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D20F93C65BC
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 11:40:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3B24B3C6296
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 11:40:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4B31960094A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 11:40:39 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A51E322400;
 Tue, 20 Jul 2021 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626774038;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4iL4dC0cPxKmFoHHk7kMp+sRs2oTB1IYVk45blUnZw=;
 b=0xsLJda00VshSpxdLcomqMfRSNv/KYS6KA0KxtFdsGnVFTnyuy8x8Hi4HTSa8jCCks0FOX
 Ot583c/Ft6N6oeMmbsAl9UTRV/EvL7OOxr5u0vQXmnoGqDCibOV50g9NCSF7OcaJ69HQ+Y
 vjFyzlg81CnTDnDR3JDdRSwpeiYz/Bk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626774038;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z4iL4dC0cPxKmFoHHk7kMp+sRs2oTB1IYVk45blUnZw=;
 b=qzzcYV8BypkK/v0dbryhdTm0IJ0Xj6LMmZJg1mhWlIqlvhDYGAh919qwzCdLZq5G5s0aZp
 oCqWq10DXFSibnCA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 655F613AA2;
 Tue, 20 Jul 2021 09:40:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id kQ8rFhaa9mAoJAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 20 Jul 2021 09:40:38 +0000
Date: Tue, 20 Jul 2021 11:40:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YPaaFAdTO9coCUxN@pevik>
References: <20210720063852.1883-1-zhanglianjie@uniontech.com>
 <YPaBnxlp2SsxCaPE@pevik>
 <045e5fc2-05a7-e006-3bb6-2f536c5634b4@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <045e5fc2-05a7-e006-3bb6-2f536c5634b4@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] stime: Only o32 system calls require 32-bit
 programs on mips
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi zhanglianjie,

[ Cc Thomas Bogendoerfer, MIPS kernel maintainer ]

> On 2021-07-20 15:56, Petr Vorel wrote:
> > Hi zhanglianjie,

> > > The stime() system call is only o32, not n32 and n64. If you do not
> > > specify that the current program is compiled to 32-bit when compiling
> > > the program on mips, the stime() system call will fail when the
> > > program is running.
> > You're right that stime() is only on o32. But tst_syscall() should catch that.
> > Or does it set different errno than ENOSYS?

> The returned errno is EFAULT. The o32 system call of stime is implemented on
> mips, so ENOSYS will not be returned.
I see.

> COMPAT_SYSCALL_DEFINE1(stime, compat_time_t __user *, tptr)
> {
>     ...
>     if (get_user(tv.tv_sec, tptr))
>         return -EFAULT;
>     ...
> }

> The tptr address is in the user space 0x120010da0, and after the system
> call, it is 0x20010da0 in the kernel state, and the upper 32 bits are set to
> 0, resulting in a failure to copy data from the user space to the kernel
> space.
Thanks for explanation.

> This patch needs to be modified and cannot affect other architectures.
Yes, o2 has to fixed, but agree that this would affect other archs which
supports __NR_stime, i.e. i386 now also complains:
stime_var.h:31: TCONF: the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit

but it should stay:
stime02.c:37: TPASS: stime(2) fails, Caller not root: EPERM (1)

> > ...
> > > +#if defined(__mips__) && _MIPS_SZLONG == 32
Not sure if this would work to whitelist only mips n32 and n64 (keep mips o32
and all other archs):
#if ! defined(_MIPS_SZLONG) || _MIPS_SZLONG == 32

Kind regards,
Petr

> > >   		return tst_syscall(__NR_stime, ntime);
> > > +#else
> > > +		tst_brk(TCONF, "the stime() syscall only o32 ABI in mips, make sure the current program is 32-bit");
> > > +#endif

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
