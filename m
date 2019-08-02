Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFED7F7B9
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 15:03:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F045F3C202E
	for <lists+linux-ltp@lfdr.de>; Fri,  2 Aug 2019 15:03:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8857C3C200E
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 15:03:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E96D220092F
 for <ltp@lists.linux.it>; Fri,  2 Aug 2019 15:03:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4079CAFF6;
 Fri,  2 Aug 2019 13:03:03 +0000 (UTC)
Date: Fri, 2 Aug 2019 15:03:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190802130301.GC27727@rei>
References: <20190411233115.32744-1-pvorel@suse.cz>
 <20190411233115.32744-4-pvorel@suse.cz>
 <20190712134833.GA21258@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190712134833.GA21258@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 3/3] make: Add
 -Werror-implicit-function-declaration for all targets
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
> > diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
> > index 913bdf5d1..3ffdd0b7f 100644
> > --- a/include/mk/env_post.mk
> > +++ b/include/mk/env_post.mk
> > @@ -41,11 +41,9 @@ ifeq ($(UCLINUX),1)
> >  CPPFLAGS			+= -D__UCLIBC__ -DUCLINUX
> >  endif
> 
> > -ifeq ($(ANDROID),1)
> > -# There are many undeclared functions, it's best not to accidentally overlook
> > -# them.
> >  CFLAGS				+= -Werror-implicit-function-declaration
> 
> > +ifeq ($(ANDROID),1)
> >  LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
> >  LDFLAGS				+= -L$(top_builddir)/lib/android_librt
> >  endif
> 
> Ping, please. Drop it or merge?

My opinion on Werror flags is that they should be on for development but
disabled for releases and production. The question is how to implement
something like this.

On the other hand we do have a CI so most problems would be caught
there...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
