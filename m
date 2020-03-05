Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C01417AD89
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:50:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1271E3C6557
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:50:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 6F0C03C64F2
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:50:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ED33D601C35
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:50:34 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB9E2B3CF
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:50:33 +0000 (UTC)
Date: Thu, 5 Mar 2020 18:50:31 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200305175031.GB29517@dell5510>
References: <20200305151459.30341-1-mdoucha@suse.cz>
 <20200305151459.30341-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305151459.30341-2-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] Reimplement TST_SAFE_TIMERFD_*() using
 TST_ASSERT_SYSCALL*()
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> -	fd = timerfd_create(clockid, flags);
> -	if (fd < 0) {
> -		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_create(%s) failed",
> -			file, lineno, tst_clock_name(clockid));
> -	}
> -
> -	return fd;
> +	return TST_ASSERT_SYSCALL_FD_IMPL(timerfd_create(clockid, flags), file,
> +		lineno, "timerfd_create(%s)", tst_clock_name(clockid));
>  }

>  int safe_timerfd_gettime(const char *file, const int lineno,
>  				int fd, struct itimerspec *curr_value)
>  {
> -	int rval;
> -
> -	rval = timerfd_gettime(fd, curr_value);
> -	if (rval != 0) {
> -		tst_brk(TTYPE | TERRNO, "%s:%d timerfd_gettime() failed",
> -			file, lineno);
> -	}
> -
> -	return rval;
> +	return TST_ASSERT_SYSCALL_IMPL(timerfd_gettime(fd, curr_value), file,
> +		lineno, "timerfd_gettime()");
>  }

I like sprintf formatting (it's needed), but it'd be nice to have a way to avoid
it, when it's just foo() (using SCALL_FUN and SCALL_PARAMS).
But that's probably too much optimization, resulting in unreadable macros.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
