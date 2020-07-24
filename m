Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 733AF22C670
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:28:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3EB063C4CFE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:28:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6B27A3C2642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:28:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D12B460213C
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:28:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8EB2CB024;
 Fri, 24 Jul 2020 13:28:56 +0000 (UTC)
Date: Fri, 24 Jul 2020 15:29:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200724132913.GH9768@yuki.lan>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
 <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
 <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it,
 arnd@arndb.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> When tesing timer_settime01 on 3.10.0-1136.el7.x86_64, this case fails
> >> whether we use any type clock.
> >>
> >> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
> >> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) reported
> >> bad values (0: 678013000): SUCCESS (0)
> >> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
> >> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) reported
> >> bad values (0: 358240000): SUCCESS (0)
> >> timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
> >> timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
> > 
> > Can you share the complete test log? I am not sure if only the _ALARM
> > cocks are failing or all. You are getting values in the order of
> > 300-700 ms, while the max value can't be greater than 50 ms. So seems
> > like a kernel issue to me. Over that, both _ALARM type clocks weren't
> > supported before 3.11 and looks like your kernel version is 3.10.
> Yes, only _ALARM fails. I  only find a kernel patch (commit 
> 11ffa9d6065f344  timerfd: Add alarm timers) introduced alarm clock types 
> for timefd in kernel 3.11 and  a kernel patch (commit 9a7adcf5c6dea63d 
> timers: Posix interface for alarm-timers)  in kernel 3.1. It seems my 
> kernel version has supported this two alarm clock, but not sure why this 
> case fails.

This is on RHEL kernel that has backported the _ALARM support right? So
this may as well be case of badly bacported patch...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
