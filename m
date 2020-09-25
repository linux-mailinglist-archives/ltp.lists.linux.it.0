Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97956278C11
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:07:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 622033C3045
	for <lists+linux-ltp@lfdr.de>; Fri, 25 Sep 2020 17:07:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id F33F53C13DC
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:07:12 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 50F941401462
 for <ltp@lists.linux.it>; Fri, 25 Sep 2020 17:07:12 +0200 (CEST)
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 188EE20878;
 Fri, 25 Sep 2020 15:07:07 +0000 (UTC)
Date: Fri, 25 Sep 2020 11:07:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <20200925110706.6654954b@oasis.local.home>
In-Reply-To: <20200925105914.7de88d27@oasis.local.home>
References: <20180823023839.GA13343@shao2-debian>
 <20180828195347.GA228832@joelaf.mtv.corp.google.com>
 <CA+G9fYtV_sjTKLMXWMP0w0A-H+p+CN-uVJ6dvHovDy9epJZ2GQ@mail.gmail.com>
 <20200925051518.GA605188@kroah.com>
 <CA+G9fYuokHUBwNkTs=gWqCHxj80gg+RetU4pRd+uLP7gNas4KQ@mail.gmail.com>
 <20200925105458.567d0bf4@oasis.local.home>
 <20200925105914.7de88d27@oasis.local.home>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, linux- stable <stable@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, lkft-triage@lists.linaro.org,
 Joel Fernandes <joel@joelfernandes.org>, Namhyung Kim <namhyung@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 25 Sep 2020 10:59:14 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 25 Sep 2020 10:54:58 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> 
> > The crash looks like its cr3 related, which I believe Peter Zijlstra  
> 
> s/cr3/cr2/
> 

Specifically, commits:

a0d14b8909de55139b8702fe0c7e80b69763dcfb ("x86/mm, tracing: Fix CR2 corruption")
6879298bd0673840cadd1fb36d7225485504ceb4 ("x86/entry/64: Prevent clobbering of saved CR2 value")
b8f70953c1251d8b16276995816a95639f598e70 ("x86/entry/32: Pass cr2 to do_async_page_fault()")

(which are in 5.4 but not 4.19)

But again, is this too intrusive. There was a workaround that was
original proposed, but Peter didn't want any more band-aids, and did
the restructuring, but as you can see from the two other patches, it
makes it a bit more high risk.

-- Steve

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
