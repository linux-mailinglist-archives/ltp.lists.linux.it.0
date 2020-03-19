Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2084318BAD7
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:20:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0BAA3C5464
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:20:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id CD8403C5455
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:20:02 +0100 (CET)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CAF211A01799
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:20:01 +0100 (CET)
Received: by mail-pg1-x542.google.com with SMTP id b22so1441188pgb.6
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8guCIoAYauc+21ViLW3EjMRr9gfVjtmY5KZ+dMIky2M=;
 b=SDYicX8yB8fYIyM/oBsekUknmjZYkCjVRAIbAwyw4g0jc5dlAVhl/zjYKF7by1u4a9
 cXYg+FcVHj0HhMF5FKYC5g8n9la9iHulM9TF0VbwIMqkzbH1a8T6MZfWVb7EFg+C6n/y
 35mF5D5AFeQ8HdBY6jL8bFG/z1jpwZXBYgJ/dF1KHr/NazNwgnXm+5wmhFuikJK4CHge
 Bs8sawAC5lbqIW51darms2OvF4leR+oxKKWYHTM6Ykj5B5cMo+R+OH4kDipt4Bu97R4C
 Km8Vh+ZcM7MGZvBA0ep80EU4F5gkNhrLcP0WQc9hq6XwFVI99SWidtqL2OHaTGCmN/n9
 wmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8guCIoAYauc+21ViLW3EjMRr9gfVjtmY5KZ+dMIky2M=;
 b=KDFNloSNHMRxFB1uDxqDcuF6zKouymTW9kPjcQus+3PfBRzd3VoPj2d9oEOSq7KqhI
 qScAMez0MIq9Se8YcaOYDu77PJOgaX2u6XJOHzq5+JeL6ywqrx2z7JsmhLjE1NWAUnLV
 eHVdquWswPQtfMs7YKEQqJxkLSphDwoJK76DoXmEi29JzahSfY96HyfJREbnbw/4IyWE
 PNxuOl6vPpnt3L3M8/T81gwegdFD2gFZWZFFvRq3EfeipK8TB+cCzdocUOm3Kx9p8AU2
 3Ph1zhr1BNFjByHFiSs5Q3ZHkNd53pDTiwiYk5iGHXqgIwm5kY2IxWV2nbnizbEk92Od
 9gmA==
X-Gm-Message-State: ANhLgQ0wIaDULPT0NjQyy9JVONuYuzRlp9I+iUMZPftnE8oq2yOfbyxX
 32rB/ZRyYYKdqkeWnBde2NxAdg==
X-Google-Smtp-Source: ADFU+vvb8KD825V9L32jozGeEAIqN6tslR3bnKL+cGL80y59PScUABSAldVcGwgwQ2HA9Kq64hGr3A==
X-Received: by 2002:a62:507:: with SMTP id 7mr4610828pff.222.1584631200216;
 Thu, 19 Mar 2020 08:20:00 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id e28sm2857230pgn.21.2020.03.19.08.19.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Mar 2020 08:19:59 -0700 (PDT)
Date: Thu, 19 Mar 2020 20:49:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319230111.GC29386@yuki.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 2/2] syscalls/clone3: New tests
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

On 20-03-20, 00:01, Cyril Hrubis wrote:
> > diff --git a/testcases/kernel/syscalls/clone3/clone301.c b/testcases/kernel/syscalls/clone3/clone301.c
> > new file mode 100644
> > index 000000000000..babf8464108c
> > --- /dev/null
> > +++ b/testcases/kernel/syscalls/clone3/clone301.c
> > @@ -0,0 +1,152 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (c) 2020 Viresh Kumar <viresh.kumar@linaro.org>
> > + *
> > + * Basic clone3() test.
> > + */
> > +#define _GNU_SOURCE
> > +
> > +#include <stdlib.h>
> > +
> > +#include "tst_test.h"
> > +#include "lapi/clone.h"
> > +#include "lapi/pidfd_send_signal.h"
> > +
> > +#define CHILD_SIGNAL	SIGUSR1
> > +
> > +static int pidfd, child_tid, parent_tid, count, exit_signal;
> > +static struct sigaction *psig_action, *csig_action;
> > +static struct clone_args *args;
> > +static siginfo_t *uinfo;
> > +
> > +static struct tcase {
> > +	uint64_t flags;
> > +	int exit_signal;
> > +} tcases[] = {
> > +	{0, SIGCHLD},
> > +	{0, SIGUSR2},
> > +	{CLONE_FS, SIGCHLD},
> > +	{CLONE_NEWPID, SIGCHLD},
> > +	{CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, SIGCHLD},
> > +};
> > +
> > +static void parent_rx_signal(int sig, siginfo_t *info, void *ucontext)
> > +{
> > +	if (sig == exit_signal)
> > +		tst_res(TPASS, "clone3() passed: Parent received correct signal (index %d)", count);
> > +	else
> > +		tst_res(TFAIL, "clone3() failed: Parent received incorrect signal (index %d)", count);
> > +}
> > +
> > +static void child_rx_signal(int sig, siginfo_t *info, void *ucontext)
> > +{
> > +	if (info) {
> > +		int n = info->si_value.sival_int;
> > +
> > +		if (sig == CHILD_SIGNAL)
> > +			tst_res(TPASS, "clone3() passed: Child received correct signal (index %d)", n);
> > +		else
> > +			tst_res(TFAIL, "clone3() failed: Child received incorrect signal (index %d)", n);
> > +	} else {
> > +		tst_res(TFAIL, "clone3() failed: Invalid info");
> > +	}
> > +}
> 
> Calling tst_res() is not safe from a signal handler context.
> 
> So what we should do here is store the sig and info->si_value.sival_int
> to a global variables and check them the do_child function instead.
> 
> And the same applies for the parent handler as well.

