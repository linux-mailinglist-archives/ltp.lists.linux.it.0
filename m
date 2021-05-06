Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE999375458
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 15:04:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73D243C67D3
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 15:04:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 08E983C1A24
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:04:21 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AB6A36019C4
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:04:19 +0200 (CEST)
Received: from dggeml706-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FbYcs5jBtzYfG6
 for <ltp@lists.linux.it>; Thu,  6 May 2021 21:01:49 +0800 (CST)
Received: from dggeml753-chm.china.huawei.com (10.1.199.152) by
 dggeml706-chm.china.huawei.com (10.3.17.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 6 May 2021 21:04:12 +0800
Received: from dggeml753-chm.china.huawei.com ([10.1.199.152]) by
 dggeml753-chm.china.huawei.com ([10.1.199.152]) with mapi id 15.01.2176.012;
 Thu, 6 May 2021 21:04:12 +0800
From: zhaogongyi <zhaogongyi@huawei.com>
To: Cyril Hrubis <chrubis@suse.cz>, "pvorel@suse.cz" <pvorel@suse.cz>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Thread-Topic: [LTP] [COMMITTED] [PATCH] syscalls: modify_ldt02: Fix failure
Thread-Index: AddCdv0/i7dJB1kjQs23JdAWmqn7jg==
Date: Thu, 6 May 2021 13:04:12 +0000
Message-ID: <d133afe6b6be43b089a68e0a72b15960@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.110.209]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] syscalls: modify_ldt02: Fix failure
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril, Petr,

I am sorry, It's my fault. It seems that restore to origin code is more better since it might create a core file.

Best Regards,
Gongyi


> 
> The test was wrong to begin with, if we want to get SEGFAULT from the
> waitpid() we cannot setup a handler that catches it and exits with 0.
> 
> Fixes: f5e8e6b11ce8 ("syscalls/modify_ldt: Replace TINFO with TPASS or
> TFAIL")
> Reported-by: Petr Vorel <pvorel@suse.cz>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> ---
>  .../kernel/syscalls/modify_ldt/modify_ldt02.c     | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
> b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
> index e34d3d54d..f911aa5fd 100644
> --- a/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
> +++ b/testcases/kernel/syscalls/modify_ldt/modify_ldt02.c
> @@ -120,6 +120,7 @@ int main(int ac, char **av)
> 
>  		tst_old_flush();
>  		if ((pid = FORK_OR_VFORK()) == 0) {
> +			signal(SIGSEGV, SIG_DFL);
>  			val = read_segment(0);
>  			exit(1);
>  		}
> @@ -168,24 +169,10 @@ int read_segment(unsigned int index)
>  	return res;
>  }
> 
> -void sigsegv_handler(int sig)
> -{
> -	tst_resm(TINFO, "received signal: %d", sig);
> -	exit(0);
> -}
> -
>  void setup(void)
>  {
> -	struct sigaction act;
> -
> -	memset(&act, 0, sizeof(act));
> -	sigemptyset(&act.sa_mask);
> -
>  	tst_sig(FORK, DEF_HANDLER, cleanup);
> 
> -	act.sa_handler = sigsegv_handler;
> -	(void)sigaction(SIGSEGV, &act, NULL);
> -
>  	TEST_PAUSE;
>  }
> 
> --
> 2.26.3
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
