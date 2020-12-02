Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C842CB53C
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 07:47:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C61AC3C2CDD
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 07:47:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3162D3C2BD7
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 07:47:43 +0100 (CET)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D66C3600D6D
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 07:47:42 +0100 (CET)
Received: by mail-io1-xd42.google.com with SMTP id z5so794541iob.11
 for <ltp@lists.linux.it>; Tue, 01 Dec 2020 22:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDCAyIeTmElReOQDIYG//yZQknMGT730IjsPNxDwp7c=;
 b=GgVBvF8aUwgWynnyB8mpFTtIiGi6s2jW4Rdog51x97ZS8i9jLrVOHCrPnmpNVkp0HU
 C6c65cwiSr5TNWLZwNtB4Q2ZMK/5BpF8XP4J2qHZxaVJpCtRAv1Myo2pmIm+McLRY9MC
 Wja90rRedQP5OCp4KO35rP9tFb2jXnEnMv4p5uUKIrm9LM+G8UNy+btJVPUlLaWTReom
 RYbBbfHqNJKCpnYX1QcriWhFuCzbj+hEyiXZjFElc8waLNLPVZZZFM9NO3TR3IHDRj21
 sfqEYdqKAxbZeKKsAT5uPTehMsI5RA3puOo/bEYnv3Z+wU+H9txZG/WFUDJlxsk9Ufcs
 ahRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDCAyIeTmElReOQDIYG//yZQknMGT730IjsPNxDwp7c=;
 b=RI5HILcxCMMdFkE29h8wckuKR1+1tSx91pCvfqH3zT5QbHQEIE9x3sySy/l6XK02V6
 YknQmR7DqVJV2NBYB/+b+gvHgVzpg76URRpUSQFLg9cP67WW4ICtA0/EHEjLCrZSxdMO
 s2URQ3MMGyQ+2wT4qtLxliYsH+FAPjh39igzZ8WP9scuQaQue3Ae6imndzIKEIwgc5wl
 s9RcD7q4vk/7VPsNzHzNEOJwFvCm/zjWjVBzX1L+CfgJreG6Fjay/ZAoLPHOn/occda/
 ilSZJCNGJoiLcsZbAv/u5LqpZhboJTigOykBY+u0UhCI0ffI700lxSN9KgypPrX8sKyj
 6MWA==
X-Gm-Message-State: AOAM531ihJn8ea8YYg4aUpbZ8JP6Q89kFjTSzduOwm7BqVIWs3ARNjj0
 jw8A4BF9zRE26nQflhQdUvRWN5TRu+sLojP1NPs=
X-Google-Smtp-Source: ABdhPJzWF/OQKcjyPPRGR+U9x7nM6Wv5GUVJUGYYSZMf9X9Mpv6xdL3ZCdajjrAWZZi37OBkzgmhjeW4VxhmKB2uLuk=
X-Received: by 2002:a02:a60a:: with SMTP id c10mr856737jam.123.1606891661671; 
 Tue, 01 Dec 2020 22:47:41 -0800 (PST)
MIME-Version: 1.0
References: <20201201174214.24625-1-pvorel@suse.cz>
In-Reply-To: <20201201174214.24625-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 2 Dec 2020 08:47:30 +0200
Message-ID: <CAOQ4uxhVu9YHMLj-YgosMPgvP1gNE=RpZPOWocuD0tGxGpj8GQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 00/10] Introduce SAFE_FANOTIFY_MARK() macro +
 cleanup
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

On Tue, Dec 1, 2020 at 7:42 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> Changes v4->v5:
> * Fix issue with "fanotify: Add helper for FAN_REPORT_FID support on fs"
>   on fanotify01 (unwanted skipping tests). FAN_REPORT_FID is now tested
>   both for general support in kernel with fanotify_init() and support on
>   tested filesystem in fanotify_mark().
>
> * Fix issue with FAN_MARK_FILESYSTEM (new commit "fanotify: Add helper
>   for mark support check").
>
> * Split "[v4,2/6] fanotify: Handle supported features checks in setup()"
>   into two commits:
>   fanotify: Add helper for access permission check
>   fanotify: Add helper for event support check
>   (easier to review).
>
> * Drop commit "[v4,5/6] fanotify: Check FAN_REPORT_{FID, NAME} support"
>   => IMHO not needed now, as there are {REQUIRE_,}FANOTIFY_FAN_REPORT_FID_ERR_MSG()
>   helpers which check for FAN_REPORT_FID. Or am I'm wrong and you need it
>   for your patchset?

You are right.
My patch set can and will use FANOTIFY_FAN_REPORT_FID_ERR_MSG.

>   There will be needed to add also helper for FAN_REPORT_NAME/FAN_REPORT_DIR_FID
>   for fanotify10.c (for kernels > 5.1 && < 5.9), but this is now covered by check
>   in create_fanotify_groups() and I don't want to block your patchset even more.
>   And this helper should eliminate a need for check in safe_fanotify_init().
>

My patch set grows another test case with FAN_REPORT_NAME to fanotify09
so it is more than fare to leave that last cleanup to me ;-)

Looking forward for the merge of your work.
Thanks!

Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
