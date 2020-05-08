Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E87501CA618
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 10:30:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 939A33C56EA
	for <lists+linux-ltp@lfdr.de>; Fri,  8 May 2020 10:30:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 32B943C1D8A
 for <ltp@lists.linux.it>; Fri,  8 May 2020 10:30:55 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1C7C6012D4
 for <ltp@lists.linux.it>; Fri,  8 May 2020 10:30:39 +0200 (CEST)
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGQWr-1jKc3U2de1-00Grit for <ltp@lists.linux.it>; Fri, 08 May 2020
 10:30:53 +0200
Received: by mail-qk1-f175.google.com with SMTP id 23so814013qkf.0
 for <ltp@lists.linux.it>; Fri, 08 May 2020 01:30:53 -0700 (PDT)
X-Gm-Message-State: AGi0PuYI5Jhj3mGUXx9/c+Iq5/Iu1BYhWgGRwxnhbK/SV9TdvV3NhtrG
 1pVhPrOb6020V48yBTcMpCmuI4lj61b1q0UTKng=
X-Google-Smtp-Source: APiQypI2GUkaD4v3gMq3xti8h5wIIAK2Q+upc02UjHcgJzmSB1oB5DTjGyyfQCz+DYrsvQIlSF5wBp0V2xllCSm8WAM=
X-Received: by 2002:a05:620a:3c5:: with SMTP id
 r5mr1662598qkm.138.1588926652531; 
 Fri, 08 May 2020 01:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <d115c3ad61a422e5cadd3617c554c91a242defad.1588911607.git.viresh.kumar@linaro.org>
In-Reply-To: <d115c3ad61a422e5cadd3617c554c91a242defad.1588911607.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 May 2020 10:30:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_MAOyEXjdGJ0YAwKwn-j9Y+3apfM1W4SUnwVQRBC2MA@mail.gmail.com>
Message-ID: <CAK8P3a0_MAOyEXjdGJ0YAwKwn-j9Y+3apfM1W4SUnwVQRBC2MA@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:ua8qpJeCTEdhG6yE3nIAenTsltVNPGn4bfkhf4s95igcpCkPZ3i
 7wLnF/7Z3siTBc6UyX0Th4j13M5rkPDz6aMMVRv/21wcHfkrhF2udAEovBFz467o6yAN60g
 XREYm/U63GoKjjWcII9nnAF5E2jY4+5XcsnY16LrofINgPaT24Sak3MzuTsU1BmwCQvPW4E
 MQsYT74eJg7HErOEI94YA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uVGSjwSGX6s=:5YT8qcxDAIjgcpD4VRE6y9
 Tu/Jd3P+b7b8CfzI/7YI9BtyINuZqry5Jv9yzUx8gWM+KRbutIslV8izkQAfxD/wz7O9Gheda
 K2ybpabgXhTZFRhgplEZPIRBbTzvwWezIYh+RRJJPubbuhVwapwXCY3xfHaS98pwxnIgmUb/L
 tPq+fNW6+J3aYb8SSqk2E/94lYOspGR77ZpogtFPNcG1ZB5Rx+vuLHAd559O7U3aAFIkqYXUt
 saC1hcYTQfeEjDO1cIwV3zXfdFxLsDIEML1gHrLbqFq0vNQBbH2+AbA3BmOW5XA8KxoFN6Eq/
 hczYAE2jF0p5qoUuBBcjuZVquXSBbbvAEuklyoyVpj/LTfid17AQ3jspErlTacgKB48xk/0bG
 1WCPqs4v0KyuwUjgSp71X7OJPAHebsycnR5J0ZvqkC1wFXezFCrSSwpX3SkA7sBJSUYsQ2N+F
 iVQ8AyWcZv+3Az4ojGCeCz5aDui0EXvyX8r9q3weDKX5zbL7TeLBgJZAau62AgNj+WXAWhrQN
 FbM4E3SGkVClY7S5qow73PhDG0ecUOd97gKINfJtO+HdUpuYiE7d6/9O7y+E4OU85RWgBTkwc
 lQiyZfqAP50hHftNO9fwLIvgttt5Ure3T3VfSiS9/jnG3JkNoPtypJBWk+WzRsBWivTLrI8Sg
 kkITpVv+8g7oLqdohYSc62jSIu7i1fNSMWvm5ZceN5I5o7w+tcgw15/xR0biv90giA2PkMtdV
 mJjEInygEgefhtiPylzs1QymPedIUICxIaH9OEzbfEFeyP2SLN8Ey3pRUW2vNc8hyHTo10Yn3
 Ba83imwxalre58WZm/QSnNpOcqfEwmp+CtOkZBUpX8GLtanlH0=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 01/17] syscalls/timer_gettime: Add support for
 time64 tests
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

> +#if defined(TST_ABI32)
> +       { .func = sys_timer_gettime, .type = TST_LIBC_TIMESPEC, .desc = "syscall with libc spec"},
> +#endif

> +#if defined(TST_ABI64)
> +       { .func = sys_timer_gettime, .type = TST_KERN_TIMESPEC, .desc = "syscall with kernel spec64"},
> +#endif

I think these are both invalid: timer_gettime() does not take a libc timespec or
a __kernel_timespec but takes a __kernel_old_timespec. You should only
use the libc data structure with the libc timer_gettime, and the
__kernel_timespec
with the kernel's timer_gettime64().

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
