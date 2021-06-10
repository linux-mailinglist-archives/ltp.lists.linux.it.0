Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B5F3A23C2
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 07:12:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC4813C31AA
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Jun 2021 07:12:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 16AFE3C3161
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 07:12:45 +0200 (CEST)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 470E010004A2
 for <ltp@lists.linux.it>; Thu, 10 Jun 2021 07:12:45 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id j2so1053968lfg.9
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 22:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WIe2VjjkIw2VoZM3OGEI2hJhJk6K2hOnuugB7buG0o=;
 b=jVuq8Z74osowbeE1HvswVLy0Zbx20eBFV5/MfW+nhfankcasnVfw6y14jKSZcSic06
 raWgpDYpEW0WCc3Dw6Y86Wblr+ug4oqeEKVS2+flQ/cv38o3aRjQsk82Mpf7xOJkgMyq
 BAovOJNN8dMK6a972yDFdKTu8HKKzDRbYB8E8XwNN+FNmCyOdkJE+IM2S6XywrOhKohn
 wDkLa47juXRQ6KL0jIkt7F3qL4OG7xVpS8Xl0pLizRTV++0f4IecrGFrO/+t4uq6xLES
 zsWSw0krV+hNYXVNE3qq770KHkw+AJPP6fFwmpCwwkXuC0/DNthcgAX3frqiUw7QyI/6
 /FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WIe2VjjkIw2VoZM3OGEI2hJhJk6K2hOnuugB7buG0o=;
 b=k6nmIrdpgPdTVQAuBoHaqiRGt22xyxWvwdPabVZYMaieSt9MuXqJOIKRJHJM7gMioW
 Z4PLeMmXHl2b8KDhXMvZXETLKO2+QUWKLN1h6qd64XNRNX8FTlPNhemeJ35o3k7fmqiO
 kVI+8qrz93pK5lr/4wyqRb9OIu+GF188MBiOUOb9YO5zBR2NXb2idv6djjtitmWyI91s
 re+mUchBKaHA/6U0jLr4rID1TLcZMR4UVHawCgCCyvCT9qy8MF+JaP8zVRsp6RfUWveu
 CxEO1Qd70mHkArVQK41nc5ZNOCtyIuCmyHmkW5ifrEHr/lQCwJW1LK7SYzjoi/Xj8NfW
 xAqQ==
X-Gm-Message-State: AOAM531YslPKwZ2VsZ6Wu+7IrDfv9F95eqzFs9FDVbuCUx7s879F6o4f
 kIepju8TbyeDfBiJ5QPmLzOSyOXfj7Nnu+4lGpo=
X-Google-Smtp-Source: ABdhPJyFUXMheOUroLGm0JTKnhN14aJs8vEEE/9KKcHPalpz8ACY4O6L0u5VUuQDvXha0i5RYS3Tovymq4L5YBmVE6c=
X-Received: by 2002:ac2:44a9:: with SMTP id c9mr742757lfm.434.1623301964563;
 Wed, 09 Jun 2021 22:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210602040423.9350-1-vinay.m.engg@gmail.com>
 <20210610050952.2862-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210610050952.2862-1-vinay.m.engg@gmail.com>
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Thu, 10 Jun 2021 10:42:32 +0530
Message-ID: <CANUMPcUhvi4t_u_oY-w41As3UBLQ_Uc_fSgzYkAcKHW1VJShEg@mail.gmail.com>
To: metan@ucw.cz, ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] adjtimex02.c: Skipped EFAULT tests for libc
 variant"
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
Cc: umesh kalappa0 <umesh.kalappa0@gmail.com>,
 Randy MacLeod <rwmacleod@gmail.com>, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Metan,

Patch is updated with commit log. Added the reason for EFAULT skipped
for libc variant as below,
"Tests for bad addresses in LTP cases trigger segment fault in libc on
a 32bit system."

Regards,
Vinay

