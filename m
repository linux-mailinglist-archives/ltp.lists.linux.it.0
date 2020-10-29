Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 461AC29F0B2
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:01:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 057033C3197
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Oct 2020 17:01:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C54E23C30C4
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:01:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 819586017D9
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 17:01:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1C4DB03E
 for <ltp@lists.linux.it>; Thu, 29 Oct 2020 16:01:44 +0000 (UTC)
Date: Thu, 29 Oct 2020 17:02:22 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20201029160222.GD8378@yuki.lan>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-5-mdoucha@suse.cz>
 <20201029155907.GC8378@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029155907.GC8378@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 04/19] Unify error handling in lib/safe_file_ops.c
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
> > diff --git a/lib/safe_file_ops.c b/lib/safe_file_ops.c
> > index e06d399fa..a63368875 100644
> > --- a/lib/safe_file_ops.c
> > +++ b/lib/safe_file_ops.c
> > @@ -84,9 +84,8 @@ int file_scanf(const char *file, const int lineno,
> >  	f = fopen(path, "r");
> >  
> >  	if (f == NULL) {
> > -		tst_resm(TWARN,
> > -			"Failed to open FILE '%s' at %s:%d",
> > -			 path, file, lineno);
> > +		tst_resm_(file, lineno, TWARN, "Failed to open FILE '%s'",
> > +			path);
> >  		return 1;
> 
> scanf() returns negative value on error, I guess it would make more
> sense to return -1 here and in many cases below.

That's true for printf() scanf returns EOF instead. But I guess that
anything < 0 would work better than 1 which means that one input item
was matched successfuly...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
