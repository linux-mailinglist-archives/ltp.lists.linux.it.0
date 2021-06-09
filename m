Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F903A1BFA
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76EE73CA889
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Jun 2021 19:38:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A644D3C3232
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:38:46 +0200 (CEST)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 49D3D10004AA
 for <ltp@lists.linux.it>; Wed,  9 Jun 2021 19:38:46 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id p17so38502533lfc.6
 for <ltp@lists.linux.it>; Wed, 09 Jun 2021 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dqnrBbezQWIEjAaZEpeY5dOW11h1b7h7fRiyxt/xnFc=;
 b=X2Phi9trk/Pv27QupDzIxtmwTkE5DYzePXJ4HaDo5WQ9i4Z52WTYjd+IAhb+gd4QxT
 813bQf80bjTsyCO5vpQqUhd+bKvW48QwEasgd4m01F4SKw4oN9eokXJQk8vBbd+lGNfO
 yKBzNOfdfPkfnhfj4MaXAClQthkdJMnbRwbV5heKZnriU89C9plhAS5CwhSOvLlgRmp+
 2eVzvDDkVzsPN1ipVGy0DVbw3Lqbcd0yNvmRDpBpwMiGdd8nHitCQ8KPqFFalX6CZAZP
 hBOzZLm5MqwCMH/HD/cziwa5UlO0HfrqMVs3E0wGQrYuhGcxLVhwwRRkhCRwA/YUT7Tc
 yEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqnrBbezQWIEjAaZEpeY5dOW11h1b7h7fRiyxt/xnFc=;
 b=udzKpUPyq16N8P9yFtSN+HsWOPggja/6G0uOXEvJhH45wD5w3zABhozg8bP9QIM2tQ
 8ggvrih1nN/Als8BFnGBEtifkg6GrHI+TQab7akjzl86fFRYJ57ge73m6PmRo0zL/phl
 HKLyiqmD4uxlKzFVuPItHf/gaNh8P6yKD54GD1ucyGC+4TarTHFOcHzbXFjXuYMmKtf1
 21I3KBt+afsas0gjcqpHdMGPwBBzlsR8zQ3ClSdwgic3Lx/w20L4puqI99g/L9X7Mgqc
 QBfaXApFHoOnSbevY3PndQb2fY2bekOXM9KuSMxIvB7IEzE0nq/bzxKwbuzJJn/URZDQ
 y2hQ==
X-Gm-Message-State: AOAM532re7igLYCRgWK0iI//0r4yPPguebKRDF/h8t9GwST/LZXDZz9X
 h4fznX2g/kpN13pj0zlBuaSMZQXQxclL45cuzAw=
X-Google-Smtp-Source: ABdhPJwZNIVYnZ3JiCFa8jDo/+0m7gTtFagHH985eoe5dL5n3EFIhrT0kMJIO8g4572alTMTzJ57DMI3jd7X8NwthfM=
X-Received: by 2002:ac2:44a9:: with SMTP id c9mr386422lfm.434.1623260325631;
 Wed, 09 Jun 2021 10:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
 <YL/Wf51Y6V5lRnkM@pevik>
In-Reply-To: <YL/Wf51Y6V5lRnkM@pevik>
From: Vinay Kumar <vinay.m.engg@gmail.com>
Date: Wed, 9 Jun 2021 23:08:34 +0530
Message-ID: <CANUMPcW3jQR431JtVdTvnd8v8c4KRt8VWOrJOjC-SnekJn0oxA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] getitimer02: Skipped EFAULT tests for libc
 variant.
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
Cc: metan@ucw.cz, Randy MacLeod <rwmacleod@gmail.com>,
 umesh kalappa0 <umesh.kalappa0@gmail.com>, ltp@lists.linux.it,
 vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

Sent v2 patches for review with suggested corrections.

>> In the text after blank line I'd mention EFAULT skipped on raw syscall.
>> It'd would deserve to mention why.

Yes, added the reason in the commit log of each test case.

>> Also, as test it's quite simple, it'd be nice, if you first convert it to new
>> API and in second commit added test variants.

getitimer02.c, getrusage02.c and setitimer02.c are updated to the new API.
Then added test variants. Remaining test cases are already updated
with the new API.

>> During rewrite you should remove #if !defined(UCLINUX) check as getitimer() is
>> supported on uclibc-ng.

Removed the same.

Regards,
Vinay

On Wed, Jun 9, 2021 at 2:13 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Vinay,
>
> > Tested EFAULT cases only for "__NR_getitimer" syscall.
> Well, you added testing raw syscall via test variant.
> That's IMHO the most important thing to mention.
>
> In the text after blank line I'd mention EFAULT skipped on raw syscall.
> It'd would deserve to mention why.
>
> Also, as test it's quite simple, it'd be nice, if you first convert it to new
> API and in second commit added test variants.
> During rewrite you should remove #if !defined(UCLINUX) check as getitimer() is
> supported on uclibc-ng.
>
> This apply to whole patchset (some tests are already ported to new API).
>
> Kind regards,
> Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
