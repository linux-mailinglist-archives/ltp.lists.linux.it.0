Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC597197AFA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:40:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 81C383C314E
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 13:40:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 4574F3C3134
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:40:34 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1C786006D4
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 13:40:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6F892B12F;
 Mon, 30 Mar 2020 11:40:33 +0000 (UTC)
Date: Mon, 30 Mar 2020 13:40:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200330114041.GF9845@yuki.lan>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <20200327213924.18816-5-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327213924.18816-5-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/6] lib/tst_run_cmd_*(): Search for program in
 $PATH
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
> +	/* exit with TCONF if program is not in path */
> +	TST_RUN_CMD_CHECK_CMD = 2,

Shouldn't be this rather called TST_CMD_TCONF_ON_MISSING?

>  };
>  
>  /*
> diff --git a/lib/tst_run_cmd.c b/lib/tst_run_cmd.c
> index 3536ec494..0494c6083 100644
> --- a/lib/tst_run_cmd.c
> +++ b/lib/tst_run_cmd.c
> @@ -56,6 +56,17 @@ int tst_run_cmd_fds_(void (cleanup_fn)(void),
>  	 */
>  	void *old_handler = signal(SIGCHLD, SIG_DFL);
>  
> +	const char *cmd;
> +	char path[PATH_MAX];
> +
> +	if (tst_get_path(argv[0], path, sizeof(path))) {
> +		if (flags & TST_RUN_CMD_CHECK_CMD)
> +			tst_brkm(TCONF, "Couldn't find '%s' in $PATH at %s:%d", argv[0],
> +				 __FILE__, __LINE__);
> +		else
> +			_exit(255);
> +	}
> +
>  	pid_t pid = vfork();
>  	if (pid == -1) {
>  		tst_brkm(TBROK | TERRNO, cleanup_fn, "vfork failed at %s:%d",
> @@ -74,10 +85,7 @@ int tst_run_cmd_fds_(void (cleanup_fn)(void),
>  			dup2(stderr_fd, STDERR_FILENO);
>  		}
>  
> -		if (execvp(argv[0], (char *const *)argv)) {
> -			if (errno == ENOENT)
> -				_exit(255);
> -		}
> +		execvp(argv[0], (char *const *)argv);
>  		_exit(254);
>  	}
>  
> -- 
> 2.25.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