Lemme start by excepting that I am bad with userspace programming and
I mostly do kernel stuff :(

With clone, parent and child process don't space address space and so
the variables aren't shared. I tried the CLONE_VM thing but with the
first write, the program gets killed. Not sure how to fix that.

> > +static void setup(void)
> > +{
> > +	clone3_supported_by_kernel();
> > +
> > +	psig_action = SAFE_MALLOC(sizeof(*psig_action));
> > +	memset(psig_action, 0, sizeof(*psig_action));
> > +	psig_action->sa_sigaction = parent_rx_signal;
> > +	psig_action->sa_flags = SA_SIGINFO;
> > +
> > +	csig_action = SAFE_MALLOC(sizeof(*csig_action));
> > +	memset(csig_action, 0, sizeof(*csig_action));
> > +	csig_action->sa_sigaction = child_rx_signal;
> > +	csig_action->sa_flags = SA_SIGINFO;
> 
> There is no need to allocate these, we can just define them as a static
> global variables with:
> 
> static struct sigaction psig_action = {
> 	.sa_sigaction = parent_rx_signal,
> 	.sa_flags = SA_SIGINFO,
> };

I thought about that but then followed what pidfd_send_signal() did.

> > +static struct clone_args *valid_args, *invalid_args;
> > +unsigned long stack;
> > +static int *invalid_address;
> > +
> > +static struct tcase {
> > +	const char *name;
> > +	struct clone_args **args;
> > +	size_t size;
> > +	uint64_t flags;
> > +	int **pidfd;
> > +	int **child_tid;
> > +	int **parent_tid;
> > +	int exit_signal;
> > +	unsigned long stack;
> > +	unsigned long stack_size;
> > +	unsigned long tls;
> > +	int exp_errno;
> > +} tcases[] = {
> > +	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > +	{"zero size", &valid_args, 0, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > +	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > +	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > +	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > +	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > +	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > +	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, &invalid_address, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > +	{"invalid childtid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, &invalid_address, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > +	{"invalid parenttid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
> > +	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
> > +	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
> > +	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
> > +};
> > +
> > +static void setup(void)
> > +{
> > +	clone3_supported_by_kernel();
> > +
> > +	invalid_address = tst_get_bad_addr(NULL);
> > +}
> > +
> > +static void run(unsigned int n)
> > +{
> > +	struct tcase *tc = &tcases[n];
> > +	struct clone_args *args = *tc->args;
> > +
> > +	if (args) {
> > +		args->flags = tc->flags;
> > +		if (tc->pidfd)
> > +			args->pidfd = (uint64_t)(*tc->pidfd);
> > +		if (tc->child_tid)
> > +			args->child_tid = (uint64_t)(*tc->child_tid);
> > +		if (tc->parent_tid)
> > +			args->parent_tid = (uint64_t)(*tc->parent_tid);
> > +		args->exit_signal = tc->exit_signal;
> > +		args->stack = tc->stack;
> > +		args->stack_size = tc->stack_size;
> > +		args->tls = tc->tls;
> > +	}
> 
> Isn't this wrong now that invalid_args != NULL?
> 
> Shouldn't this rather be if (args == valid_args) ?

invalid_args is still NULL, invalid_address isn't though.

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
