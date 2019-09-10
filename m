Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC566AE9BA
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 13:57:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 726643C2096
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Sep 2019 13:57:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BC3E83C2076
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 13:57:49 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 878421000CC6
 for <ltp@lists.linux.it>; Tue, 10 Sep 2019 13:57:41 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 894A2ABCE;
 Tue, 10 Sep 2019 11:57:47 +0000 (UTC)
Date: Tue, 10 Sep 2019 13:57:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: frequent <frequentemail@126.com>
Message-ID: <20190910115743.GA18210@rei.lan>
References: <424f5bc4.776d.16d1ab07134.Coremail.frequentemail@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424f5bc4.776d.16d1ab07134.Coremail.frequentemail@126.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] buffer overflow detected ***: dup201 terminated
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
> Issues related to this mail: https://github.com/linux-test-project/ltp/issues/570

You can just add "fixes: #570" instead somewhere in the patch text which
will close the issue automatically if the patch is included in the
repository.

> According to the bactrace in the issue description, we could easily find out that the problem is due to the codes in dup201.c  line 80 and 142. 
> As metan-cuw commented, the loop at line 142 is of no use and probablely is a leftover.  So we could safely remove these codes. 
> 
> This patch does :
>         1).  remove the leftover, and of course, the issue 570 will be eventually go over.
>         2).  removed unused global variables.
> 
> The patch goes as:
  ^
This is unnecessary.

And you are missing the signed-off-by line here, see:

https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#developer-s-certificate-of-origin-1-1

> diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
> index 4507ac1..762ad86 100644
> --- a/testcases/kernel/syscalls/dup2/dup201.c
> +++ b/testcases/kernel/syscalls/dup2/dup201.c
> @@ -75,9 +75,6 @@ int maxfd;
>  int goodfd = 5;
>  int badfd = -1;
>  int mystdout = 0;
> -int fd, fd1;
> -int mypid;
> -char fname[20];
> 
> 
>  struct test_case_t {
>         int *ofd;
> @@ -86,22 +83,19 @@ struct test_case_t {
>         void (*setupfunc) ();
>  } TC[] = {
>         /* First fd argument is less than 0 - EBADF */
> -       {
> -       &badfd, &goodfd, EBADF, NULL},
> -           /* First fd argument is getdtablesize() - EBADF */
> -       {
> -       &maxfd, &goodfd, EBADF, NULL},
> -           /* Second fd argument is less than 0 - EBADF */
> -       {
> -       &mystdout, &badfd, EBADF, NULL},
> -           /* Second fd argument is getdtablesize() - EBADF */
> -       {
> -&mystdout, &maxfd, EBADF, NULL},};
> +       {&badfd, &goodfd, EBADF, NULL},
> +       /* First fd argument is getdtablesize() - EBADF */
> +       {&maxfd, &goodfd, EBADF, NULL},
> +       /* Second fd argument is less than 0 - EBADF */
> +       {&mystdout, &badfd, EBADF, NULL},
> +       /* Second fd argument is getdtablesize() - EBADF */
> +       {&mystdout, &maxfd, EBADF, NULL},
> +};
> 
> 
>  int main(int ac, char **av)
>  {
>         int lc;
> -       int i, j;
> +       int i;
> 
> 
>         tst_parse_opts(ac, av, NULL, NULL);
> 
> 
> @@ -137,12 +131,6 @@ int main(int ac, char **av)
>                                          strerror(TC[i].error));
>                         }
>                 }
> -               /* cleanup things in case we are looping */
> -               for (j = fd1; j < maxfd; j++) {
> -                       sprintf(fname, "dup201.%d.%d", j, mypid);
> -                       (void)close(j);
> -                       (void)unlink(fname);
> -               }
>         }
>         cleanup();
> 
> 
> @@ -163,7 +151,6 @@ void setup(void)
> 
> 
>         /* get some test specific values */
>         maxfd = getdtablesize();
> -       mypid = getpid();
>  }
> 
> 
>  /*
> @@ -172,6 +159,5 @@ void setup(void)
>   */
>  void cleanup(void)
>  {
> -
>         tst_rmdir();
>  }

Otherwise the patch looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
