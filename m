Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB3AF2EAD
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E285D3C220F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 Nov 2019 14:00:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 873373C1D5C
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:49:24 +0100 (CET)
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C6B196042A1
 for <ltp@lists.linux.it>; Thu,  7 Nov 2019 13:49:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T7F/zvXOPKa8aCq1Vyccb+zoCxdKW+wgomzNxicYjaE=; b=ZRxpJygO2nsfDcOvrFfTh0CmU
 LUy2RIDG5WTJeGDThu3ZxPwRbJh51yRbivvb+X7+of+KZgr/jJM+4w7hTYlLA/dd8YYJbdvL77WLU
 mAJ5rPnCPO6V8mhGurYFzdey8wmpfBpvVLX+9EFHHQpM1VaG714/gKkZiECKcUijLbBkGkxIwdItP
 bFRM7GLqa7KU19rTUaXz6TJ9SufNTvlC3O/sTFAKSc6v80cxcuAzZbcpjVYYAZGo5ZsQ6tJ2JWUP8
 nJZcnxKsyCXpIMBsReBG+HAtmFzGcq8ZZAzmGFKXdqeevLcWksaQyS5K/YP8JhLXs3AQ/WRMu+F6e
 UIz3K0sMQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iShE0-0005po-6Z; Thu, 07 Nov 2019 12:49:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 70269300489;
 Thu,  7 Nov 2019 13:48:14 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id F12422025EDA7; Thu,  7 Nov 2019 13:49:18 +0100 (CET)
Date: Thu, 7 Nov 2019 13:49:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20191107124918.GH4131@hirez.programming.kicks-ass.net>
References: <a87876829697e1b3c63601b1401a07af79eddae6.1572651216.git.jstancek@redhat.com>
 <alpine.DEB.2.21.1911051304420.17054@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911051304420.17054@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 07 Nov 2019 14:00:29 +0100
Subject: Re: [LTP] [PATCH] kernel: use ktime_get_real_ts64() to calculate
 acct.ac_btime
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
Cc: Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Ingo Molnar <mingo@kernel.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 07, 2019 at 09:56:12AM +0100, Thomas Gleixner wrote:
> But it would be way simpler just to store the CLOCK_REALTIME start time
> along with BOOT and MONOTONIC and just get rid of all these horrible
> calculations which are bound to be wrong.
> 
> Peter?

So I'd really hate to do that, as that gives the impression REALTIME is
a sane clock to use. As I argued in that other email, REALTIME is
horrible crap.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
