Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03339277FD3
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 07:15:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D9873C29B6
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 07:15:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id B5F123C1841
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 07:15:25 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A0F5820075C
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 07:15:24 +0200 (CEST)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EB4E208B6;
 Fri, 25 Sep 2020 05:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601010922;
 bh=gITMPtp3ExGoR3BhfhY50MjD89uQRzuT6Ejx0okOPWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PZZ2q2Nxa5IGI0xpxs/ZehF7omKALs2rdztMvg9fngAJlEuuoh8bRZvKl9DjjuvD6
 UJSAUI4tUaud99FbRAH+wVJycVWbtPxo9PiJlOWnLmzZx56EjM9X7qHcg+Dvn4Wk9q
 fQqGD0coIZQ9p/iYrMU1Fo2MnHPp9iAInEM3sItQ=
Date: Fri, 25 Sep 2020 07:15:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200925051518.GA605188@kroah.com>
References: <20180823023839.GA13343@shao2-debian>
 <20180828195347.GA228832@joelaf.mtv.corp.google.com>
 <CA+G9fYtV_sjTKLMXWMP0w0A-H+p+CN-uVJ6dvHovDy9epJZ2GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYtV_sjTKLMXWMP0w0A-H+p+CN-uVJ6dvHovDy9epJZ2GQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
 Steven Rostedt <rostedt@goodmis.org>, lkft-triage@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 LTP List <ltp@lists.linux.it>, Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Sep 25, 2020 at 10:13:05AM +0530, Naresh Kamboju wrote:
> >From stable rc 4.18.1 onwards to today's stable rc 4.19.147
> 
> There are two problems  while running LTP tracing tests
> 1) kernel panic  on i386, qemu_i386, x86_64 and qemu_x86_64 [1]
> 2) " segfault at 0 ip " and "Code: Bad RIP value" on x86_64 and qemu_x86_64 [2]
> Please refer to the full test logs from below links.
> 
> The first bad commit found by git bisect.
>    commit: c3bc8fd637a9623f5c507bd18f9677effbddf584
>    tracing: Centralize preemptirq tracepoints and unify their usage
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

So this also is reproducable in 5.4 and Linus's tree right now?

Or are newer kernels working fine?

thanks,

greg k-h

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
