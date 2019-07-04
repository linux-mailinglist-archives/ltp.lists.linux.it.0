Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A335F453
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:08:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C6D7D3C1DAB
	for <lists+linux-ltp@lfdr.de>; Thu,  4 Jul 2019 10:08:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 433ED3C1D96
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:08:46 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 167061000D13
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 10:08:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA3213DE0F
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 08:08:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E135E176D2
 for <ltp@lists.linux.it>; Thu,  4 Jul 2019 08:08:42 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7B181833001;
 Thu,  4 Jul 2019 08:08:42 +0000 (UTC)
Date: Thu, 4 Jul 2019 04:08:39 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2030850327.31633394.1562227719657.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190703072417.24091-1-liwang@redhat.com>
References: <20190703072417.24091-1-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.27]
Thread-Topic: add tst_no_corefile to avoid corefile dumping
Thread-Index: 79U7jyLjvYoRgkgdUu31bAqv82uj7g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 04 Jul 2019 08:08:42 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: add tst_no_corefile to avoid corefile
 dumping
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


----- Original Message -----
> If crash is expected in a testcase, we can avoid dumping core file
> in calling this function.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>
> Cc: Jan Stancek <jstancek@redhat.com>
> ---
> 
> Notes:
>     v1 --> v2
>         * add a paramenter to hide the message print
>         * add notes in test-writing-guidelines.txt
> 
>  doc/test-writing-guidelines.txt                | 14 ++++++++++++--
>  include/tst_safe_macros.h                      | 18 ++++++++++++++++++
>  .../kernel/security/umip/umip_basic_test.c     |  2 ++
>  testcases/kernel/syscalls/ipc/shmat/shmat01.c  | 16 +++-------------
>  4 files changed, 35 insertions(+), 15 deletions(-)
> 
> diff --git a/doc/test-writing-guidelines.txt
> b/doc/test-writing-guidelines.txt
> index c6d4e001d..1a77db6bf 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -826,8 +826,8 @@ The 'TST_PROCESS_STATE_WAIT()' waits until process 'pid'
> is in requested
>  It's mostly used with state 'S' which means that process is sleeping in
>  kernel
>  for example in 'pause()' or any other blocking syscall.
>  
> -2.2.10 Signal handlers
> -^^^^^^^^^^^^^^^^^^^^^^
> +2.2.10 Signals and signal handlers
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
>  If you need to use signal handlers, keep the code short and simple. Don't
>  forget that the signal handler is called asynchronously and can interrupt
>  the
> @@ -859,6 +859,16 @@ type defined in C99 but this one *DOES NOT* imply
> 'volatile' (it's just a
>  'typedef' to 'int'). So the correct type for a flag that is changed from a
>  signal handler is either 'volatile int' or 'volatile sig_atomic_t'.
>  
> +If a crash (e.g. triggered by signal SIGSEGV) is expected in testing, you
> can
> +avoid dumping core file via calling this below tst_no_corefile() function.
> +Note that this chanage will only effect on that process with this invoke.
> And

I'd rephrase it to:

   If a crash (e.g. triggered by signal SIGSEGV) is expected in testing, you
   can avoid creation of core files by calling tst_no_corefile() function.
   This takes effect for process (and its children) which invoked it, unless
   they subsequently modify RLIMIT_CORE.

   Note that LTP library will reap any processes that test didn't reap itself,
   and report any non-zero exit code as failure.

One note below.

> +the parameter 'verbose' is used as message print option.
> +
> +[source,c]
> +-------------------------------------------------------------------------------
> +void tst_no_corefile(int verbose);
> +-------------------------------------------------------------------------------
> +
>  2.2.11 Kernel Modules
>  ^^^^^^^^^^^^^^^^^^^^^
>  
> diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
> index 53a888c80..c4ddf84ef 100644
> --- a/include/tst_safe_macros.h
> +++ b/include/tst_safe_macros.h
> @@ -394,6 +394,24 @@ static inline int safe_setrlimit(const char *file, const
> int lineno,
>  #define SAFE_SETRLIMIT(resource, rlim) \
>  	safe_setrlimit(__FILE__, __LINE__, (resource), (rlim))
>  
> +/*
> + * Crash is expected, avoid dumping corefile.
> + * 1 is a special value, that disables core-to-pipe.
> + * At the same time it is small enough value for
> + * core-to-file, so it skips creating cores as well.
> + */
> +static inline void tst_no_corefile(int verbose)
> +{
> +       struct rlimit r;
> +
> +       r.rlim_cur = 1;
> +       r.rlim_max = 1;
> +       SAFE_SETRLIMIT(RLIMIT_CORE, &r);

SAFE_SETRLIMIT is fine if needs_root = 1. But if test runs as unprivileged user
and RLIMIT_CORE is already 0, unprivileged user won't be able to increase it,
so we get TBROK here.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