On Thu, Jun 10, 2021 at 10:40 AM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> From: vinay kumar <vinay.m.engg@gmail.com>
>
> Tested EFAULT cases only for "__NR_adjtimex" syscall.
>
> Tests for bad addresses in LTP cases trigger segment
> fault in libc on a 32bit system.
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  .../kernel/syscalls/adjtimex/adjtimex02.c     | 226 ++++++++++++------
>  1 file changed, 152 insertions(+), 74 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/adjtimex/adjtimex02.c b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> index 19ee97158..5eaea6352 100644
> --- a/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> +++ b/testcases/kernel/syscalls/adjtimex/adjtimex02.c
> @@ -10,115 +10,193 @@
>  #include <unistd.h>
>  #include <pwd.h>
>  #include "tst_test.h"
> +#include "lapi/syscalls.h"
>
> -#define SET_MODE ( ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
> -       ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK )
> +#define SET_MODE (ADJ_OFFSET | ADJ_FREQUENCY | ADJ_MAXERROR | ADJ_ESTERROR | \
> +                               ADJ_STATUS | ADJ_TIMECONST | ADJ_TICK)
>
> -static int hz;                 /* HZ from sysconf */
> -
> -static struct timex *tim_save;
> -static struct timex *buf;
> +static int hz;         /* HZ from sysconf */
>
> +static struct timex *tim_save, *buf;
>  static struct passwd *ltpuser;
>
> -static void verify_adjtimex(unsigned int nr)
> +struct test_case {
> +       unsigned int modes;
> +       long lowlimit;
> +       long highlimit;
> +       long delta;
> +       int exp_err;
> +};
> +
> +static int libc_adjtimex(void *timex)
>  {
> -       struct timex *bufp;
> -       int expected_errno = 0;
> +       return adjtimex(timex);
> +}
>
> -       /*
> -        * since Linux 2.6.26, if buf.offset value is outside
> -        * the acceptable range, it is simply normalized instead
> -        * of letting the syscall fail. so just skip this test
> -        * case.
> -        */
> -       if (nr > 3 && (tst_kvercmp(2, 6, 25) > 0)) {
> -               tst_res(TCONF, "this kernel normalizes buf."
> -                               "offset value if it is outside"
> -                               " the acceptable range.");
> -               return;
> -       }
> +static int sys_adjtimex(void *timex)
> +{
> +       return tst_syscall(__NR_adjtimex, timex);
> +}
> +
> +static struct test_case tc[] = {
> +       {
> +       .modes = SET_MODE,
> +       .exp_err = EFAULT,
> +       },
> +       {
> +       .modes = ADJ_TICK,
> +       .lowlimit = 900000,
> +       .delta = 1,
> +       .exp_err = EINVAL,
> +       },
> +       {
> +       .modes = ADJ_TICK,
> +       .highlimit = 1100000,
> +       .delta = 1,
> +       .exp_err = EINVAL,
> +       },
> +       {
> +       .modes = ADJ_OFFSET,
> +       .highlimit = 512000L,
> +       .delta = 1,
> +       .exp_err = EINVAL,
> +       },
> +       {
> +       .modes = ADJ_OFFSET,
> +       .lowlimit = -512000L,
> +       .delta = -1,
> +       .exp_err = EINVAL,
> +       },
> +};
> +
> +static struct test_variants
> +{
> +       int (*adjtimex)(void *timex);
> +       char *desc;
> +} variants[] = {
> +       { .adjtimex = libc_adjtimex, .desc = "libc adjtimex()"},
> +
> +#if (__NR_adjtimex != __LTP__NR_INVALID_SYSCALL)
> +       { .adjtimex = sys_adjtimex,  .desc = "__NR_adjtimex syscall"},
> +#endif
> +};
> +
> +static void verify_adjtimex(unsigned int i)
> +{
> +       struct timex *bufp;
> +       struct test_variants *tv = &variants[tst_variant];
>
>         *buf = *tim_save;
>         buf->modes = SET_MODE;
>         bufp = buf;
> -       switch (nr) {
> -       case 0:
> -               bufp = (struct timex *)-1;
> -               expected_errno = EFAULT;
> -               break;
> -       case 1:
> -               buf->tick = 900000 / hz - 1;
> -               expected_errno = EINVAL;
> -               break;
> -       case 2:
> -               buf->tick = 1100000 / hz + 1;
> -               expected_errno = EINVAL;
> -               break;
> -       case 3:
> -               /* Switch to nobody user for correct error code collection */
> -               ltpuser = SAFE_GETPWNAM("nobody");
> -               SAFE_SETEUID(ltpuser->pw_uid);
> -               expected_errno = EPERM;
> -               break;
> -       case 4:
> -               buf->offset = 512000L + 1;
> -               expected_errno = EINVAL;
> -               break;
> -       case 5:
> -               buf->offset = (-1) * (512000L) - 1;
> -               expected_errno = EINVAL;
> -               break;
> -       default:
> -               tst_brk(TFAIL, "Invalid test case %u ", nr);
> +
> +       if (tc[i].exp_err == EINVAL) {
> +               if (tc[i].modes == ADJ_TICK) {
> +                       if (tc[i].lowlimit)
> +                               buf->tick = tc[i].lowlimit - tc[i].delta;
> +
> +                       if (tc[i].highlimit)
> +                               buf->tick = tc[i].highlimit + tc[i].delta;
> +               }
> +               if (tc[i].modes == ADJ_OFFSET) {
> +                       if (tc[i].lowlimit) {
> +                               tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
> +                               return;
> +                       }
> +                       if (tc[i].highlimit) {
> +                               tst_res(TCONF, "this kernel normalizes buf. offset value if it is outside the acceptable range.");
> +                               return;
> +                       }
> +               }
>         }
>
> -       TEST(adjtimex(bufp));
> -       if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
> -               tst_res(TPASS | TTERRNO,
> -                               "adjtimex() error %u ", expected_errno);
> -       } else {
> -               tst_res(TFAIL | TTERRNO,
> -                               "Test Failed, adjtimex() returned %ld",
> -                               TST_RET);
> +       if (tc[i].exp_err == EFAULT) {
> +               if (tv->adjtimex != libc_adjtimex) {
> +                       bufp = (struct timex *) -1;
> +               } else {
> +                       tst_res(TCONF, "EFAULT is skipped for libc variant");
> +                       return;
> +               }
> +       }
> +
> +       TEST(tv->adjtimex(bufp));
> +
> +       if (tc[i].exp_err != TST_ERR) {
> +               tst_res(TFAIL | TTERRNO, "adjtimex(): expected %s mode %x",
> +                                       tst_strerrno(tc[i].exp_err), tc[i].modes);
> +               return;
>         }
>
> -       /* clean up after ourselves */
> -       if (nr == 3)
> -               SAFE_SETEUID(0);
> +       tst_res(TPASS, "adjtimex() error %s", tst_strerrno(tc[i].exp_err));
> +
>  }
>
>  static void setup(void)
>  {
> +       struct test_variants *tv = &variants[tst_variant];
> +       size_t i;
> +       int expected_errno = 0;
> +
> +       tst_res(TINFO, "Testing variant: %s", tv->desc);
> +
>         tim_save->modes = 0;
>
> +       buf->modes = SET_MODE;
> +
> +       /* Switch to nobody user for correct error code collection */
> +       ltpuser = SAFE_GETPWNAM("nobody");
> +       SAFE_SETEUID(ltpuser->pw_uid);
> +       expected_errno = EPERM;
> +
> +       TEST(tv->adjtimex(buf));
> +
> +       if ((TST_RET == -1) && (TST_ERR == expected_errno)) {
> +               tst_res(TPASS, "adjtimex() error %s ",
> +                               tst_strerrno(expected_errno));
> +       } else {
> +               tst_res(TFAIL | TTERRNO,
> +                               "adjtimex(): returned %ld", TST_RET);
> +       }
> +
> +       SAFE_SETEUID(0);
> +
>         /* set the HZ from sysconf */
>         hz = SAFE_SYSCONF(_SC_CLK_TCK);
>
> -       /* Save current parameters */
> -       if ((adjtimex(tim_save)) == -1)
> +       for (i = 0; i < ARRAY_SIZE(tc); i++) {
> +               if (tc[i].modes == ADJ_TICK) {
> +                       tc[i].highlimit /= hz;
> +                       tc[i].lowlimit /= hz;
> +               }
> +       }
> +
> +       if ((adjtimex(tim_save)) == -1) {
>                 tst_brk(TBROK | TERRNO,
> -                       "adjtimex(): failed to save current params");
> +               "adjtimex(): failed to save current params");
> +       }
>  }
>
>  static void cleanup(void)
>  {
> +
>         tim_save->modes = SET_MODE;
>
> -       /* Restore saved parameters */
> -       if ((adjtimex(tim_save)) == -1)
> -               tst_res(TWARN, "Failed to restore saved parameters");
> +       if ((adjtimex(tim_save)) == -1) {
> +               tst_brk(TBROK | TERRNO,
> +               "adjtimex(): failed to save current params");
> +       }
>  }
>
>  static struct tst_test test = {
> -       .needs_root = 1,
> -       .tcnt = 6,
> +       .test = verify_adjtimex,
>         .setup = setup,
>         .cleanup = cleanup,
> -       .test = verify_adjtimex,
> +       .tcnt = ARRAY_SIZE(tc),
> +       .test_variants = ARRAY_SIZE(variants),
> +       .needs_root = 1,
>         .bufs = (struct tst_buffers []) {
> -               {&buf, .size = sizeof(*buf)},
> -               {&tim_save, .size = sizeof(*tim_save)},
> -               {},
> -       }
> +                {&buf, .size = sizeof(*buf)},
> +                {&tim_save, .size = sizeof(*tim_save)},
> +                {},
> +               }
>  };
> --
> 2.17.1
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
