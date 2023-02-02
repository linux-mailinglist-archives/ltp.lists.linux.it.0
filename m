Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0156876BD
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Feb 2023 08:49:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 02BFE3CB291
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Feb 2023 08:49:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 748483CB27D
 for <ltp@lists.linux.it>; Thu,  2 Feb 2023 08:49:51 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D68FE1400F8B
 for <ltp@lists.linux.it>; Thu,  2 Feb 2023 08:49:50 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C72C433D4B;
 Thu,  2 Feb 2023 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1675324189;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+9EE4t2VP/7fKXoqLd6UsyJOYW+8Qo3fANuIejDHn2g=;
 b=VNx7hhc18ca9BcZqej1RnowWSQGGYpZjYqv0Wro3C/1Ci86yvrDU/oiqdFxUbHkIpO/439
 yi8CNs6arzPkJEHZX4Zm+hMZpp8WAH/dF9pJErL6L7mEUvO4+oWKJf62KyVUXMA7PiC7S1
 Gr0Pj46iY8zst4svv7lYgnMVVS8rt2g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1675324189;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+9EE4t2VP/7fKXoqLd6UsyJOYW+8Qo3fANuIejDHn2g=;
 b=WCiCVuu16ERqkjSy4SqY8fzGWNEEaYqTFxuseCI32Vgsf7KD3FEJU8PNkszl6Cwz6cxEXs
 AQ6gyOaciWdVG+BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96416139D0;
 Thu,  2 Feb 2023 07:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CIDWIh1r22PDDQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 02 Feb 2023 07:49:49 +0000
Date: Thu, 2 Feb 2023 08:49:47 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Edward Liaw <edliaw@google.com>
Message-ID: <Y9trG4QnXUEbhBbJ@pevik>
References: <20230131002532.459456-1-edliaw@google.com>
 <Y9paGafh97zKnu/j@pevik>
 <CAG4es9V2773dyVrDwt7fiUq=VkUrn0Tr8icCC=X3xx+RGrbR9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG4es9V2773dyVrDwt7fiUq=VkUrn0Tr8icCC=X3xx+RGrbR9A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] close_range: check for kernel support below 5.9
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Edward,

> Hi Petr,

> > > +++ b/include/lapi/close_range.h
> > > @@ -25,4 +25,17 @@ static inline int close_range(unsigned int fd, unsigned int max_fd,
> > >       return tst_syscall(__NR_close_range, fd, max_fd, flags);
> > >  }
> > >  # endif
> > > +
> > > +static inline void close_range_supported_by_kernel(void)
> > > +{
> > > +     long ret;
> > > +
> > > +     if ((tst_kvercmp(5, 9, 0)) < 0) {
> > > +             /* Check if the syscall is backported on an older kernel */
> > BTW what particular use case this fixed? Is it backported to some android
> > kernel? Or to some enterprise distro? Because I don't think kernel stable trees
> > accept new functionality, just fixes.

> Oops, should I use .min_kver instead?  It isn't backported on Android;
> I just wasn't sure what the right approach was.

Actually, looking into SLES kernel sources, we backported close_range() to SLES
15-SP3 (bsc#1179090), which was 5.3.18 based. Thus you actually did good work :).

@Li, @Jan out of curiosity, was this backported to RHEL kernel as well?
It'd be useful to note that (one day we will be able to remove it once kernels
which backported are EOL).

Kind regards,
Petr

> Thanks,
> Edward

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
