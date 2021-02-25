Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 710C1325286
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 16:38:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 156563C5996
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 16:38:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id F36423C0E16
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 16:38:30 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 514B91401254
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 16:38:30 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86C78AF6F;
 Thu, 25 Feb 2021 15:38:29 +0000 (UTC)
Date: Thu, 25 Feb 2021 16:39:55 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Shiyang Ruan <ruansy.fnst@cn.fujitsu.com>
Message-ID: <YDfEy9K+p3cyGL2/@yuki.lan>
References: <20210225110118.583486-1-ruansy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210225110118.583486-1-ruansy.fnst@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/getpid01: Convert to new API
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
Pushed with small changes, thanks.

I've fixed some typos plus two changes explained below.

> +static void verify_getpid(void)
>  {
> -	int lc;
> -
> -	tst_parse_opts(ac, av, NULL, NULL);
> -
> -	setup();
> -
> -	for (lc = 0; TEST_LOOPING(lc); lc++) {
> -
> -		tst_count = 0;
> -
> -		TEST(getpid());
> -
> -		if (TEST_RETURN == -1)
> -			tst_resm(TFAIL | TTERRNO, "getpid failed");
> -		else
> -			tst_resm(TPASS, "getpid returned %ld", TEST_RETURN);
> -
> +	pid_t pid_max, pid;
> +	int status;
> +
> +	/* get pid_max of this system */
> +	SAFE_FILE_SCANF("/proc/sys/kernel/pid_max", "%d\n", &pid_max);
> +
> +	for (int i = 0; i < 100; i++) {

This int declaration inside of a for () statement will cause error with
older compiters, so I moved the variable declaration out of the
statement.

> +		pid = SAFE_FORK();
> +		if (pid == 0) {
> +			pid = getpid();
> +
> +			/* pid should not be 1 or out of maximum */
> +			if (1 < pid && pid <= pid_max)
> +				tst_res(TPASS, "getpid() returns %d", pid);
> +			else
> +				tst_res(TFAIL | TTERRNO,
> +					"getpid() returns out of range: %d", pid);
> +		} else {
> +			SAFE_WAIT(&status);
> +			break;

This is parent process, which should continue to run the for loop, so
I've removed the break; here and added exit(0) at the end fo thec child
instead.

> +		}
>  	}
> -
> -	cleanup();
> -	tst_exit();
>  }
>  
> -void setup(void)
> -{
> -
> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> -
> -	TEST_PAUSE;
> -}
> -
> -void cleanup(void)
> -{
> -}
> +static struct tst_test test = {
> +	.forks_child = 1,
> +	.test_all = verify_getpid,
> +};
> -- 
> 2.30.1
> 
> 
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
