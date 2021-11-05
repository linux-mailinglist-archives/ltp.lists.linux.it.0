Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB74464BF
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:21:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFB023C764C
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:21:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A361C3C559D
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:21:47 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0438A1A014DE
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:21:46 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43B751FD36;
 Fri,  5 Nov 2021 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1636122106; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xdPzOX2fZI2f5KMS+gkVYWL9AXiHZ9RJf46Dxb3pZEo=;
 b=JtowDtyuB5iRKpe0vyx0kcRO0SGpsIpnDRy/+Iu70ATeUIyq7XdvAuybS+H9j5rdhR16qs
 v8XzRqBRgnBVOv/NhA2jQB4EHxTcm92t6uNAbViCCcDAttIW/3vg9JN+u/VIYylYZR4oTn
 AICaXK6ixncWVIYfDNUZtv4X5/+46cI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1636122106;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xdPzOX2fZI2f5KMS+gkVYWL9AXiHZ9RJf46Dxb3pZEo=;
 b=wJc+BDdIW18s3OVpiwXCuTCAQx80YGkmvSaRx1bVQBc2wDu0/2JcoTNt2qSajfPy/lFTUv
 c2D01TEmn8dTULDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 239861400B;
 Fri,  5 Nov 2021 14:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mTNoB/o9hWGdBAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 05 Nov 2021 14:21:46 +0000
Date: Fri, 5 Nov 2021 15:22:43 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YYU+M0vYgqu6Nzr+@yuki>
References: <20190615042048.29839-1-liwang@redhat.com> <877ddpo35n.fsf@suse.de>
 <CAEemH2fDxJ1xQ9qNejHDxv0p_Cx2cq5LsXTesuhAEBrDe43Hmg@mail.gmail.com>
 <YYKYR4kspdlXuoDB@yuki>
 <CAEemH2e4sp_CYbAF05EA80Y1ggVG6yjRFp=-4EOudGBjTh7Wkg@mail.gmail.com>
 <YYO1WZh7Kz+en5nY@yuki> <87ee7u9b30.fsf@suse.de>
 <CAEemH2cYPVqJBQzLoZwNCkv1m4X2o5LgOmVxr18mEyGrxjj9Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cYPVqJBQzLoZwNCkv1m4X2o5LgOmVxr18mEyGrxjj9Ug@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
 structure
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > Also I guess that it would be slightly easier to work with as an enum,
> > > so that we can do:
> > >
> > >       switch (tst_arch) {
> > >       case TST_X86_64:
> > >               ...
> > >       break;
> > >       case TST_PPC64_LE:
> >
> > I prefer enum as well. As an aside, we don't want to include LE in
> >
> 
> Sure, but I'm now thinking to extend the tst_arch as a structure
> so that could also be used in a string:
> 
>     enum tst_arch_type {
>             TST_I386,
>             TST_X86_64,
>             ...
>             TST_SPARC,
>     };
> 
>     /*
>      * This tst_arch is to save the system architecture for
>      * using in the whole test case.
>      */
>     extern struct arch {
>              const char name[16];
>              enum tst_arch_type type;
>     } tst_arch;

Or we can add a function to translate the enums into strings as:

const char *tst_arch_name(enum tst_arch arch);

> then we just can do simply in case:
> 
>     switch (tst_arch.type) {
>     case TST_X86_64:
>         ...
>     break;
> 
> 
> 
> > ppc64. If someone finds that the byte order is significant for a test
> >
> 
> Yes, or we can read info via uname() into 'utsname.machine' for
> ppc64le if really needed.
> 
> 
> > then we can add ppc64le or ppc64be. Also at some point we may need to
> > add a "machine" field for e.g. POWER8, i386 etc.
> >
> 
> Adding a new field '.machine' maybe not be necessary if just
> for POWER8/9/10, or can we find a way to combine them together
> with .supported_arch?  Umm, I'm still hesitating.

This is going to get complicated quite fast. I do not think that we need
such granularity now, but if we ever do I think it can be done as a
subtype. E.g.:

enum tst_arch {
	TST_X86,
	TST_X86_64,
	TST_PPC64,
};

enum tst_x86_subarch {
	TST_386,
	TST_486,
	TST_686,
};

enum tst_ppc_subarch {
{
	TST_POWER8,
	TST_POWER9,
	TST_POWER10,
};

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
