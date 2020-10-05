Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A28E283669
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:17:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10DA33C59B5
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 15:17:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BCF1D3C2612
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:17:51 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id ECE911400217
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 15:17:50 +0200 (CEST)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 920E5207BC;
 Mon,  5 Oct 2020 13:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601903868;
 bh=m6Z0F9wJ8S88qgX6o5QCjYwMEFixPhZYcGnmSMq53Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XLEbhalAQFCWlx9/yAqmZEjWhqSX/GjwtJybHONd7qC4BIsDX0fysRT1kz3KqlCvv
 akG2y5DdMvEDB8zHDVmD6x4qvOIXrEFHkf3DiuuBwAw+6b0LvrrGordC+4GakKrVaS
 HPkxpzdt86ng/8MIGHG22YGAqlbHx3WYSDxh3yEE=
Date: Mon, 5 Oct 2020 15:18:33 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <20201005131833.GA1506031@kroah.com>
References: <20180823023839.GA13343@shao2-debian>
 <20180828195347.GA228832@joelaf.mtv.corp.google.com>
 <CA+G9fYtV_sjTKLMXWMP0w0A-H+p+CN-uVJ6dvHovDy9epJZ2GQ@mail.gmail.com>
 <20200925051518.GA605188@kroah.com>
 <CA+G9fYuokHUBwNkTs=gWqCHxj80gg+RetU4pRd+uLP7gNas4KQ@mail.gmail.com>
 <20200925105458.567d0bf4@oasis.local.home>
 <20200925105914.7de88d27@oasis.local.home>
 <20200925110706.6654954b@oasis.local.home>
 <20200925151245.GA3180934@kroah.com>
 <20200925113049.4c10c864@oasis.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925113049.4c10c864@oasis.local.home>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [stable 4.19] [PANIC]: tracing: Centralize preemptirq
 tracepoints and unify their usage
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, linux- stable <stable@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, lkft-triage@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Sep 25, 2020 at 11:30:49AM -0400, Steven Rostedt wrote:
> On Fri, 25 Sep 2020 17:12:45 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > > Specifically, commits:
> > > 
> > > a0d14b8909de55139b8702fe0c7e80b69763dcfb ("x86/mm, tracing: Fix CR2 corruption")
> > > 6879298bd0673840cadd1fb36d7225485504ceb4 ("x86/entry/64: Prevent clobbering of saved CR2 value")
> > > b8f70953c1251d8b16276995816a95639f598e70 ("x86/entry/32: Pass cr2 to do_async_page_fault()")
> > > 
> > > (which are in 5.4 but not 4.19)
> > > 
> > > But again, is this too intrusive. There was a workaround that was
> > > original proposed, but Peter didn't want any more band-aids, and did
> > > the restructuring, but as you can see from the two other patches, it
> > > makes it a bit more high risk.  
> > 
> > If those are known to work, why can't I take them as-is?
> 
> If they apply without tweaks, I say "Go for it" ;-)
> 
> My worry is that they may have other unknown dependencies. And I only
> looked at what was applied between 4.19 and 5.4 mainline. I haven't
> looked at what else may have been backported to fix the above three
> commits.

I tried to backport the above series, and quickly gave up, as yes, you
are right, the dependencies are deep and messy from what I can tell.

WHat's wrong with just moving to 5.4? :)

thanks,

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
