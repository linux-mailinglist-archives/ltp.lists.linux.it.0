Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B141CA4FA
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3808C3C25E0
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 09:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 244A03C252D
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:19:01 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7EB4320134A
 for <ltp@lists.linux.it>; Fri,  8 May 2020 09:19:01 +0200 (CEST)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MyJx6-1jCHdo3GqS-00ygfE for <ltp@lists.linux.it>; Fri, 08 May 2020
 09:19:00 +0200
Received: by mail-qv1-f50.google.com with SMTP id di6so210242qvb.10
 for <ltp@lists.linux.it>; Fri, 08 May 2020 00:19:00 -0700 (PDT)
X-Gm-Message-State: AGi0PuZPYhOYDf9S9vI3edzN6T1XghLZ7hBbMWD5tHStHxU7b0iyd93V
 GJkRKlmPmfiZbiuqztrdwVbc+1TMHJGq8PmFcok=
X-Google-Smtp-Source: APiQypLddxYzNHohgqbb9BGgfX+lUzblcFOmFVnKCTM9W6ZYebscOCFMjS2fY0H207ylfaBYsdqa/XW1ZIAhcszmxvQ=
X-Received: by 2002:ad4:4a8b:: with SMTP id h11mr1320662qvx.210.1588922339699; 
 Fri, 08 May 2020 00:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 09:18:43 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
Message-ID: <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:Y+CMMpI1Q3KN/C9aa/MVzkPqyWFNPLA1f6ZkhkoWWrCHzqO3CTQ
 aAYQSgLM0vBxL3VZHibv0JaOjlt65SzRkgN/RI4e1X8G73HKcoENR/oRgHBFFUibtbwKzeF
 zHWC8GfguKKHNAgph+xGcS78ygCM7H3QRq/LyGSFJyg0sBSwwLVK96zB/3HSyov2BFcak43
 fhGqPhCUDOYNk3IkSKsjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q01jpMVY8CY=:do1/H3plPdjHvHQjTOaWQL
 XkL8P9bS7jgz9PM/K8wqCpaMwnJ23YWjFBYsx/Hmwa6DAZslnDwxwDKokni1pTnjUxTgcgcB0
 AgL7s3nC7u4KTAX6WbzQSsifvMBpUz0LUCzV2aBqR4V/5xpdMWDfrUj9L/zFnMM/62sp+JJPn
 BjliG5Id6kHk+sD3gFGRgRpEieJp6V0rK5+ZLXSgYlJ7hhgTzWtTgke/MNwmTyF4EfuKSTAos
 E3y0iVAHX5hqEbpkgTwKEEtatbJs5p2QwgqAK7PA7rljec3T9RTCCP15/QJ88etRTO5CpdD+S
 5ngD/W9P4zoWmVLFlp3LU+XxYlMKvyS6RSgxLAXYNgwnmul1P3dvD3KQV/3nW7VLHriAvykIV
 U6W6mVNNNmV+Czfjr+txClSvod5mHjD/9xFwDtHSTrRORsgyJLTHGVQP7n35VjMYMzzEdnHpS
 Bc4kZ/42YTmth8sH+wASJ7DNGS4krxfbcEQj0G3L8zOZlJ+AMak7lJAlONdg4FzAbPMt+D+Vb
 lnbzxJVz+4RGuKtuZ5SKytQsqWBk4mfMEYwDqcM1mRK7auUsWAccxCaOlqu4jiZ2MjwTrMHv4
 AKe/rOnRj1ZMqArJnDgFAsKxRf+UWjdHfwOly/fDbcte7cYL7VxtbFSFpuX/i1WquimFvW+WI
 jCg4Z7JdrjcpmBodC5osY302nqmaeW63CdK9jWGfYoZM6D8goIfC2Mzqj+FUuW/AI1Z/VC6F2
 F4DoTe9Vc5EqjewTdLrg3XB5eCGb/Ecwh5BnCpY7Jx0eRn0eWlB7yBc05g6OGFR66NoRvMTft
 ctYq2YywbF8AK2n9zeXxvj+MTZAKDnJHb/SS/Co7JPQwyoMNPU=
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

On Fri, May 8, 2020 at 6:24 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:

> +
> +static inline int sys_semtimedop(int semid, struct sembuf *sops, size_t nsops,
> +               void *timeout)
> +{
> +       return tst_syscall(__NR_semtimedop, semid, sops, nsops, timeout);
> +}
> +
> +static inline int sys_semtimedop_time64(int semid, struct sembuf *sops,
> +                                       size_t nsops, void *timeout)
> +{
> +       return tst_syscall(__NR_semtimedop_time64, semid, sops, nsops, timeout);
> +}
> +
> +struct test_variants {
> +       int (*semop)(int semid, struct sembuf *sops, size_t nsops);
> +       int (*semtimedop)(int semid, struct sembuf *sops, size_t nsops, void *timeout);
> +       enum tst_ts_type type;
> +       char *desc;
> +} variants[] = {
> +       { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},
> +#if defined(TST_ABI32)
> +       { .semtimedop = sys_semtimedop, .type = TST_LIBC_TIMESPEC, .desc = "semtimedop: syscall with libc spec"},
> +       { .semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc = "semtimedop: syscall with kernel spec32"},
> +#endif
> +
> +#if defined(TST_ABI64)
> +       { .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc = "semtimedop: syscall with kernel spec64"},
> +#endif


It feels like this is more complicated than it need to be. The line

semtimedop = sys_semtimedop, .type = TST_KERN_OLD_TIMESPEC, .desc =
"semtimedop: syscall with kernel spec32"},

should apply to any kernel that has "__NR_semtimedop !=
__LTP__NR_INVALID_SYSCALL",
regardless of any other macros set, and then you don't need the separate line

{ .semtimedop = sys_semtimedop, .type = TST_KERN_TIMESPEC, .desc =
"semtimedop: syscall with kernel spec64"},

which is not what the ABI is meant to be anyway (sys_semtimedop takes
a __kernel_old_timespec,
not a __kernel_timespec).

Similarly, the line

 { .semop = semop, .type = TST_LIBC_TIMESPEC, .desc = "semop: vDSO or syscall"},

should apply to both 32 and 64 bit machines

     Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
