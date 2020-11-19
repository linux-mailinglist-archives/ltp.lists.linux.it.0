Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE72B9635
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 16:30:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 589ED3C5F63
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 16:30:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 77D273C305F
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 16:30:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 0D7C26009C4
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 16:30:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DF36ABD6;
 Thu, 19 Nov 2020 15:30:27 +0000 (UTC)
Date: Thu, 19 Nov 2020 16:31:16 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20201119153116.GA18048@yuki.lan>
References: <20201112120505.GA15765@yuki.lan>
 <1605233273-3784-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201113151239.GB16315@yuki.lan> <5FB259B2.4040106@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FB259B2.4040106@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/ptrace11: Add test for tracing init
 process
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
> >> +	/*
> >> +	 * Running attach/detach more times will trigger a ESRCH error because
> >> +	 * ptrace_check_attach function in kernel will report it if its process
> >> +	 * stats is not __TASK_TRACED.
> >> +	 */
> >> +	TST_RETRY_FUNC(ptrace(PTRACE_DETACH, 1, NULL, NULL), TST_RETVAL_EQ0);
> >
> > Why do we have to retry the detach here?
> 
> I add a retry here because running attach/detach serval times may make 
> init process isn't traced status . Even we have do attach action, detach 
> will get ESRCH error .

Looking at the manual page it says:

PTRACE_ATTACH

...
The tracee is sent a SIGSTOP, but will not necessarily have stopped by
the completion of this call; use waitpid(2) to wait for the tracee to
stop.
...

So my guess is that if we call PTRACE_ATTACH followed by the
PTRACE_DETACH we may end up in a state where the SIGSTOP for the traced
process haven't arrived yet and in this case we should get ESCRCH.

So the correct solution is waitpid() for the traced process before we
detach it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
