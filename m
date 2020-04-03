Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F52C19D3AF
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:30:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 521143C2F84
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 11:30:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 859A63C2F41
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:30:07 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id EDA2F1A01792
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 11:30:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7CB3AAC2C;
 Fri,  3 Apr 2020 09:30:05 +0000 (UTC)
Date: Fri, 3 Apr 2020 11:30:19 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200403093019.GA26355@yuki.lan>
References: <CAKohpokaPiyGFkAXgG2oy_f5UGMCtsVUUAf4vA3Npa2ixAbNig@mail.gmail.com>
 <20200403071223.4d2vcfwiuxnuxij6@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403071223.4d2vcfwiuxnuxij6@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] Query: Supporting time64 syscalls
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I was looking to start working on the time64 syscalls
> > (like clock_gettime64, timerfd_settime64, etc) and
> > was looking for your suggestions on how to proceed on
> > the same.
> > 
> > AFAIU, the only difference is that the argument is 64 bit now
> > instead of 32 bit and so I don't think I should be adding new
> > tests but reusing the existing ones for both 32 bit and 64 bit
> > variants.
> 
> @Cyril/Petr,
> 
> Any suggestions on how should I go about these tests ?

I guess that we can take the existing timer tests and add tests variants
so that we cover all possible cases, I guess that would mean 32bit
kernel syscall, 64bit kernel syscall, glibc wrapper and in some cases
also VDSO.

You can have a look at clock_getres01.c and take it as an example.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
