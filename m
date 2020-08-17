Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6AF24667C
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:41:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E86403C58D6
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 14:41:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 8C9FD3C3000
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:41:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 4BB79600727
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 14:41:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B99ADB05D;
 Mon, 17 Aug 2020 12:42:00 +0000 (UTC)
Date: Mon, 17 Aug 2020 14:42:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20200817124202.GB8445@yuki.lan>
References: <20200817120644.9401-1-po-hsu.lin@canonical.com>
 <20200817120644.9401-3-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200817120644.9401-3-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/utimensat01: add exception for
 Ubuntu 4.4 kernel
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
Cc: viresh.kumar@linaro.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  testcases/kernel/syscalls/utimensat/utimensat01.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/utimensat/utimensat01.c b/testcases/kernel/syscalls/utimensat/utimensat01.c
> index 7dabfed6d..469cb61c5 100644
> --- a/testcases/kernel/syscalls/utimensat/utimensat01.c
> +++ b/testcases/kernel/syscalls/utimensat/utimensat01.c
> @@ -158,6 +158,10 @@ static void tst_multi_set_time(enum tst_ts_type type, struct mytime *mytime)
>  
>  static void update_error(struct test_case *tc)
>  {
> +	static struct tst_kern_exv kvers[] = {
> +		{ "UBUNTU", "4.4.0-48.69" },
> +	};
> +
>  	if (tc->exp_err != -1)
>  		return;
>  
> @@ -167,9 +171,12 @@ static void update_error(struct test_case *tc)
>  	 * This patch has also been merged to stable 4.4 with
>  	 * b3b4283 ("vfs: move permission checking into notify_change() for utimes(NULL)")
>  	 */
> -	if (tst_kvercmp(4, 4, 27) < 0)
> +	if (tst_kvercmp(4, 4, 27) < 0) {
>  		tc->exp_err = EACCES;
> -	else
> +		// Special case for Ubuntu kernel, which got this patch since 4.4.0-48.69
> +		if (tst_kvercmp2(4, 4, 0, kvers))
> +			tc->exp_err = EPERM;
> +	} else
>  		tc->exp_err = EPERM;

This whole thing looks broken, this is not how the tst_kvercmp2() is
supposed to work. The generic kernel version is supposed to be passed in
the first parameters and the kvers overrides that option.

So this should be something like:

	if (tst_kvercmp2(4, 4, 27, kvers) < 0)
		tc->exp_err = EACCESS;
	else
		tc->exp_err = EPERM;


And in a case that the distro matches to UBUNTU the kernel version is
compared against the "4.4.0-48.69" instead of the generic one.

>  }
>  
> -- 
> 2.17.1
> 

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
