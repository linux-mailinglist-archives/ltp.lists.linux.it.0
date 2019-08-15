Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BED58E53D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 09:10:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C9AE3C1D75
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Aug 2019 09:10:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E7A923C1D06
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 09:10:43 +0200 (CEST)
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DBC901A01555
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 09:10:42 +0200 (CEST)
Received: by mail-ua1-f68.google.com with SMTP id g13so503444uap.5
 for <ltp@lists.linux.it>; Thu, 15 Aug 2019 00:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfcuaZ48Oi9PfwZX4ZHzw2YmRH5kbBJVb1DB2eAuy7k=;
 b=dMgnfcs0zwZSpOVCuYa53JBLftYFQ+/RkbAvk9w1zru+p6kjJMU7B/GYxqCnhQMCpS
 OuNHGOMNiwhsFl4a5vAHxkstQYouw9MZNA5Oi9IxWCGQ3c0OvxdE2LJf1AJ45m02+xy1
 bCmLIqZuQzGuldMKS9IuvZa9PMY1uZuQxne8NeEU6FIiza7Sme/++Jfvxvo4z2PJQQV4
 ggOhi8PAhmHNNQFFCWINhp0NOpFlMjOOhpVh6PP+gTJCjszMpVBc2UyzSEIukLQsmAd6
 U3Pmni4j60oHXwo6yGcNyNaxA3gM8qzB3LTeQmnjrqRX/8JsTe4xS7Ph+vTuva0kE7H5
 jtRA==
X-Gm-Message-State: APjAAAXvj5SdKtzM2fx6/pTHtPK8CgHiDQi59UBFVYQa4kKGckNZ0Lv+
 uYdXP44Pyu/mKHpiqz6uuntWqOrKBE2GRGazgqJ0TA==
X-Google-Smtp-Source: APXvYqyoG38ZB7+OiR4BF8EItaO805axdWZFk/RYJ3xamRvxkdw0M2N9OcIeQKEZVg6BfQFQ3p4hosy+H4QoOq5KqLQ=
X-Received: by 2002:a9f:3105:: with SMTP id m5mr2469112uab.142.1565853041586; 
 Thu, 15 Aug 2019 00:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190808153825.18363-1-rpalethorpe@suse.com>
 <20190808153825.18363-2-rpalethorpe@suse.com>
