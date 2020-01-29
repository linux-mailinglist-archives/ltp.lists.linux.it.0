Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C281F14CC21
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:10:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 165E23C2431
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 15:10:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D14433C23E1
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:10:53 +0100 (CET)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 225EC2013C8
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 15:10:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=PzAnm
 wpiV5+pU7BXOZVS9+m+ZXsJ0d5MMQ2sZZYDz6Q=; b=ICN2+I4fntMGoMozbeKAL
 82w6P2Qc7qLrYl4PQ9YY2oRe/KYFOjx8x+q1TO7Lm3FmSHkv7hVkrn/Hj2KQQIHX
 ITAfXlQAyd04sjTgfha2+z1xNzkedaJYR57q5AYwDmAYx+Plik3WUvNPfvAbtu2o
 3nyRlS222qZT81Sf+Ao5ww=
Received: from [192.168.0.10] (unknown [223.64.161.133])
 by smtp14 (Coremail) with SMTP id EsCowACnrIQ0kjFeOdGtTQ--.43529S2;
 Wed, 29 Jan 2020 22:09:57 +0800 (CST)
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <846e4f42d5112c2f945c391644949a14756f53f6.1580295508.git.viresh.kumar@linaro.org>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <8a50f9c2-dac7-97e4-def2-9283f912b891@163.com>
Date: Wed, 29 Jan 2020 22:09:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <846e4f42d5112c2f945c391644949a14756f53f6.1580295508.git.viresh.kumar@linaro.org>
Content-Language: en-US
X-CM-TRANSID: EsCowACnrIQ0kjFeOdGtTQ--.43529S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyrWF1kKr4kCrW8Ar1kKrg_yoWDZFb_uw
 1UKr93CwsIqFnIqFZ8CrsY9FsFg3yDuw1rWw15WFsrJryqyFn8Aw1rt343ZF98Ga1UJrn0
 va1DXrySgr13ZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUe2LvtUUUUU==
X-Originating-IP: [223.64.161.133]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEgS5XlZYHPknvAAAsB
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/io_pgetevents: Use tst_syscall() instead
 of syscall()
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 1/29/20 6:58 PM, Viresh Kumar wrote:
> Use the preferred helper tst_syscall() instead of syscall(), as it also
> takes care of error handling.

Hi,

It is obviously correct.

Reviewed-by: Xiao Yang <ice_yangxiao@163.com>

Best Regards,

Xiao Yang

>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   include/lapi/io_pgetevents.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/lapi/io_pgetevents.h b/include/lapi/io_pgetevents.h
> index 9c7f0ec9d813..3c9d5b2d7618 100644
> --- a/include/lapi/io_pgetevents.h
> +++ b/include/lapi/io_pgetevents.h
> @@ -21,7 +21,8 @@ int io_pgetevents(io_context_t ctx, long min_nr, long max_nr,
>   		 struct io_event *events, struct timespec *timeout,
>   		 sigset_t *sigmask)
>   {
> -	return syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events, timeout, sigmask);
> +	return tst_syscall(__NR_io_pgetevents, ctx, min_nr, max_nr, events,
> +			   timeout, sigmask);
>   }
>   #endif /* HAVE_IO_PGETEVENTS */
>   #endif /* HAVE_LIBAIO */


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
