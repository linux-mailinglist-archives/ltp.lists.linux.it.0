Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B6647CFEA
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 11:24:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96D4E3C9281
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 11:24:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2C17B3C620F
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 11:24:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id BA1C9600667
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 11:24:27 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01FC6210F7;
 Wed, 22 Dec 2021 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640168667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBlZQ0Wa+2/IrL5jIZ4QNYjE/pJD7TE6PWJkUs+QTdg=;
 b=2FqH/QIdWqxGpM0gfypn2h0MPApky4mQFeGlL922UaeglvOuYEl1gXlA3zt2+ZwmjEho5h
 dmdFPYHesUA/SV/xOA5AmUO3T2F5+4NPTfGoV+iQxyjprFGUtDWwb9BAKjZBmKPRXPJARZ
 ytpi4vtJguDkqyLcLD+na0v4tYXMPh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640168667;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OBlZQ0Wa+2/IrL5jIZ4QNYjE/pJD7TE6PWJkUs+QTdg=;
 b=vJZMCwzW6cKqoiYsbIbwKjpeMUmJ26lefePCN2TWh+B2dyEHPWjDMZN7wM59vVlQqQUiGF
 AUHz1Z4ciTh8lBDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C170513CDA;
 Wed, 22 Dec 2021 10:24:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fCaNLdr8wmFvdgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Dec 2021 10:24:26 +0000
Date: Wed, 22 Dec 2021 11:24:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YcL82UGphHruor3+@pevik>
References: <20211221193500.31950-1-pvorel@suse.cz>
 <61C28CB8.3050209@fujitsu.com>
 <CAEemH2cqTErtNZka8X3L3AgOhy-a2x8fqy1k-QKJWiXc7wA2fA@mail.gmail.com>
 <61C2C02A.90104@fujitsu.com> <YcLeaPJmSvmUJwJO@pevik>
 <61C2E3DB.9070004@fujitsu.com>
 <CAEemH2dpLJ9N57TpMhW3wMkd-V0cZMPWyH_sXn6KjXoWJWUC4g@mail.gmail.com>
 <YcL5XG6azJuGTys7@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YcL5XG6azJuGTys7@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] lib: Skip tst_{disable,
 enable}_oom_protection() for non-root
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, all,

> Hi!
> > > >>> This is not working as expected in Github CI. I'm still looking at the
> > > >>> problem.

> > > https://github.com/wangli5665/ltp/runs/4602025797?check_suite_focus=true
> > > >> I tested local but it works well. I guess ci fails because of linux user
> > > >> namespace. Maybe we should require CAP_SYS_RESOURCE cap instead of using
> > > >> geteuid.
> > > > Good catch, verifying.
> > > You can refer to my ltp fork
> > > https://github.com/xuyang0410/ltp/commits/oom_kill_ci_fixes


> > +1

> > I was thinking of adding the permission but that's
> > might not be a good way for the namespace. Like your
> > method which only does check and return is better.

> Wouldn't it be actually easier just to catch the error from the actual
> write? The whole problem here is that we use SAFE_PRINTF() on something
> that may actualy fail and the failure shouldn't be fatal at all.

We use just FILE_PRINTF(), but we check the result and TWARN, which causes the
failure in CI.

I've sent v2, which checks CAP_SYS_ADMIN and CAP_SYS_RESOURCE,
but feel free just to bring simpler solution.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