In-Reply-To: <20190808153825.18363-2-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 15 Aug 2019 15:10:30 +0800
Message-ID: <CAEemH2czBk5KKgFB0_4bWtnwdnJdq0sJNmo=q3_u1UipEhaOJw@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Cc: mmoese@suse.com, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Aug 8, 2019 at 11:39 PM Richard Palethorpe <rpalethorpe@suse.com> wrote:
>
> ---
>  include/tst_capability.h | 56 +++++++++++++++++++++++++++++
>  include/tst_test.h       |  6 ++++
>  lib/tst_capability.c     | 78 ++++++++++++++++++++++++++++++++++++++++
>  lib/tst_test.c           |  3 ++
>  4 files changed, 143 insertions(+)
>  create mode 100644 include/tst_capability.h
>  create mode 100644 lib/tst_capability.c
>
> diff --git a/include/tst_capability.h b/include/tst_capability.h
> new file mode 100644
> index 000000000..6342b667e
> --- /dev/null
> +++ b/include/tst_capability.h
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> + */
> +/**
> + * @file tst_capability.h
> + *
> + * Limited capability operations without libcap.
> + */
> +
> +#include <stdint.h>
> +
> +#include "lapi/syscalls.h"
> +
> +#ifndef TST_CAPABILITY_H
> +#define TST_CAPABILITY_H
> +
> +#ifndef CAP_SYS_ADMIN
> +# define CAP_SYS_ADMIN        21
> +#endif
> +
> +#ifndef CAP_TO_MASK
> +# define CAP_TO_MASK(x)      (1 << ((x) & 31))
> +#endif
> +
> +#define TST_DROP 1
> +#define TST_REQUIRE 1 << 1
> +
> +#define TST_CAP(action, capability) {action, capability, #capability}
> +
> +struct tst_cap_user_header {
> +       uint32_t version;
> +       int pid;
> +};
> +
> +struct tst_cap_user_data {
> +       uint32_t effective;
> +       uint32_t permitted;
> +       uint32_t inheritable;
> +};
> +
> +struct tst_cap {
> +       uint32_t action;
> +       uint32_t id;
> +       char *name;
> +};
> +
> +int tst_capget(struct tst_cap_user_header *hdr,
> +              struct tst_cap_user_data *data);
> +int tst_capset(struct tst_cap_user_header *hdr,
> +              const struct tst_cap_user_data *data);
> +
> +void tst_cap_action(struct tst_cap *cap);
> +void tst_cap_setup(struct tst_cap *cap);
> +
> +#endif
> diff --git a/include/tst_test.h b/include/tst_test.h
> index cdeaf6ad0..84acf2c59 100644
> --- a/include/tst_test.h
> +++ b/include/tst_test.h
> @@ -36,6 +36,7 @@
>  #include "tst_sys_conf.h"
>  #include "tst_coredump.h"
>  #include "tst_buffers.h"
> +#include "tst_capability.h"
>
>  /*
>   * Reports testcase result.
> @@ -206,6 +207,11 @@ struct tst_test {
>          * NULL-terminated array to be allocated buffers.
>          */
>         struct tst_buffers *bufs;
> +
> +       /*
> +        * NULL-terminated array of capability settings
> +        */
> +       struct tst_cap *caps;
>  };
>
>  /*
> diff --git a/lib/tst_capability.c b/lib/tst_capability.c
> new file mode 100644
> index 000000000..d229491ae
> --- /dev/null
> +++ b/lib/tst_capability.c
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
> + */
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_capability.h"
> +
> +int tst_capget(struct tst_cap_user_header *hdr,
> +              struct tst_cap_user_data *data)
> +{
> +       return tst_syscall(__NR_capget, hdr, data);
> +}
> +
> +int tst_capset(struct tst_cap_user_header *hdr,
> +              const struct tst_cap_user_data *data)
> +{
> +       return tst_syscall(__NR_capset, hdr, data);
> +}
> +
> +void tst_cap_action(struct tst_cap *cap)
> +{
> +       struct tst_cap_user_header hdr = {
> +               .version = 0x20080522,
> +               .pid = tst_syscall(__NR_gettid),
> +       };
> +       struct tst_cap_user_data cur = { 0 };
> +       struct tst_cap_user_data new = { 0 };
> +       uint32_t mask = CAP_TO_MASK(cap->id);
> +       uint32_t act = cap->action;
> +
> +       if (tst_capget(&hdr, &cur))
> +               tst_brk(TBROK | TTERRNO, "tst_capget()");
> +
> +       new = cur;
> +
> +       switch (act) {
> +       case TST_DROP:
> +               if (cur.effective & mask) {
> +                       tst_res(TINFO, "Dropping %s(%d)",
> +                               cap->name, cap->id);
> +                       new.effective &= ~mask;
> +                       new.permitted &= ~mask;
> +                       new.inheritable &= ~mask;
> +               }
> +               break;
> +       case TST_REQUIRE:
> +               if (cur.permitted ^ mask) {
> +                       tst_brk(TCONF, "Need %s(%d)",
> +                               cap->name, cap->id);
> +               } else if (cur.effective ^ mask) {
> +                       tst_res(TINFO, "Permitting %s(%d)",
> +                               cap->name, cap->id);
> +                       new.effective |= mask;
> +                       new.inheritable |= mask;
> +               }
> +               break;
> +       default:
> +               tst_brk(TBROK, "Unrecognised action %d", cap->action);
> +       }
> +
> +       if (cur.effective != new.effective) {
> +               if (tst_capset(&hdr, &new))
> +                       tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);

It does not work for this simple cap_test.c, did I miss anything?

# whoami
root

# ./cap_test
tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
tst_capability.c:42: INFO: Dropping CAP_SYS_ADMIN(21)
tst_capability.c:65: BROK: tst_capset(CAP_SYS_ADMIN): EPERM

# ./cap_test
tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
tst_capability.c:51: CONF: Need CAP_SYS_ADMIN(21)

# cat cap_test.c
#include "tst_test.h"
#include "linux/capability.h"

static void do_test(void)
{
        tst_res(TPASS, "Hello");
}

static struct tst_test test = {
        .test_all = do_test,
        .needs_root = 1,
        .caps = (struct tst_cap []) {
//                TST_CAP(TST_DROP, CAP_SYS_ADMIN),
                TST_CAP(TST_REQUIRE, CAP_SYS_ADMIN),
                {},
        },
};

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
