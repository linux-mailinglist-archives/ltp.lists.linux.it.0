Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 721452FF09A
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:40:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D2383C7C90
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Jan 2021 17:40:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A87D53C02FA
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:40:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2DF2310006B6
 for <ltp@lists.linux.it>; Thu, 21 Jan 2021 17:40:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6500FAC63;
 Thu, 21 Jan 2021 16:40:06 +0000 (UTC)
Date: Thu, 21 Jan 2021 17:40:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YAmuZAu60JoqZYd7@pevik>
References: <20210121133233.29007-1-pvorel@suse.cz>
 <20210121133233.29007-2-pvorel@suse.cz> <YAmq/L8u+vh9JL2w@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAmq/L8u+vh9JL2w@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: Fix kernel module detection on BusyBox
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
Cc: kernel-team@android.com, Steve Muckle <smuckle@google.com>,
 Sandeep Patil <sspatil@google.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Hi!
> > +int tst_check_driver(const char *driver)
> > +{
> > +#ifdef __ANDROID__
> > +	/*
> > +	 * Android may not have properly installed modules.* files. We could
> > +	 * search modules in /system/lib/modules, but to to determine built-in
> > +	 * drivers we need modules.builtin. Therefore assume all drivers are
> > +	 * available.
> >  	 */
> >  	return 0;
> >  #endif
> > +
> > +	if (!tst_check_driver_(driver))
> > +		return 0;
> > +
> > +	int ret = 1;

> One last nit, shouldn't this be -1?

> Since the tst_check_driver_() returns either 0 or -1.

> Or should we change tst_check_driver_() to return 0 or 1 instead?

Oops, yes the value should be the same.
I prefer -1 as that's error in syscalls, but no strong opinion about it.

> Other than that this version looks good,

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

Thanks a lot for your patient review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
