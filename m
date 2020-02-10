Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A90157CD0
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 14:50:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BF593C2590
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Feb 2020 14:50:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 5A5A63C255F
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 14:50:46 +0100 (CET)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 55D0C1000C23
 for <ltp@lists.linux.it>; Mon, 10 Feb 2020 14:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=71DPx
 etn1+VPPLvzwhkz4V9M3q/OHBFOVV6ZbZ1EmzY=; b=Xe1rkTT1Y1SYDwCyjn5pK
 6Uj3yEMthvGx3YH9Jg8qE0GW7Mm8a/KqRhEBdCKuJCQpDA1jxog5RyV2dSUvmbGC
 RvgUBEijMSnLdWCGD+RJqh5Pf/ri/mmjFvTDhC+RlgUdsRkkvveKjhUbGSN9GUoU
 RK+LPM4gFHG+z8TK/ixF/s=
Received: from [192.168.0.10] (unknown [223.64.143.7])
 by smtp12 (Coremail) with SMTP id EMCowAD3TrOvX0Fe68t4BA--.4575S2;
 Mon, 10 Feb 2020 21:50:40 +0800 (CST)
To: Jan Stancek <jstancek@redhat.com>, ltp@lists.linux.it
References: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <ff9ef44d-2d6e-1e76-93f2-ab5c3bae8b86@163.com>
Date: Mon, 10 Feb 2020 21:50:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87e6761eb699c7912e2064dea222f5ac7fd04a6b.1581338640.git.jstancek@redhat.com>
Content-Language: en-US
X-CM-TRANSID: EMCowAD3TrOvX0Fe68t4BA--.4575S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW5uFyxWF15Cr13XFyxZrb_yoW8Gr1xpr
 s7Ca40v3WrtFn7A3WUJr9I9FyUXwn3Jry8tF4DArZ5Cr48tF95KFsFgFyavw17Xrs0gayS
 yF4SgFyqq3Z09FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jp38nUUUUU=
X-Originating-IP: [223.64.143.7]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEBDFXlUMPOyrUAAAsp
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/setrlimit06: lower RLIMIT_CPU parameters
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

It looks good to me and thanks a lot for your improvement. :-)

Reviewed-by: Xiao Yang <ice_yangxiao@163.com>

Best Regards,

Xiao Yang

On 2/10/20 8:47 PM, Jan Stancek wrote:
> Lower the parameters so that test completes faster where possible.
>
> This also increases alarm timer slightly, which in combination with
> lower RLIMIT_CPU aims to avoid false positives in environments with
> high steal time, where it can take multiple of wall clock seconds
> to spend single second on a cpu.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>   testcases/kernel/syscalls/setrlimit/setrlimit06.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit06.c b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
> index 726b26841583..3e5bf1d4253d 100644
> --- a/testcases/kernel/syscalls/setrlimit/setrlimit06.c
> +++ b/testcases/kernel/syscalls/setrlimit/setrlimit06.c
> @@ -59,8 +59,8 @@ static void verify_setrlimit(void)
>   	pid = SAFE_FORK();
>   	if (!pid) {
>   		struct rlimit rlim = {
> -			.rlim_cur = 2,
> -			.rlim_max = 3,
> +			.rlim_cur = 1,
> +			.rlim_max = 2,
>   		};
>   
>   		TEST(setrlimit(RLIMIT_CPU, &rlim));
> @@ -70,7 +70,7 @@ static void verify_setrlimit(void)
>   			exit(1);
>   		}
>   
> -		alarm(10);
> +		alarm(20);
>   
>   		while (1);
>   	}


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
