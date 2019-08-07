Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A11846F1
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 10:16:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2F6803C1D78
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Aug 2019 10:16:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 02A733C1CDE
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 10:16:41 +0200 (CEST)
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 47323201095
 for <ltp@lists.linux.it>; Wed,  7 Aug 2019 10:16:40 +0200 (CEST)
Received: by mail-vk1-f193.google.com with SMTP id 130so17904268vkn.9
 for <ltp@lists.linux.it>; Wed, 07 Aug 2019 01:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nmR/aRt/7w3kh6Vv50BpVC8rKO4EAX+1CcgjPsPbn5U=;
 b=T3bkRfmlN+3Jzj20xQE1aCvhvkF2hAPHvKz3Y1/9QpZ6rg4L5KM+rGo4B8p/ciah6a
 c7Y5Dk1rJRIWRRuN8z4u5HVCHbRYKnXn5CaOxbesa4645MPhSxMLz/KxMsADkuGfWHvQ
 2TiODoG81E6BghvzL+xQ55WJvpclv3Fk8YC+KiOeQPqrdaM8sD2N/1h9a0HvpSgKm8Yu
 2ZgXDKhvGLk9TeBgeTCB3XObj0aemPVT7e6Yzy5pz+PQLcDBtq2JPj5Bltt19HyrL8Vs
 mlsnZd0re5En2R7zQWsQjz29UyTvhr7pXMF8BhlrmIQImqMm+PwCJa0VYUeh98LtfClV
 SdcQ==
X-Gm-Message-State: APjAAAU15/ZSMjmaBZiaFkeyNVmWfvHOl77SPhD5c/zcr75zlG90ksgy
 psPfiPCQ0PLFn55t9oM+MPUEiVSknkg2VfkjDB6+LQ==
X-Google-Smtp-Source: APXvYqy/ylNUV3ZgKKUPSKj8kIOvHEoHaJlboYbXwkPv10ja4wfpmpavd7t7COAWzi7EDfBCtl0jf4PGc+uGO6W4NxE=
X-Received: by 2002:a1f:3dc1:: with SMTP id k184mr119717vka.24.1565165799090; 
 Wed, 07 Aug 2019 01:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <76fa74b68aa0794f58e01d5794fffa3a02df0203.1565089789.git.jstancek@redhat.com>
In-Reply-To: <76fa74b68aa0794f58e01d5794fffa3a02df0203.1565089789.git.jstancek@redhat.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 7 Aug 2019 16:16:28 +0800
Message-ID: <CAEemH2e+qQuEXht_JPQdx+LrG7V3FWRZG6rPO8LGOcNVorC71Q@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] clock_getres01: pass non-NULL res as parameter
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jan,

On Tue, Aug 6, 2019 at 7:11 PM Jan Stancek <jstancek@redhat.com> wrote:
>
> Since commit a9446a906f52 ("lib/vdso/32: Remove inconsistent NULL pointer checks")
> VDSO treats NULL parameter differently than in syscall.
>
> Pass valid pointer. Subsequent patch will add test variants that test NULL
> res parameter using syscall.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>  testcases/kernel/syscalls/clock_getres/clock_getres01.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/testcases/kernel/syscalls/clock_getres/clock_getres01.c b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> index 15f32310839a..6b556965530e 100644
> --- a/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> +++ b/testcases/kernel/syscalls/clock_getres/clock_getres01.c
> @@ -28,7 +28,7 @@ static struct test_case {
>         {"MONOTONIC", CLOCK_MONOTONIC, &res, 0, 0},
>         {"PROCESS_CPUTIME_ID", CLOCK_PROCESS_CPUTIME_ID, &res, 0, 0},
>         {"THREAD_CPUTIME_ID", CLOCK_THREAD_CPUTIME_ID, &res, 0, 0},
> -       {"REALTIME", CLOCK_REALTIME, NULL, 0, 0},
> +       {"REALTIME", CLOCK_REALTIME, &res, 0, 0},

If we change NULL to &res, it will be a duplicate of the first case.
So my suggest here is to remove it directly, since patch2/2 has
already added variants to test NULL via syscall.

Otherwise, the patchset looks good.

>         {"CLOCK_MONOTONIC_RAW", CLOCK_MONOTONIC_RAW, &res, 0, 0,},
>         {"CLOCK_REALTIME_COARSE", CLOCK_REALTIME_COARSE, &res, 0, 0,},
>         {"CLOCK_MONOTONIC_COARSE", CLOCK_MONOTONIC_COARSE, &res, 0, 0,},
> --
> 1.8.3.1
>
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp



-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
