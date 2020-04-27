Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 073991BA6EA
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 16:52:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8605D3C5FB9
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 16:52:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A05813C2860
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 16:52:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A9D31000C18
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 16:52:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2272EAE0D;
 Mon, 27 Apr 2020 14:52:13 +0000 (UTC)
Date: Mon, 27 Apr 2020 16:52:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200427145212.GA5678@dell5510>
References: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41a72155effacaf3b58e6e50bfadddbd4dca188b.1587987802.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/timer_gettime: Add support for
 time64 tests
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
Cc: arnd@arndb.de, Vincent Guittot <vincent.guittot@linaro.org>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> This adds support for time64 tests to the existing timer_gettime()
> syscall tests.

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  include/tst_timer.h                           |  40 +++++++
>  .../syscalls/timer_gettime/timer_gettime01.c  | 112 +++++++++---------
>  2 files changed, 98 insertions(+), 54 deletions(-)

> diff --git a/include/tst_timer.h b/include/tst_timer.h
> index 256e1d71e1bc..601f934da670 100644
> --- a/include/tst_timer.h
> +++ b/include/tst_timer.h
> @@ -15,6 +15,7 @@
>  #include <sys/time.h>
>  #include <time.h>
>  #include "tst_test.h"
> +#include "lapi/common_timers.h"

Thanks for your patch. Unfortunately, the build got broken by this commit, I
suspect this must be changed
https://travis-ci.org/github/pevik/ltp/builds/680061434

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
