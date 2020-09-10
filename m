Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8733F2648A6
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 17:24:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 087B33C527B
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 17:24:23 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id E46D13C093E
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 17:24:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 09B41600C52
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 17:24:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06CFEACC8;
 Thu, 10 Sep 2020 15:24:33 +0000 (UTC)
Date: Thu, 10 Sep 2020 17:24:47 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200910152447.GA10844@yuki.lan>
References: <20200904140931.10153-1-chrubis@suse.cz>
 <5d127ee5-56d1-01c5-c364-dcb004204e9d@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d127ee5-56d1-01c5-c364-dcb004204e9d@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscall/ptrace08: Simplify the test.
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 lkp@lists.01.org, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> looks good and the test passes on older fixed kernels. Just one
> compatibility issue below.

I've fixed that and also the kernel version when the behavior had
changed and pushed, thanks for the review and testing.

...

> > +	if (TST_RET != -1) {
> > +		tst_res(TFAIL, "ptrace() breakpoint with kernel addr succeeded");
> > +	} else {
> > +		if (TST_ERR == EINVAL) {
> > +			tst_res(TPASS | TTERRNO,
> > +				"ptrace() breakpoint with kernel addr failed");
> > +		} else {
> > +			tst_res(TFAIL | TTERRNO,
> > +				"ptrace() breakpoint on kernel addr should return EINVAL, got");
> > +		}
> > +	}
> > +
> > +	unsigned long addr;
> 
> AFAICT, we're not compiling with --std=c99 so older compilers may
> complain about the variable declaration here.

The default std for gcc has been at least gnu90 for ages, which includes
subset of c99 features as well including this one. So unless you
explicitly pass --std=c90 or older it will work just fine.

I've moved the declaration to the top of the function nevertheless.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
