Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5701D3267
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 16:14:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE9B63C2238
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 16:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 58E523C0794
 for <ltp@lists.linux.it>; Thu, 14 May 2020 16:14:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D3B4A201288
 for <ltp@lists.linux.it>; Thu, 14 May 2020 16:14:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C133FAC6E;
 Thu, 14 May 2020 14:14:58 +0000 (UTC)
Date: Thu, 14 May 2020 16:14:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200514141454.GB17718@dell5510>
References: <20200513012626.1571-1-yangx.jy@cn.fujitsu.com>
 <5EBB5B3D.4020302@cn.fujitsu.com> <20200513092028.GA4598@dell5510>
 <5EBBCA12.5020901@cn.fujitsu.com> <20200513103032.GA18763@dell5510>
 <20200514073701.GA9562@dell5510> <5EBD12D9.70708@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EBD12D9.70708@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Yang,

> > To be honest I like this approach, because 1) it defines when new syscall was
> > backported

> Hmm, the reason seems a little weak, it can be done by adding a comment(e.g.
> "the syscall is introduced since v5.6.0").
Sure, that would work as well.

> 2) if there is really problem that some functionality was removed, we
> > can always handle it. But IMHO that's going to be rare (btrfs removed in RHEL 8
> > is IMHO because RHEL does not want to support it, but that would not happen for
> > syscalls).

> Without the rare situation, I also think tst_syscall() is enough to check
> the support of syscall.
Well, nothing that much important, but I'd like to hear the opinion of
other maintainers. BTW We now concentrate on pre-release fixes.

> > I'd also like to be consistent how we handle these new syscalls.
> Agreed.

> I also think if we can implement common func(e.g.
> syscall_supported_by_kernel()).
Sure, feel free to send a patch (could be a macro).


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
