Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 830483A6B08
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:55:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 53ECA3C7219
	for <lists+linux-ltp@lfdr.de>; Mon, 14 Jun 2021 17:55:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20EE33C2E47
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:55:29 +0200 (CEST)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A673C600672
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 17:55:28 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id h4so7048450lfu.8
 for <ltp@lists.linux.it>; Mon, 14 Jun 2021 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/KSxSllC4CwdyzkciILgS5mUZnOVTmV3l9eJClOIu4=;
 b=nO9um9iAhnt8MfVhXfzEOYmi/Akisusz28TQ236fb0VRIldYpo097kK/S9+ZuyyjwM
 GFD1Tb6xFm5WOGV+TJ2i556rUsNHBSIgY8olA+qOzeCZCdTcRM89iNwarrzcTG/RkQnK
 9lR6ydAHJVlG3qSdAovMFb/0MRkkAm9p5uw2UiMHrJ/tQbNKy/3j7WbodKTYMoilXLoa
 lgIGdK9T4R3ea1pS/vJqrd5ZV4aqUzx10cgTOs2/C4i3enNzU3e6jAZkmwZKPw4W2QD6
 Hht8RWS6/gflNL5fo4TLiSso8R7bLFqT5NJTzvaj5KD2kGQpnJddiScjwqLMabW/9x19
 vQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/KSxSllC4CwdyzkciILgS5mUZnOVTmV3l9eJClOIu4=;
 b=PJf9hb9ECwc6evUl7aHLn//1f2qW1rCv0UNz1Pie1pOeZDnX3cRO9pu6LWIUyVfM0L
 f4y4nkWIZpaKml9wTvVk3TBy7fEF1hIvDsHrJQ8m18oKf2YDQtXgNFLEmK08SviD1fcV
 VQZ4uN1h7seZ8Myzdv0/G6NxGUO/6oAfBtW7C6GVIQ04NtGFyhkaN/BHdx+gy+J5t/C2
 6763ySV64Z7NIdYHRvwDsCExpOv9BJyxFzu3A7pJdSBPL23shBBlcNO11NLTzR0mPJFe
 qARbYMyxQ9O00rhmq4ipXM847PKu4LS4SYqvmwUCMzVx/qMXPB+GCdqcdDVMmT8ncAO4
 2keg==
X-Gm-Message-State: AOAM531R+VDPoEzvKv9tF6+CH6RJ9d9R3h4p7GfvUxw2UDA7hWOnXrZ6
 hSl69SvkGy58l0HVkDv5TmrDBLZWaLm+DDm3tftyKoq+sMyVjA==
X-Google-Smtp-Source: ABdhPJwb6Fk5ykgIGxCufMbyHWuZsywMdqtG3YKOFzFx3AEtLoKBNcFfnelWQcAyxiBbX2OvR2NxmscWBGW2M7p72cI=
X-Received: by 2002:a19:f504:: with SMTP id j4mr12982777lfb.242.1623686127994; 
 Mon, 14 Jun 2021 08:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210609173601.29352-10-vinay.m.engg@gmail.com>
 <20210613174946.9804-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210613174946.9804-1-vinay.m.engg@gmail.com>
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Mon, 14 Jun 2021 21:25:16 +0530
Message-ID: <CANUMPcWrgeGYeUWg=zTYxwuMiXmTLDimX35=hH93wAJ0gO6t3w@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ipc/shmctl02: Make use of TST_EXP_FAIL()
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
Cc: metan@ucw.cz, vinay.kumar@blackfigtech.com,
 umesh kalappa0 <umesh.kalappa0@gmail.com>, Randy MacLeod <rwmacleod@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

Could you please review below test cases changes also,

semctl03.c
https://lists.linux.it/pipermail/ltp/2021-June/023116.html

shmctl02.c
https://lists.linux.it/pipermail/ltp/2021-June/023118.html
https://lists.linux.it/pipermail/ltp/2021-June/023166.html

Regards,
Vinay

On Sun, Jun 13, 2021 at 11:19 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
>
> In order to simplify the code a bit.
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  testcases/kernel/syscalls/ipc/shmctl/shmctl02.c | 17 ++---------------
>  1 file changed, 2 insertions(+), 15 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
> index b9a71722d..9841d3a86 100644
> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl02.c
> @@ -96,21 +96,8 @@ static void verify_shmctl(unsigned int i)
>                 return;
>         }
>
> -       TEST(tv->shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf));
> -
> -       if (TST_RET != -1) {
> -               tst_res(TFAIL, "shmctl() returned %li", TST_RET);
> -               return;
> -       }
> -
> -       if (TST_ERR == tc[i].error) {
> -               tst_res(TPASS | TTERRNO, "shmctl(%i, %i, %p)",
> -                               *tc[i].shm_id, tc[i].cmd, tc[i].buf);
> -               return;
> -       }
> -
> -       tst_res(TFAIL | TTERRNO, "shmctl(%i, %i, %p) expected %s",
> -               *tc[i].shm_id, tc[i].cmd, tc[i].buf, tst_strerrno(tc[i].error));
> +       TST_EXP_FAIL(tv->shmctl(*(tc[i].shm_id), tc[i].cmd, tc[i].buf),
> +               tc[i].error, "shmctl(%i, %i, %p)", *(tc[i].shm_id), tc[i].cmd, tc[i].buf);
>  }
>
>  static void setup(void)
> --
> 2.17.1
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
