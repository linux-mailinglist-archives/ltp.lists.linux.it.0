Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9D35C928
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:49:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 31DD73C7827
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Apr 2021 16:49:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8286F3C1DE4
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:49:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 52387600911
 for <ltp@lists.linux.it>; Mon, 12 Apr 2021 16:49:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A057B0EA;
 Mon, 12 Apr 2021 14:49:23 +0000 (UTC)
Date: Mon, 12 Apr 2021 16:41:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YHRcJOUer87SUn6v@yuki>
References: <20210330104613.1059-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330104613.1059-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Modify the test logic of mincore.
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
> Currently mincore has a vulnerability and is easy to be attacked.
> CVE has fixed the vulnerability.
> Please see https://www.linuxkernelcves.com/cves/CVE-2019-5489
> 
> Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
> ---
>  testcases/kernel/syscalls/mincore/mincore04.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/mincore/mincore04.c b/testcases/kernel/syscalls/mincore/mincore04.c
> index ed0ab7dfa..345dedd9a 100644
> --- a/testcases/kernel/syscalls/mincore/mincore04.c
> +++ b/testcases/kernel/syscalls/mincore/mincore04.c
> @@ -95,12 +95,12 @@ static void test_mincore(void)
>  	locked_pages = count_pages_in_cache();
>  	tst_reap_children();
> 
> -	if (locked_pages == NUM_PAGES)
> -		tst_res(TPASS, "mincore reports all %d pages locked by child process "
> -			"are resident", locked_pages);
> -	else
> -		tst_res(TFAIL, "mincore reports %d pages resident but %d pages "
> +	if (locked_pages == 0)
> +		tst_res(TPASS, "mincore reports %d pages resident but %d pages "
>  			"locked by child process", locked_pages, NUM_PAGES);
> +	else
> +		tst_res(TFAIL, "mincore reports all %d pages locked by child process "
> +			"are resident", locked_pages);
>  }

This does not make any sense, the kernel commit explicitly states that
all mapped pages are reported as in core. We do call mlock() in the
child, which will fault all the pages and lock them in memory. So the
test should work both before and after the fix as well.

The kernel commit in question weakened mincore() in a sense that it's
more likely to report pages in core than it previously was. Now all that
is needed is to fault the pages by reading some bytes from them to make
sure they are reported as in core.

If the test fails for you, something is probably broken at your end.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
