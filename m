Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F8916AA6C
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 16:46:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D94A83C23C2
	for <lists+linux-ltp@lfdr.de>; Mon, 24 Feb 2020 16:46:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8133F3C137A
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 16:46:45 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A712B6010EC
 for <ltp@lists.linux.it>; Mon, 24 Feb 2020 16:46:44 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EEA51AD14;
 Mon, 24 Feb 2020 15:46:43 +0000 (UTC)
Date: Mon, 24 Feb 2020 16:46:42 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200224154642.GA28943@dell5510>
References: <cover.1582104018.git.viresh.kumar@linaro.org>
 <aab7ae7e324c40e8e995ff381384a402d2aba8f5.1582104018.git.viresh.kumar@linaro.org>
 <20200220170425.GB15699@gacrux.arch.suse.de>
 <20200224031847.4nbao5too3vuyfqx@vireshk-i7>
 <20200224130856.GB30073@rei.lan> <20200224153011.GA24401@dell5510>
 <20200224153246.GC2210@rei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224153246.GC2210@rei>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 04/10] syscalls/fsopen: New tests
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Vikas.Kumar2@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > Hmm, we should fix library to be able to format the device properly,
> > > looks like some kind of bug though:

> > > https://github.com/dosfstools/dosfstools/issues/40

> > I'm not able to reproduce the problems on fsopen01 and fsmount02.
> > Using different tmp directory via TMPDIR fixed that, but it started to work even
> > without it and even reboot didn't bring back the failure. On different host
> > (different distro) it worked all the time. I wonder what was wrong.

> Hmm, that sounds really strange, I doubt that there is something that
> would create partitions on a loop device on a background, so it really
> smells like a bug.
I haven't found any hint in dmesg. I tested in on a machine, which sometimes has
problems with disc I/O (occasionally it's slow). So maybe it was hw related.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
