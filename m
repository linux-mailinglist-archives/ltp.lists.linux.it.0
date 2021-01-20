Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8392FCDD8
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 11:33:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 29F2A3C5F83
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 11:33:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6E1283C1B8D
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 11:33:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id EF410600C06
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 11:33:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 570C5AAAE;
 Wed, 20 Jan 2021 10:33:55 +0000 (UTC)
Date: Wed, 20 Jan 2021 11:34:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <YAgHUvIge6svN0gu@yuki.lan>
References: <20210112020227.11775-1-yangx.jy@cn.fujitsu.com>
 <20210112020227.11775-3-yangx.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112020227.11775-3-yangx.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 3/3] syscalls: Take use of TST_EXP_PASS_SILENT
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
> diff --git a/testcases/kernel/syscalls/capget/capget01.c b/testcases/kernel/syscalls/capget/capget01.c
> index 6c17a7c7c..af088e2fc 100644
> --- a/testcases/kernel/syscalls/capget/capget01.c
> +++ b/testcases/kernel/syscalls/capget/capget01.c
> @@ -32,8 +32,10 @@ static void verify_capget(unsigned int n)
>  	hdr->version = tc->version;
>  	hdr->pid = pid;
>  
> -	TST_EXP_PASS(tst_syscall(__NR_capget, hdr, data),
> +	TST_EXP_PASS_SILENT(tst_syscall(__NR_capget, hdr, data),
>  	             "capget() with %s", tc->message);
> +	if (!TST_PASS)
> +		return;
>  
>  	if (data[0].effective & 1 << CAP_NET_RAW)
>  		tst_res(TFAIL, "capget() gets CAP_NET_RAW unexpectedly in pE");

I do not agree with the change in the capget01 here since there are
really two testcases there and the test was producing the same amount of
TPASS messages before the change to the TST_EXP_PASS() as well.

Other than that the patchset is fine.

So with the capget change removed you can add my:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
