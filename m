Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3957D3ACB4D
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:46:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A112A3C2FCE
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 14:46:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BDCA13C231C
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:46:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 341C81A016C4
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 14:46:00 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4A81821ACA;
 Fri, 18 Jun 2021 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624020360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpvmjp4T6ce4S18mWZOzJQG0D0584eavAt3B1nhDR7c=;
 b=dc4cMxTs1rH92uRcVXnoJCjXsAqn/8mdnIQZldtB1QIRU8OJlydQk7sXXWpg9artB0wH1E
 gWWhGuSTx8lpRh6rnoa4l10a2g0+lGaiywyCZBR8dpzq8uYfN4UuluDUfQwe53D0lk1VvH
 imw3/cPvKwc3+okJhCVWsceeqD2M8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624020360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpvmjp4T6ce4S18mWZOzJQG0D0584eavAt3B1nhDR7c=;
 b=5LeoeWv0WvY0Vi28fwSH8+40REXiSAiXv5N9An/FoYVw5epWe0mD6laqz0GcGCO+llCyaG
 dlDAvmtYjwhpLfBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 27BCE118DD;
 Fri, 18 Jun 2021 12:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624020360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpvmjp4T6ce4S18mWZOzJQG0D0584eavAt3B1nhDR7c=;
 b=dc4cMxTs1rH92uRcVXnoJCjXsAqn/8mdnIQZldtB1QIRU8OJlydQk7sXXWpg9artB0wH1E
 gWWhGuSTx8lpRh6rnoa4l10a2g0+lGaiywyCZBR8dpzq8uYfN4UuluDUfQwe53D0lk1VvH
 imw3/cPvKwc3+okJhCVWsceeqD2M8YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624020360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qpvmjp4T6ce4S18mWZOzJQG0D0584eavAt3B1nhDR7c=;
 b=5LeoeWv0WvY0Vi28fwSH8+40REXiSAiXv5N9An/FoYVw5epWe0mD6laqz0GcGCO+llCyaG
 dlDAvmtYjwhpLfBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ciSRB4iVzGB+HwAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Fri, 18 Jun 2021 12:46:00 +0000
Date: Fri, 18 Jun 2021 14:20:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMyPhiiKwuwEdj7N@yuki>
References: <20210617105556.130869-1-xieziyao@huawei.com>
 <20210617105556.130869-4-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210617105556.130869-4-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3 v2] getrusage: Cleanup and bugfix for
 getrusage03
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
>  static void sig_ign(void)
>  {
> -	tst_resm(TINFO, "Testcase #06: SIG_IGN");
> -
> -	SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &ru);
> -	tst_resm(TINFO, "initial.children = %ld", ru.ru_maxrss);
> -	signal(SIGCHLD, SIG_IGN);
> +	SAFE_SIGNAL(SIGCHLD, SIG_IGN);
> +	SAFE_GETRUSAGE(RUSAGE_CHILDREN, &ru);
>  	maxrss_init = ru.ru_maxrss;
> 
> -	switch (pid = fork()) {
> -	case -1:
> -		tst_brkm(TBROK, cleanup, "fork #6");
> -	case 0:
> -		retval = system("getrusage03_child -n 500");
> -		if ((WIFEXITED(retval) && WEXITSTATUS(retval) != 0))
> -			tst_brkm(TBROK | TERRNO, cleanup, "system");
> -		exit(0);
> -	default:
> -		break;
> -	}
> +	pid_t pid = SAFE_FORK();
> +
> +	if (!pid)
> +		SAFE_EXECLP("getrusage03_child", "getrusage03_child",
> +			    "consume", "500", NULL);
> 
> -	sleep(1);		/* children become zombie */
> -	SAFE_GETRUSAGE(cleanup, RUSAGE_CHILDREN, &ru);
> -	tst_resm(TINFO, "after_zombie.children = %ld", ru.ru_maxrss);
> +	TST_PROCESS_EXIT_WAIT(pid, 0);
> +	SAFE_GETRUSAGE(RUSAGE_CHILDREN, &ru);
>  	if (is_in_delta(ru.ru_maxrss - maxrss_init))
> -		tst_resm(TPASS, "initial.children ~= after_zombie.children");
> +		tst_res(TPASS, "initial.children ~= after_zombie.children");
>  	else
> -		tst_resm(TFAIL, "initial.children !~= after_zombie.children");
> -	signal(SIGCHLD, SIG_DFL);
> -}
> +		tst_res(TFAIL, "after_zombie.children = %li, expected %li",
> +			ru.ru_maxrss, maxrss_init);

I guess that these messages could be better, techincally it's not a
zombie but rather ignored child, so I would change this to:

"initial.children ~= ignored_child.children"

Other than this the rest is good.

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>


Also if you agree I can fix the two minor issues in the patchset before
merge, no need to send v3.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
