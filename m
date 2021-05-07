Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56E37697F
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 19:26:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8B4123C8D35
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 19:26:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 73ACB3C564E
 for <ltp@lists.linux.it>; Fri,  7 May 2021 19:26:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 22C2360102B
 for <ltp@lists.linux.it>; Fri,  7 May 2021 19:26:12 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31C2AB022;
 Fri,  7 May 2021 17:26:12 +0000 (UTC)
Date: Fri, 7 May 2021 19:26:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YJV4MtK/5NvpIXbU@pevik>
References: <20210506050047.935-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506050047.935-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4 v2] syscalls/fcntl: Replace TINFO with TPASS
 or TFAIL
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

Hi Zhao,

> 1)remove redundant variable
> 2)remove redundant log
> 3)replace TINFO with TPASS or TFAIL

> For those:
> 	testcases/kernel/syscalls/fcntl/fcntl16.c
> 	testcases/kernel/syscalls/fcntl/fcntl18.c
nit: we have git log to see what files has been changed.
IMHO it's better to add fcntl18{16,18}: to the first line.

> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
> v1->v2:
> 	1)correct the patch's format error
> 	2)remove the useless//block1: comments
>  testcases/kernel/syscalls/fcntl/fcntl16.c | 73 +++++++----------------
>  testcases/kernel/syscalls/fcntl/fcntl18.c | 43 ++-----------
>  2 files changed, 27 insertions(+), 89 deletions(-)

> diff --git a/testcases/kernel/syscalls/fcntl/fcntl16.c b/testcases/kernel/syscalls/fcntl/fcntl16.c
> index a77a81298..c5c49284a 100644
> --- a/testcases/kernel/syscalls/fcntl/fcntl16.c
> +++ b/testcases/kernel/syscalls/fcntl/fcntl16.c
> @@ -441,7 +441,7 @@ void setup(void)
>  	sigaction(SIGALRM, &sact, NULL);
>  }

> -int run_test(int file_flag, int file_mode, int start, int end)
> +static void run_test(int file_flag, int file_mode, int start, int end)
>  {
>  	int child_count;
>  	int child;
> @@ -468,7 +468,7 @@ int run_test(int file_flag, int file_mode, int start, int end)
>  				 errno);
>  			close(fd);
>  			unlink(tmpname);
> -			return 1;
> +			goto err;
not sure if change to use goto satisfied Cyril's requirement:

we should rather skip the test in the main instead
as it was done in the original code as:

	if (NO_NFS)
		run_test(...);
	else
		tst_resm(TCONF, "Skipping mandatory locking on NFS");

other than that LGTM
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Also test ignores -i N parameter, because it does not use TEST_LOOPING().
But that's another issue which should be fixed by rewriting the test to new API.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
