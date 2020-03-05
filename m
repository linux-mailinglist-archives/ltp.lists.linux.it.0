Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E617A8BC
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 16:20:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50BF63C655C
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 16:20:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0DBFF3C6530
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 16:20:35 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5A41960CBA6
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 16:20:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 90561ADEF
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 15:20:34 +0000 (UTC)
Date: Thu, 5 Mar 2020 16:20:33 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200305152033.GA1160@rei.lan>
References: <20200305151459.30341-1-mdoucha@suse.cz>
 <20200305151459.30341-2-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305151459.30341-2-mdoucha@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
>  lib/tst_safe_timerfd.c | 35 ++++++-----------------------------
>  1 file changed, 6 insertions(+), 29 deletions(-)
> 
> diff --git a/lib/tst_safe_timerfd.c b/lib/tst_safe_timerfd.c
> index ffe7b2ef7..8c042f8c8 100644
> --- a/lib/tst_safe_timerfd.c
> +++ b/lib/tst_safe_timerfd.c
> @@ -9,34 +9,18 @@
>  #define TST_NO_DEFAULT_MAIN
>  #include "tst_test.h"
>  
> -#define TTYPE (errno == ENOTSUP ? TCONF : TBROK)
> -
>  int safe_timerfd_create(const char *file, const int lineno,
>  				      int clockid, int flags)
>  {
> -	int fd;
> -
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

Well at this point we basically pass everything that has been in the
function to the macro. So we do not save much on typing, the code is not
simpler and the obvious and readable code we had has been turned into a
macro. I do not think that this is improvement.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
