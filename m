Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5345147BBC
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:47:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D9913C2392
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:47:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1AC4C3C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:47:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 137EF60BCE7
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:47:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1847CB042;
 Fri, 24 Jan 2020 09:47:23 +0000 (UTC)
Date: Fri, 24 Jan 2020 10:47:21 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200124094720.GA28992@rei.lan>
References: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
 <20200124074805.b2gk4jcu3jrvrczd@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124074805.b2gk4jcu3jrvrczd@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Add Syscall numbers for io_pgetevents
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >  include/lapi/syscalls/aarch64.in   | 1 +
> >  include/lapi/syscalls/arm.in       | 1 +
> >  include/lapi/syscalls/hppa.in      | 1 +
> >  include/lapi/syscalls/i386.in      | 1 +
> >  include/lapi/syscalls/ia64.in      | 1 +
> >  include/lapi/syscalls/powerpc.in   | 1 +
> >  include/lapi/syscalls/powerpc64.in | 1 +
> >  include/lapi/syscalls/s390.in      | 1 +
> >  include/lapi/syscalls/s390x.in     | 1 +
> >  include/lapi/syscalls/sparc.in     | 1 +
> >  include/lapi/syscalls/sparc64.in   | 1 +
> >  include/lapi/syscalls/x86_64.in    | 1 +
> >  12 files changed, 12 insertions(+)
> 
> Is it fine to send patches like this separately from the patches which
> actually add the tests? Will you merge them alone as well?
> 
> Asking as I would be required to resend these patches (which just add
> syscall number) along with the real tests, while they may never get
> modified. I can then send such patches for future syscalls I am
> working on.

We may as well add all the missing syscalls in a single patch and I will
commit that right away if you are okay with that.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
