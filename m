Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9EB266091
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 15:47:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A1D513C4FC9
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Sep 2020 15:47:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BA9583C2BDD
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 15:47:10 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7DC491000F2E
 for <ltp@lists.linux.it>; Fri, 11 Sep 2020 15:47:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 734A4AD4A;
 Fri, 11 Sep 2020 13:47:25 +0000 (UTC)
Date: Fri, 11 Sep 2020 15:47:39 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200911134739.GB4608@yuki.lan>
References: <cover.1599545766.git.viresh.kumar@linaro.org>
 <20200911095314.GA9505@dell5510>
 <20200911103950.kehhklgyie2tqpxh@vireshk-i7>
 <20200911110141.6vgc44hrl2hbtq3r@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911110141.6vgc44hrl2hbtq3r@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls: Use common variants structure
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > --- a/include/time64_variants.h
> > +++ b/include/time64_variants.h
> > @@ -7,10 +7,13 @@
> >  #ifndef TIME64_VARIANTS_H
> >  #define TIME64_VARIANTS_H
> >  
> > +#ifdef HAVE_LIBAIO
> >  #include <libaio.h>
> > +#endif /* HAVE_LIBAIO */
> > +
> >  #include <signal.h>
> >  #include <stdio.h>
> > -#include <sys/poll.h>
> > +#include <poll.h>
> >  #include <time.h>
> >  #include "tst_timer.h"
> >  
> > @@ -32,8 +35,12 @@ struct time64_variants {
> >         int (*timer_settime)(kernel_timer_t timerid, int flags, void *its, void *old_its);
> >         int (*tfd_gettime)(int fd, void *its);
> >         int (*tfd_settime)(int fd, int flags, void *new_value, void *old_value);
> > +
> > +#ifdef HAVE_LIBAIO
> >         int (*io_pgetevents)(io_context_t ctx, long min_nr, long max_nr,
> >                         struct io_event *events, void *timeout, sigset_t *sigmask);
> > +#endif /* HAVE_LIBAIO */
> > +
> >         int (*mqt_send)(mqd_t mqdes, const char *msg_ptr, size_t msg_len,
> >                         unsigned int msg_prio, void *abs_timeout);
> >         ssize_t (*mqt_receive)(mqd_t mqdes, char *msg_ptr, size_t msg_len,
> 
> And both these changes broke my build. I don't even understand how
> could the ifdef change break it for me :(

My guess would be missing include for "config.h" in this file to get
HAVE_LIBAIO definitions.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
