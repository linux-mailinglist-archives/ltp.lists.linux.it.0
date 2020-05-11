Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E551CD278
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:21:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 315A73C2607
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:21:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 248773C2607
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:21:15 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 77C11600C55
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:20:58 +0200 (CEST)
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mnac9-1irFGx2kWz-00jb0O for <ltp@lists.linux.it>; Mon, 11 May 2020
 09:21:14 +0200
Received: by mail-qk1-f181.google.com with SMTP id f189so3115727qkd.5
 for <ltp@lists.linux.it>; Mon, 11 May 2020 00:21:14 -0700 (PDT)
X-Gm-Message-State: AGi0PuYWKuZ8X5qXKhjJA48zA9K8JH0Df4Ekmg3WcUNft023c8yx6Bx2
 u71QcmRdzp8FxAMUCi83LDjW5hP7gBO7bvVPyk0=
X-Google-Smtp-Source: APiQypJ8Itr/0I2W0TM/J+HEu5Zs5Bj+BVPDvKTm0EMpetTBhON4/v2c0rtj3HX1kr7JRc1Sn/r4ZpISI1HtmI0hOB4=
X-Received: by 2002:a37:4e08:: with SMTP id c8mr14033659qkb.286.1589181673437; 
 Mon, 11 May 2020 00:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
In-Reply-To: <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 May 2020 09:20:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
Message-ID: <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:85bT2I0lMW9ZYOG0teAQ/I2HiG465YGDdJxKsQhW2L1DW9uGsPY
 72+L5cZnYQMhm4h8m4/Nzj5MqHJXpNb8Gbxff+CbZgYYziXYKTHKpJl0a+UvGthODhnPz6p
 r31IJWzMieC/8vOmo23T3Js+5gFnKwUnMTEbR0nJR0Auh2Ca7zv1wAnIFHLL1z2K1Mic3ei
 LUz0zroRWXkSOny2d7J2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hDwUpKAgMB8=:SxVGQYjDb3+dvDFtdlFPjA
 dNtdpgS5pIeloSimAO7xy77F2qOlVge7IDOP3BkSCFrTZb4fsebmLMe50sxCzjlQfU7qlqyMR
 53WV2cB8Rde/zCVBkrHyrmCiYUgNHsA14Se2XlF16WibQiIE5/eWDm7WuJusqg/GvxlDpGyS/
 RtGSoAVkODPEP6FqRQXVI6ItS15aTGsUJsDfJn/6IoLzkpaFes5/lOkBzNcd42mHTpEUvcJTP
 wnKejJgq2jtzNCUsCXvfMnSzu9L/tmND+1uxRKG5HfsAaCQFrZ1SPOGTF0hQUK6wGOE2Wa0HG
 u4gzNyh6DYbBJoTADN5S+vLaiDpQcrlP3v1rgfaspSuei1zerMkAJEvL8qn14+EiG3PG0L+UZ
 3XW+ltlcibOvYruDTSx0HvbGa9gwqVNNiq4SyQQId/BDYDjG/h71/qyMwlzLOyhleG3hQAMHP
 UMjaRGf5cp5+9t/PZVF6mj/cqWRegrtvqpz+5nlkPCdlH0d6YwDSqx0wyJD24uqQKByn4reu7
 zaVIlox7XRYDoSOy276fUP2JWaVvDoHt5xCYn4a4dhIbVc254uCKscrWgFkm6JjWmVL3sXomR
 UxQDcMVKxcJ5KCWkXVjewZC7xjgPygCeg/YqT3INRufbQyl8rJZRcfQexVfx1eX3zQn4mYpgD
 ieu3Dt4aiR5EErMgCCRx2QF4MqsJB8ShQIgD24sYDzDgCMeN8qxj390AFm5cRmuLBsOlOVuD+
 1Es7A3k14YTO0ZO6mJLB25QoQ3/GKOUqYbDLrRSxqchgRQIWyO9DRI6JOPaVvKSy7pv7b8wns
 I2NtwiumjlRNoLkaYbMwQ5O7gU+ehmWEU+YZfN0J67ES9L5IQ0=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, May 11, 2020 at 8:49 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 08-05-20, 09:18, Arnd Bergmann wrote:
> >
> > Similarly, the line
> >
> >  { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> >
> > should apply to both 32 and 64 bit machines
>
> This is how I modified this and all other time64 tests, I hope this looks fine now ?
>
> diff --git a/testcases/kernel/syscalls/ipc/semop/semop.h b/testcases/kernel/syscalls/ipc/semop/semop.h
> index 8d1245b65ec0..8647fa686bd3 100644
> --- a/testcases/kernel/syscalls/ipc/semop/semop.h
> +++ b/testcases/kernel/syscalls/ipc/semop/semop.h
> @@ -26,17 +26,13 @@ struct test_variants {
>         char *desc;
>  } variants[] = {
>         { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> -#if defined(TST_ABI32)
> -       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
> -       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
> -#endif
>
> -#if defined(TST_ABI64)
> -       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
> +#if (__NR_semtimedop != __LTP__NR_INVALID_SYSCALL)
> +       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with old kernel spec"},
>  #endif
>
>  #if (__NR_semtimedop_time64 != __LTP__NR_INVALID_SYSCALL)
> -       { .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec64"},
> +       { .semtimedop = sys_semtimedop_time64, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall time64 with kernel spec"},
>  #endif
>  };

Yes, much better. Please do it like this for all the tests.

It looks like you are still missing a test for the libc semtimedop function with
TST_LIBC_TIMESPEC, but perhaps this is in a different place?

There is one more complication regarding semtimedop, and that is how some
architectures never had this as a separate syscall but instead require calling
sys_ipc(SEMTIMEDOP, ...). All architectures that have sys_ipc() let you use
both SEMOP and SEMTIMEDOP with __kernel_old_timespec. Some
architectures define more than one of __NR_ipc, __NR_semtimedop and
__NR_semop.

As of linux-5.1, all 64-bit architectures at least have __NR_semtimedop, and
all 32-bit architectures at least have __NR_semtimedop64, plus whatever
other variants they supported before then.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
