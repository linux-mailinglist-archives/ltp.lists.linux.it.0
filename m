Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93720CE79
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 14:14:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 380B13C574E
	for <lists+linux-ltp@lfdr.de>; Mon, 29 Jun 2020 14:14:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id A967D3C573A
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 14:14:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 158F214004E7
 for <ltp@lists.linux.it>; Mon, 29 Jun 2020 14:14:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54308AE35;
 Mon, 29 Jun 2020 12:14:29 +0000 (UTC)
Date: Mon, 29 Jun 2020 14:13:51 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200629121351.GA11544@rei.lan>
References: <7c68854a1b6ef828ed8dd83cb611bd5b5d53c2f8.1593430825.git.viresh.kumar@linaro.org>
 <7d8f71c73ac4518375b81651f82ef040c02082a1.1593430825.git.viresh.kumar@linaro.org>
 <CAK8P3a0ZAjUnybGVD4Kh5t5PZth3wgt672SwNf9iVPmqBUg4LQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0ZAjUnybGVD4Kh5t5PZth3wgt672SwNf9iVPmqBUg4LQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/timer_settime01: Make sure the timer
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
 Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > This works well for all clocks except CLOCK_PROCESS_CPUTIME_ID and
> > CLOCK_THREAD_CPUTIME_ID for some reason. I tried to read the values for
> > those clocks by sleeping for 1 second and then reading values using
> > timer_gettime() in a loop, and the value incremented every 15-16 seconds
> > by a value of 1 (which was in ms if I am not wrong).
> >
> > No idea what the hell is going on here and so need experts advice :)
> 
> The problem is that these clocks only tick while the process is running. Instead
> of sleeping for one second, you need to be in a busy-loop to ensure they
> actually advance.

Indeed, we may as well do something as:

	while (!caught_signal);

instead of sleep() in the case of the CPUTIME clocks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
