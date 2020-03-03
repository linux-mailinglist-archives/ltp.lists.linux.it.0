Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050A177541
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:27:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8ACA3C66DF
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:27:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 8BC2D3C66CD
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:27:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 816C9201356
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:27:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D96CCAFD8
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:27:25 +0000 (UTC)
Date: Tue, 3 Mar 2020 12:27:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200303112725.GA24389@rei.lan>
References: <20200221120850.15874-1-mdoucha@suse.cz>
 <20200303104737.GA42129@gacrux.arch.suse.de>
 <20200303110249.GB42129@gacrux.arch.suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303110249.GB42129@gacrux.arch.suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2017-10661
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
> > > +++ b/testcases/kernel/syscalls/timerfd/Makefile
> > > @@ -20,6 +20,7 @@ top_srcdir		?= ../../../..
> 
> > >  include $(top_srcdir)/include/mk/testcases.mk
> 
> > > -LDLIBS			+= -lpthread -lrt
> > > +timerfd_settime02:	CFLAGS	+= -pthread
> > > +timerfd_settime02:	LDLIBS	+= -pthread -lrt
> > Interesting, I thought -pthread wouldn't be needed to be in LDLIBS
> > (enough to have it in CFLAGS), but old distros (CentOS 6 in our travis: gcc
> > 4.4.7, glibc 2.12).
> 
> OK: it can be just this:
> timerfd_settime02:	CFLAGS	+= -pthread
> timerfd_settime02:	LDLIBS	+= -lrt
> 
> because failure in CentOS 6 is different:
> timerfd01.c:36: undefined reference to `clock_gettime'
> https://api.travis-ci.org/v3/job/657694167/log.txt
>
> Obviously we need autotools check for it (trivial, I can do it before merge).

-lrt is required in LDLIBS for older libc that had all the posix
realtime outside of the glibc.so, and it's harmless on newer glibc so
for the time being we just need -lrt in LDLIBS for quite a lot of
testcases...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
