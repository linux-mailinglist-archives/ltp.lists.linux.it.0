Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B297318D76
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 15:35:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D97D23C6CFB
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 15:35:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AEA7D3C5DE7
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 15:35:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 527631A0067E
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 15:35:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A6E07ACBF
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 14:35:27 +0000 (UTC)
Date: Thu, 11 Feb 2021 15:35:46 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YCVAwoQDKJWMi6hX@rei.lan>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
 <20210211110317.31942-5-rpalethorpe@suse.com>
 <YCUoWPHssRVkQ+vf@yuki.lan> <877dne65s5.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877dne65s5.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] API: Add tst_clone
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> +	int flags;
> >> +	pid_t pid = -1;
> >> +
> >> +	tst_flush();
> >> +
> >> +	errno = ENOSYS;
> >> +	if (__NR_clone3 != __LTP__NR_INVALID_SYSCALL)
> >> +		pid = syscall(__NR_clone3, &args, sizeof(args));
> >> +
> >> +	if (pid == -1 && errno != ENOSYS)
> >> +		return -1;
> >
> > As far as I can tell when kernel is too old we would get EINVAL because
> > the syscall number is not allocated. ENOSYS happens mostly when syscall
> > number is allocated and kernel does not implement the functionality,
> > e.g. it's disabled in .config.
> >
> > I wonder if it's even menaningful to handle ENOSYS here, I doubt that
> > clone3() can be disabled, or do I miss something?
> 
> AFAICT it should return ENOSYS if the syscall number is greater than the
> current maximum. This is certainly true for riscv and also apears to be
> true for arm64 and x86. It is also written in a kernel book I have from
> 2010 :-p

Sounds sane, so we get EINVAL if the syscall number is out of the
syscall table. So I guess that we have to handle both.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
