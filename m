Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 742AE4464B2
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:14:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E30673C7596
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 15:14:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C11113C559D
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:14:04 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1C5201401241
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 15:14:03 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6F5E01FD36;
 Fri,  5 Nov 2021 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636121643;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mFQfDYAtBC4XYc+5Zi1gpUGm5VVCki70d4nwLEyeN6k=;
 b=CLMpnmOevt+2JJ0Z9zZpBk4opv+GaL35xMT/iWdYKFNKJLu3vpZsIvCJFwxd6Jk+jGFMqY
 EJ7YqiPmoK6jqqzE5za3srK4zah/EFDiDMIL1UBZveyaMQZkXch42a0nPyfYjnfT+UcbLR
 Ty1eMRPFT8x0zjy99k7k2PRhuEjzjdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636121643;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mFQfDYAtBC4XYc+5Zi1gpUGm5VVCki70d4nwLEyeN6k=;
 b=qw9e5AYz1EBPTpgvQq0zfbDJDF493w5qmAnzEEMVXxsBxOVWizah5hkBIPIqjqtSrhPRnN
 EpzH1+K5MBVJJJDw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1EACF2C160;
 Fri,  5 Nov 2021 14:14:03 +0000 (UTC)
References: <20190615042048.29839-1-liwang@redhat.com> <877ddpo35n.fsf@suse.de>
 <CAEemH2fDxJ1xQ9qNejHDxv0p_Cx2cq5LsXTesuhAEBrDe43Hmg@mail.gmail.com>
 <YYKYR4kspdlXuoDB@yuki>
 <CAEemH2e4sp_CYbAF05EA80Y1ggVG6yjRFp=-4EOudGBjTh7Wkg@mail.gmail.com>
 <YYO1WZh7Kz+en5nY@yuki> <87ee7u9b30.fsf@suse.de>
 <CAEemH2cYPVqJBQzLoZwNCkv1m4X2o5LgOmVxr18mEyGrxjj9Ug@mail.gmail.com>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Fri, 05 Nov 2021 13:55:23 +0000
In-reply-to: <CAEemH2cYPVqJBQzLoZwNCkv1m4X2o5LgOmVxr18mEyGrxjj9Ug@mail.gmail.com>
Message-ID: <871r3u8zbs.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hell Li,

Li Wang <liwang@redhat.com> writes:

>  
>  
>  > Quite the opposite, it should be an array of strings, so that it's easy
>  > to work with such as:
>  >
>  >       .supported_archs = (const char *const []){"x86_64", "ppc64le", NULL},
>  >
>  > We can put it into a single string delimited by a space, but that would
>  > be more complicated to work with.
>  >
>  >> > However the hard part would be keeping the actual code and metadata in
>  >> > sync, we still have to keep the ifdefs in the code.
>  >> >
>  >> 
>  >> Yes, some inline assemble require ifdefs.
>  >> 
>  >> Btw, I look back at the reviews and find Jan said:
>  >>     "I can see how tst_on_arch() would be useful. Test is valid
>  >>      on all arches, but needs different input/constants/code/etc."
>  >> 
>  >> That may be a slight reason for keeping tst_on_arch.
>  >
>  > I guess that we should reviewe the code we have, I guess that there are
>  > a few tests where we can get rid of a few ifdefs by doing the checks
>  > dynamically.
>  >
>  > Also I guess that it would be slightly easier to work with as an enum,
>  > so that we can do:
>  >
>  >       switch (tst_arch) {
>  >       case TST_X86_64:
>  >               ...
>  >       break;
>  >       case TST_PPC64_LE:
>
>  I prefer enum as well. As an aside, we don't want to include LE in
>
> Sure, but I'm now thinking to extend the tst_arch as a structure
> so that could also be used in a string:

+1

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
>
> then we just can do simply in case:
>
>     switch (tst_arch.type) {
>     case TST_X86_64:
>         ...
>     break;
>
>  
>  ppc64. If someone finds that the byte order is significant for a test
>
> Yes, or we can read info via uname() into 'utsname.machine' for
> ppc64le if really needed.
>  
>  then we can add ppc64le or ppc64be. Also at some point we may need to
>  add a "machine" field for e.g. POWER8, i386 etc.
>
> Adding a new field '.machine' maybe not be necessary if just
> for POWER8/9/10, or can we find a way to combine them together
> with .supported_arch?  Umm, I'm still hesitating.

If it's required then I guess you could add it to the tst_arch_type as
an optional field. Perhaps as cpu_model. Or it could be added to a
separate section for required hardware.

>  
>  
>  Which btw, I have some buildroot and QEMU scripts which can be used to
>  test ppc64 BE and any other machine you have the hardware or QEMU
>  emulator for.
>
>  https://gitlab.com/Palethorpe/cross
>
> Thanks for sharing.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
