Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC442EEFB8
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:34:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1AF793C3160
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Jan 2021 10:34:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E6DAE3C291E
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:33:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 642882005F8
 for <ltp@lists.linux.it>; Fri,  8 Jan 2021 10:33:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8CDECACAF;
 Fri,  8 Jan 2021 09:33:56 +0000 (UTC)
Date: Fri, 8 Jan 2021 10:34:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <X/gnOarZhZhOy+mQ@yuki.lan>
References: <20201223033517.1464263-1-gengcixi@gmail.com>
 <20201223033517.1464263-3-gengcixi@gmail.com>
 <X/cTWFNvtJ5NCyOh@yuki.lan>
 <CAF12kFvhp0sVfrX9Rhe2XumZPVCA_em51UVr2QkiHOpECC4mDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFvhp0sVfrX9Rhe2XumZPVCA_em51UVr2QkiHOpECC4mDg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] lib: implement rtctime_save and
 rtctime_restore function
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
Cc: Cixi Geng <cixi.geng1@unisoc.com>, LTP List <ltp@lists.linux.it>,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > +void tst_rtctime_restore(void)
> > > +{
> > > +     static struct timespec mono_end, elapsed;
> > > +     static struct timespec rtc_begin_tm, rtc_adjust;
> > > +     static struct rtc_time rtc_restore;
> > > +
> > > +     if (!clock_saved)
> > > +             return;
> > > +
> > > +     clock_saved = 0;
> > > +
> > > +     if (tst_clock_gettime(CLOCK_MONOTONIC_RAW, &mono_end))
> > > +             tst_brk(TBROK | TERRNO, "tst_clock_gettime() monotonic failed");
> > > +
> > > +     elapsed = tst_timespec_diff(mono_end, mono_begin);
> > > +
> > > +     rtc_begin_tm.tv_sec = tst_rtc_tm_to_time(&rtc_begin);
> >
> > We should clear the tv_nsec here otherwise it will contain garbage.
> The rtc_begin_tm is defined in this function??? and tv_nsec never assigned???
> so I think it will not produce any garbage.

It's never assigned and declared on stack, so it will contain garbage
which will be eventually added to the rtc_adjust.tv_sec. Technically
the tv_nsec is long, so on 64 bit platform it may add up to 10^10
seconds to the result if we are unlucky and upper bits are set. On 32
bit there is not much room for error btw, up to 2 seconds since long is
only 4bytes there.

> > > +     rtc_adjust = tst_timespec_add(rtc_begin_tm, elapsed);
> > > +
> > > +     tst_rtc_time_to_tm(rtc_adjust.tv_sec, &rtc_restore);
> > > +
> > > +     /* restore realtime clock based on monotonic delta */
> > > +     if (tst_rtc_settime(&rtc_restore))
> > > +             tst_brk(TBROK | TERRNO, "tst_rtc_settime() realtime failed");
> > > +}
> >
> > Other than this, it looks good.
> >
> > --
> > Cyril Hrubis
> > chrubis@suse.cz

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
