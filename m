Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C25EC35C996
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 17:17:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 846FD3C90AD
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 17:17:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 11A563C1C55
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 17:17:55 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 67E6E1400FAD
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 17:17:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A27ECB1CA;
 Mon, 12 Apr 2021 15:17:54 +0000 (UTC)
Date: Mon, 12 Apr 2021 17:10:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YHRi0457Zo5s7sUx@yuki>
References: <20210323135604.24504-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323135604.24504-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_test.c: Bugfix for heartbeat
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
> When main process has been killed, its son process will be reaped by
> init, and son process will send SIGUSR1 to the init process.
> 
> In busybox, send SIGUSR1 to the init process will trigger shutdown.
> 
> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  lib/tst_test.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 45753d1ca..91dfc6bf9 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1156,7 +1156,15 @@ static void heartbeat(void)
>  	if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
>  		tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
> 
> -	kill(getppid(), SIGUSR1);
> +	if (getppid() == 1) {
> +		tst_res(TFAIL, "Main test process might have exit!");
                         ^
			 This should be TBROK I guess.
> +		/*
> +		 * We need kill the task group immediately since the
> +		 * main process has exit.
> +		 */
> +		kill(0, SIGKILL);

Shouldn't we call exit here? There is no point in continuing once we
reached this point.

> +	} else
> +		kill(getppid(), SIGUSR1);
>  }
> 
>  static void testrun(void)
> --
> 2.17.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
