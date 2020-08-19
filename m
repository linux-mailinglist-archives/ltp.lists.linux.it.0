Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5D2497E3
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 10:02:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8F7C3C2FC8
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Aug 2020 10:02:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E346B3C26C8
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 10:02:06 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3CD631A00F77
 for <ltp@lists.linux.it>; Wed, 19 Aug 2020 10:02:05 +0200 (CEST)
Received: from ip5f5af70b.dynamic.kabel-deutschland.de ([95.90.247.11]
 helo=wittgenstein) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <christian.brauner@ubuntu.com>)
 id 1k8J2q-0004P9-Kq; Wed, 19 Aug 2020 08:02:04 +0000
Date: Wed, 19 Aug 2020 10:02:04 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200819080204.a5iqoqvlwuizimje@wittgenstein>
References: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8eefb21d278f0846024a16281c5e19b0e3936979.1596797812.git.jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/clone302: drop CLONE_CHILD_SETTID and
 CLONE_PARENT_SETTID
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Aug 07, 2020 at 12:58:44PM +0200, Jan Stancek wrote:
> Per https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
> EFAULT isn't propagated back to userspace so these will always appear
> to succeed. Also issue is that multiple flags are tested together
> and some arguments persisted between calls, because they were set
> only when argument != NULL.
> 
> Cc: Christian Brauner <christian.brauner@ubuntu.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---

Thanks!
Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

>  testcases/kernel/syscalls/clone3/clone302.c | 42 +++++++++++----------
>  1 file changed, 23 insertions(+), 19 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/clone3/clone302.c b/testcases/kernel/syscalls/clone3/clone302.c
> index a30df6f8286e..54d59a1f571a 100644
> --- a/testcases/kernel/syscalls/clone3/clone302.c
> +++ b/testcases/kernel/syscalls/clone3/clone302.c
> @@ -21,27 +21,33 @@ static struct tcase {
>  	size_t size;
>  	uint64_t flags;
>  	int **pidfd;
> -	int **child_tid;
> -	int **parent_tid;
>  	int exit_signal;
>  	unsigned long stack;
>  	unsigned long stack_size;
>  	unsigned long tls;
>  	int exp_errno;
>  } tcases[] = {
> -	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> -	{"zero size", &valid_args, 0, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> -	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> -	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> -	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> -	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> -	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, NULL, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> -	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, &invalid_address, NULL, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> -	{"invalid childtid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, &invalid_address, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> -	{"invalid parenttid", &valid_args, sizeof(*valid_args), CLONE_PARENT_SETTID | CLONE_CHILD_SETTID | CLONE_PIDFD, NULL, NULL, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
> -	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
> -	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
> -	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, NULL, NULL, SIGCHLD, 0, 4, 0, EINVAL},
> +	{"invalid args", &invalid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> +	{"zero size", &valid_args, 0, 0, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> +	{"short size", &valid_args, sizeof(*valid_args) - 1, 0, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> +	{"extra size", &valid_args, sizeof(*valid_args) + 1, 0, NULL, SIGCHLD, 0, 0, 0, EFAULT},
> +	{"sighand-no-VM", &valid_args, sizeof(*valid_args), CLONE_SIGHAND, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> +	{"thread-no-sighand", &valid_args, sizeof(*valid_args), CLONE_THREAD, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> +	{"fs-newns", &valid_args, sizeof(*valid_args), CLONE_FS | CLONE_NEWNS, NULL, SIGCHLD, 0, 0, 0, EINVAL},
> +	{"invalid pidfd", &valid_args, sizeof(*valid_args), CLONE_PIDFD, &invalid_address, SIGCHLD, 0, 0, 0, EFAULT},
> +	{"invalid signal", &valid_args, sizeof(*valid_args), 0, NULL, CSIGNAL + 1, 0, 0, 0, EINVAL},
> +	{"zero-stack-size", &valid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, (unsigned long)&stack, 0, 0, EINVAL},
> +	{"invalid-stack", &valid_args, sizeof(*valid_args), 0, NULL, SIGCHLD, 0, 4, 0, EINVAL},
> +	/*
> +	 * Don't test CLONE_CHILD_SETTID and CLONE_PARENT_SETTID:
> +	 * When the parent tid is written to the memory location for
> +	 * CLONE_PARENT_SETTID we're past the point of no return of process
> +	 * creation, i.e. the return value from put_user() isn't checked and
> +	 * can't be checked anymore so you'd never receive EFAULT for a bogus
> +	 * parent_tid memory address.
> +	 *
> +	 * https://lore.kernel.org/linux-m68k/20200627122332.ki2otaiw3v7wndbl@wittgenstein/T/#u
> +	 */
>  };
>  
>  static void setup(void)
> @@ -63,10 +69,8 @@ static void run(unsigned int n)
>  		args->flags = tc->flags;
>  		if (tc->pidfd)
>  			args->pidfd = (uint64_t)(*tc->pidfd);
> -		if (tc->child_tid)
> -			args->child_tid = (uint64_t)(*tc->child_tid);
> -		if (tc->parent_tid)
> -			args->parent_tid = (uint64_t)(*tc->parent_tid);
> +		else
> +			args->pidfd = 0;
>  		args->exit_signal = tc->exit_signal;
>  		args->stack = tc->stack;
>  		args->stack_size = tc->stack_size;
> -- 
> 2.18.1
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
