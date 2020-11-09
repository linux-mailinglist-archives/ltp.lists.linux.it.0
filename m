Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D83922AC100
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 17:35:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FF743C5383
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 17:35:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 25A4E3C2DB1
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 17:35:16 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id F003E1000AFC
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 17:35:15 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42EE3ACF1;
 Mon,  9 Nov 2020 16:35:15 +0000 (UTC)
Date: Mon, 9 Nov 2020 17:35:59 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201109163559.GA29310@yuki.lan>
References: <20201105155020.16898-1-radoslav.kolev@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105155020.16898-1-radoslav.kolev@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert dup03 to new API and clean up
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
> +static void setup(void)
>  {
>  	long maxfds;
>  
>  	maxfds = sysconf(_SC_OPEN_MAX);
> -	/*
> -	 * Read the errors section if you're so inclined to determine
> -	 * why == -1 matters for errno.
> -	 */
> -	if (maxfds < 1)
> -		tst_brkm((maxfds == -1 ? TBROK | TERRNO : TBROK), NULL,
> -			 "sysconf(_SC_OPEN_MAX) failed");
> +	if (maxfds == -1)
> +		tst_brk(TBROK, "sysconf(_SC_OPEN_MAX) failed");
>  
>  	fd = malloc(maxfds * sizeof(int));
>  	if (fd == NULL)
> -		tst_brkm(TBROK | TERRNO, NULL, "malloc failed");
> -	fd[0] = -1;
> +		tst_brk(TBROK | TERRNO, "malloc failed");

We do have a SAFE_MALLOC() as well.

> -	tst_sig(FORK, DEF_HANDLER, cleanup);
> +	fd[0] = SAFE_OPEN("dupfile", O_RDWR | O_CREAT, 0700);
>  
> -	TEST_PAUSE;
> -
> -	tst_tmpdir();
> -
> -	sprintf(filename, "dupfile");
> -	for (nfds = 1; nfds <= maxfds; nfds++)
> -		if ((fd[nfds - 1] =
> -		     open(filename, O_RDWR | O_CREAT, 0700)) == -1) {
> -			if (errno == EMFILE)
> -				break;
> -			else
> -				tst_brkm(TBROK | TBROK, cleanup, "open failed");
> -			nfds--;
> -		}
> -
> -	if (nfds == 0)
> -		tst_brkm(TBROK, cleanup, "unable to open at least one file");
> -	if (nfds > maxfds)
> -		tst_brkm(TBROK, cleanup,
> -			 "unable to open enough files to use all file descriptors, "
> -			 "tried %ld", maxfds);
> +	for (nfds = 1; fd[nfds-1] < maxfds-1; nfds++)
> +		fd[nfds] = SAFE_DUP(fd[0]);

I wonder if we should care about overrunning the array here, since in a
case of a kernel bug where dup() would return some constant we would
crash the test. What about:

	for (nfds = 1; nfds < maxfds; nfds++) {
		fd[nfds] = SAFE_DUP(fd[0]);

		if (fd[nfds] >= maxfds - 1)
			break;
	}


Other than these the changes looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
