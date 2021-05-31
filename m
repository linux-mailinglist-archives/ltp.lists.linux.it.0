Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5E63959BA
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:29:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B5C453C80DA
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 13:29:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8DC463C1DFA
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:29:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 933201400C50
 for <ltp@lists.linux.it>; Mon, 31 May 2021 13:29:29 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C89F62191B;
 Mon, 31 May 2021 11:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622460568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hKuTydaJ5+dnzri0CjPAPNLisUzv5bln11xHp/jMpo=;
 b=D0LLO0+0qcprTUYT8PKizkBX6U/Ml8VYSp9z6QBV6rhIeHjd+IdTVY/a/STDArSYE4d/Tb
 hdlmJfpvW7m9i5Ex9pJytOyE357SK5VyS7/SpWzXZKv6V+Fj+u35ZFpItBOv0rbsp8JXx7
 338/+F407VfrSMdGSNGpF3PhWElE72M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622460568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hKuTydaJ5+dnzri0CjPAPNLisUzv5bln11xHp/jMpo=;
 b=bUaK8T+hthllZO/XZCdLluwstuuAvvsqzBoW7WHsb5p8GLX4YjRyYFBcfnsh2D8/f7mM3D
 yuQFjal6dqy1fBBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E44E5118DD;
 Mon, 31 May 2021 11:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622460568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hKuTydaJ5+dnzri0CjPAPNLisUzv5bln11xHp/jMpo=;
 b=D0LLO0+0qcprTUYT8PKizkBX6U/Ml8VYSp9z6QBV6rhIeHjd+IdTVY/a/STDArSYE4d/Tb
 hdlmJfpvW7m9i5Ex9pJytOyE357SK5VyS7/SpWzXZKv6V+Fj+u35ZFpItBOv0rbsp8JXx7
 338/+F407VfrSMdGSNGpF3PhWElE72M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622460568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hKuTydaJ5+dnzri0CjPAPNLisUzv5bln11xHp/jMpo=;
 b=bUaK8T+hthllZO/XZCdLluwstuuAvvsqzBoW7WHsb5p8GLX4YjRyYFBcfnsh2D8/f7mM3D
 yuQFjal6dqy1fBBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id yC+XNpHItGAEHgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 31 May 2021 11:29:21 +0000
Date: Mon, 31 May 2021 13:03:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YLTChg9cpc91FVI9@yuki>
References: <20210528182549.14347-1-chrubis@suse.cz> <YLKRtWlnuRV2cLbM@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YLKRtWlnuRV2cLbM@pevik>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.50
X-Spamd-Result: default: False [0.50 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCPT_COUNT_TWO(0.00)[2]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] doc: Modernize test-writing-guidelines
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > -In case of LTP testcases it's customary to add a paragraph with highlevel test
> > -description somewhere at the beginning of the file (usually right under the GPL
> > -header). This helps other people to understand the overall goal of the test
> > -before they dive into the technical details.
> > +* First of all I will repeat *Keep things simple*
> > +
> > +* Keep function and variable names short but descriptive, choosing a good name
> > +  for an API function is very difficuilt task; do not underestimate it
> typo: difficuilt => difficult
> > +
> > +* Keep functions reasonably short and focused on a single task
> BTW we are in the section "1.4 Commenting code", shouldn't be in some section
> for general coding rules (for both C and shell)? Maybe under "1.3 Coding style"

I guess so, maybe this part should be moved up and renamed to "General
guide lines".

> > +
> > +* Be consistent
> > +
> > +* Avoid deep nesting
> > +
> > +* DRY
> maybe:
> * https://en.wikipedia.org/wiki/Don%27t_repeat_yourself[DRY]
> 
> But DRY is the same as "1.2 Code duplication"
> 
> Also, I'd note for "Keep lines under 80 chars": for strings (log messages) we
> prefer lines under 100 chars than splitting string.

Sure.

> > +If there is a code that requires to be commented keep it short and to the
> > +point. These comments should explain *why* and not *how* thigs are done.
> typo: thigs => things
> > +
> > +Never ever comment the obvious.
> > +
> > +In case of LTP testcases it's customary to add a comment with an asciidoc
> > +formatted paragraph with highlevel test description at the beginning of the
> > +file right under the GPL SPDX header. This helps other people to understand
> > +the overall goal of the test before they dive into the technical details. It's
> > +also exported into generated documentation hence it should mostly explain what
> > +is tested and why.
> 
> >  1.5 Backwards compatibility
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > @@ -124,20 +143,27 @@ toolchain supplied by the manufacturer.
> 
> >  Therefore LTP test for more current features should be able to cope with older
> >  systems. It should at least compile fine and if it's not appropriate for the
> > -configuration it should return 'TCONF' (see test interface description below).
> > +configuration it should return 'TCONF'.
> 
> >  There are several types of checks we use:
> 
> >  The *configure script* is usually used to detect availability of a function
> > -declarations in system headers. It's used to disable tests at compile time.
> > -
> > -We also have runtime kernel version detection that can be used to disable
> > -tests at runtime.
> > +declarations in system headers. It's used to disable tests at compile time or
> > +to enable fallback definitions.
> >  Checking the *errno* value is another type of runtime check. Most of the
> >  syscalls returns either 'EINVAL' or 'ENOSYS' when syscall was not implemented
> >  or was disabled upon kernel compilation.
> 
> > +LTP has kernel version detection that can be used to disable tests at runtime,
> > +unfortunatelly kernel version does not always corresponds to a well defined
> typo: unfortunatelly => unfortunately
> > +feature set as distributions tend to backport hundreds of patches while the
> > +kernel version stays the same. Use with caution.
> > +
> > +Lately we added kernel '.config' parser, a test can define a boolean
> > +expression of kernel config variables that has to be satisfied in order for a
> > +test to run. This is mostly used for kernel namespaces at the moment.
> ...
> 
> >  Tests are generally placed under the 'testcases/' directory. Everything that
> >  is a syscall or (slightly confusingly) libc syscall wrapper goes under
> > -'testcases/kernel/syscalls/'. Then there is 'testcases/open_posix_testsuite'
> > -which is a well maintained fork of the upstream project that has been dead
> > -since 2005 and also a number of directories with tests for more specific
> > -features.
> > +'testcases/kernel/syscalls/'.
> 
> Maybe also mention testcases/cve/ and why tests are duplicated?

Tests are not duplicated there, only in the runtest files...

> Not sure if it's worth to mention testcases/network/; also there are other
> directories. But I suppose you don't want to be too verbose here atm.
> Maybe one day (after we have done a cleanup of old unsupported things)
> we should describe here or in testcases/README.md all subdirectories.

Well the whole LTP structure is a bit random and there are no good rules
on where things belong to...

I will send a v2 later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
