Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 908C518BB19
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:28:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 574683C5466
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Mar 2020 16:28:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id CDF523C545A
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:28:43 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 458AE601BF0
 for <ltp@lists.linux.it>; Thu, 19 Mar 2020 16:28:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3453FAB7F;
 Thu, 19 Mar 2020 15:28:42 +0000 (UTC)
Date: Fri, 20 Mar 2020 00:24:26 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200319232426.GD29386@yuki.lan>
References: <cover.1584618969.git.viresh.kumar@linaro.org>
 <c64b9c05053d500a95cc920e332fa229085217b6.1584618969.git.viresh.kumar@linaro.org>
 <20200319230111.GC29386@yuki.lan>
 <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319151956.3rwix5oint6cmt4f@vireshk-i7>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DATE_IN_FUTURE_06_12,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

Hi!
> > > +static void child_rx_signal(int sig, siginfo_t *info, void *ucontext)
> > > +{
> > > +	if (info) {
> > > +		int n = info->si_value.sival_int;
> > > +
> > > +		if (sig == CHILD_SIGNAL)
> > > +			tst_res(TPASS, "clone3() passed: Child received correct signal (index %d)", n);
> > > +		else
> > > +			tst_res(TFAIL, "clone3() failed: Child received incorrect signal (index %d)", n);
> > > +	} else {
> > > +		tst_res(TFAIL, "clone3() failed: Invalid info");
> > > +	}
> > > +}
> > 
> > Calling tst_res() is not safe from a signal handler context.
> > 
> > So what we should do here is store the sig and info->si_value.sival_int
> > to a global variables and check them the do_child function instead.
> > 
> > And the same applies for the parent handler as well.
> 
> Lemme start by excepting that I am bad with userspace programming and
> I mostly do kernel stuff :(

You are doing a great job :-).

> With clone, parent and child process don't space address space and so
> the variables aren't shared. I tried the CLONE_VM thing but with the
> first write, the program gets killed. Not sure how to fix that.

Huh? All that we have to is to move the code from the child_rx_signal()
to the do_child() here, the child would setup a handler and call
pause(), then it checks if correct values have been stored to a global
varibles. And the same for the parent, the point is that we should do a
minimal amount of work in the handler itself.

The problem here is that tst_res() writes to std streams, that have
locks, so if we happen to get a signal while something writes there as
well, we deadlock. Also printf()-like functions may call malloc, which
has locks and may deadlock in the same way. It's unlikely that it will
ever happen in this test, but that does not excuse us...

> > > +static void setup(void)
> > > +{
> > > +	clone3_supported_by_kernel();
> > > +
> > > +	psig_action = SAFE_MALLOC(sizeof(*psig_action));
> > > +	memset(psig_action, 0, sizeof(*psig_action));
> > > +	psig_action->sa_sigaction = parent_rx_signal;
> > > +	psig_action->sa_flags = SA_SIGINFO;
> > > +
> > > +	csig_action = SAFE_MALLOC(sizeof(*csig_action));
> > > +	memset(csig_action, 0, sizeof(*csig_action));
> > > +	csig_action->sa_sigaction = child_rx_signal;
> > > +	csig_action->sa_flags = SA_SIGINFO;
> > 
> > There is no need to allocate these, we can just define them as a static
> > global variables with:
> > 
> > static struct sigaction psig_action = {
> > 	.sa_sigaction = parent_rx_signal,
> > 	.sa_flags = SA_SIGINFO,
> > };
> 
> I thought about that but then followed what pidfd_send_signal() did.
> 
> > > +static struct clone_args *valid_args, *invalid_args;
> > > +unsigned long stack;
> > > +static int *invalid_address;
> > > +
> > > +static struct tcase {
> > > +	const char *name;
> > > +	struct clone_args **args;
> > > +	size_t size;
> > > +	uint64_t flags;
> > > +	int **pidfd;
> > > +	int **child_tid;
> > > +	int **parent_tid;
> > > +	int exit_signal;
> > > +	unsigned long stack;
> > > +	unsigned long stack_size;
> > > +	unsigned long tls;
> > > +	int exp_errno;
> > > +} tcases[] = {
> > > +	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > > +	{"zero size", &valid_args, 0, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > > +	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > > +	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > > +	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > > +	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > > +	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> > > +	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, &invalid_address, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > > +	{"invalid childtid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, &invalid_address, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> > > +	{"invalid parenttid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
> > > +	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
> > > +	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
> > > +	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
> > > +};
> > > +
> > > +static void setup(void)
> > > +{
> > > +	clone3_supported_by_kernel();
> > > +
> > > +	invalid_address = tst_get_bad_addr(NULL);
> > > +}
> > > +
> > > +static void run(unsigned int n)
> > > +{
> > > +	struct tcase *tc = &tcases[n];
> > > +	struct clone_args *args = *tc->args;
> > > +
> > > +	if (args) {
> > > +		args->flags = tc->flags;
> > > +		if (tc->pidfd)
> > > +			args->pidfd = (uint64_t)(*tc->pidfd);
> > > +		if (tc->child_tid)
> > > +			args->child_tid = (uint64_t)(*tc->child_tid);
> > > +		if (tc->parent_tid)
> > > +			args->parent_tid = (uint64_t)(*tc->parent_tid);
> > > +		args->exit_signal = tc->exit_signal;
> > > +		args->stack = tc->stack;
> > > +		args->stack_size = tc->stack_size;
> > > +		args->tls = tc->tls;
> > > +	}
> > 
> > Isn't this wrong now that invalid_args != NULL?
> > 
> > Shouldn't this rather be if (args == valid_args) ?
> 
> invalid_args is still NULL, invalid_address isn't though.

Ah, my bad. I wonder if we should set the invalid_args to the result of
tst_get_bad_address() as well, just for a consistency.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
