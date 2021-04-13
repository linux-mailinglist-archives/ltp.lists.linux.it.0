Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8A35DB83
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 11:45:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CE903C1DD0
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Apr 2021 11:45:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 85A583C1C6C
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 11:45:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D31461401235
 for <ltp@lists.linux.it>; Tue, 13 Apr 2021 11:45:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C834AE56;
 Tue, 13 Apr 2021 09:45:26 +0000 (UTC)
Date: Tue, 13 Apr 2021 11:37:06 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YHVmQvK6TnFod/tu@yuki>
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B47B3@dggeml531-mbx.china.huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B47B3@dggeml531-mbx.china.huawei.com>
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> According to your review, is there any problems in the patch as follows:
> 
> diff --git a/lib/tst_test.c b/lib/tst_test.c
> index 45753d1ca..0a096d666 100644
> --- a/lib/tst_test.c
> +++ b/lib/tst_test.c
> @@ -1156,7 +1156,16 @@ static void heartbeat(void)
>         if (tst_clock_gettime(CLOCK_MONOTONIC, &tst_start_time))
>                 tst_res(TWARN | TERRNO, "tst_clock_gettime() failed");
> 
> -       kill(getppid(), SIGUSR1);
> +       if (getppid() == 1) {
> +               tst_res(TFAIL, "Main test process might have exit!");
> +               /*
> +                * We need kill the task group immediately since the
> +                * main process has exit.
> +                */
> +               kill(0, SIGKILL);
> +               exit(-1);

Not that it matters that much, but I would do exit(TBROK);

> +       } else
> +               kill(getppid(), SIGUSR1);

No need for the else branch here now that we do exit() a the end of the
if () block.

Other than that it looks good.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
