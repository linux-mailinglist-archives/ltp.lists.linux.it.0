Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 600BD2647CB
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:14:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2C4413C527B
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 16:14:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id E3FF13C224B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:14:15 +0200 (CEST)
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B76C1A0091E
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 16:14:15 +0200 (CEST)
Received: by mail-il1-x144.google.com with SMTP id y2so5788223ilp.7
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cU4yBn+KidPv+jYpE7/R850zCRkIGVzzcGkT2yZSSVk=;
 b=L92rI90QdQXjsv3MmwyqXZYgAY5tHQrGyZ3l6i+YFXZgznCD2YcHFHixRfrv0NnTmw
 MYkHw1VAHs1dxTaiGCEO9OnrCjBpbWSFykA40cYlAntQEyW8GRrSkiL0GW2BK2/xPMxD
 v24EqN1Gt9qyTHZ+6qGCeOTcpabEMcDHO4UJ9ihB2ZhsLqeoaAknbpcpJaloyBafQgRD
 Vshr2tlIUufXBqYtZOTM1KVUQ0kVocqyBCs0zf4YwTLJ/whF9haCKSI43d//0DsNtZzC
 86tyU7kEZ389U38b+Eby0bQLtsSOxcpm15NZV+f6Mdv5FaFB3zZ+mTpAIAYG9ETknfaY
 3xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cU4yBn+KidPv+jYpE7/R850zCRkIGVzzcGkT2yZSSVk=;
 b=mo59u2wttf8EdY26plHJ98uzcKd5cQ9GwftKjuhgdzyHGr3By5Qd1BB1nx9OJLI/up
 jqrqoFnBW4PVx+izdasW+KhQNrgqaDfaGK6r8DSdkM9uyJOV7i4QZK5ZeaBqI8I+naIq
 cjZrFF0FJh3DR+l2gZNONTXzgfAeb++vR9sLU3teRgVH9UvVumPhgQ4dVnIdhbRECORY
 CXPzKgDkTMIoA4lpvOHYhKIuY7f9ECI3Ksc0EVhPoQ0OWeRDSNWMGjmoJ7lIF8fESJJb
 NNeIrEnzFQfnhATmi5GnnzTCw8zveYMzoijBY6JCoVWByYtwYJrvkkl7rHLvtqpR4Gh/
 rkKQ==
X-Gm-Message-State: AOAM531FuA6Xp4MEmznYfIps68NTnOWRL45B3I2hMr84QXh2DozKsY9r
 UuZbFFnGHo7oA4k0EhO8I3rDyiurHfcw0gJxcMI=
X-Google-Smtp-Source: ABdhPJxo1wx55qTFAGRh5eqouiL7lMwDCbnSIDK5KvtrsKZPidULE+stHSGIhtP7I+9+PnMki0aZ7VLwNSkxd6ixly0=
X-Received: by 2002:a05:6e02:1141:: with SMTP id
 o1mr7853246ill.275.1599747254196; 
 Thu, 10 Sep 2020 07:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200910121628.18505-1-pvorel@suse.cz>
In-Reply-To: <20200910121628.18505-1-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 10 Sep 2020 17:14:03 +0300
Message-ID: <CAOQ4uxhshKD-gCuW94cvKee8W==Y6y6TNyEJmxifEagxs1BhOA@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] fanotify10: Treat ignore mask bug as TCONF
 for < v5.9
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
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Sep 10, 2020 at 3:16 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi Amir,
>
> based on suggestion http://lists.linux.it/pipermail/ltp/2020-September/018891.html,
> but not really sure if it should be applied, because we loose warning:
>
> HINT: You _MAY_ be missing kernel fixes, see:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9bdda4e9cf2d
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f02fd3fa13e
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=497b0c5a7c06
>

I think your change is fine, because this warning would only send poor
stable kernel maintainers on a quest to find a patch to backport, which IMO
is not going to end with a fix.

The situation with ignored mask logic is that it was broken or not properly
defined from day 1 of fanotify, so people are probably using ignored mask
only in the very basic combinations.

Lately, along with FAN_MARK_FILESYSTEM and related work, more
opportunities for using ignored mask have materialized and many old bugs
have surfaced.

But I'm afraid it will not be feasible to backport all the fixes, so
once the ignored
logic settles (there are still several bugs left) I will try to
properly document
what is expected to work in which kernel and will update the man page
BUGS section.

Jan,

Please let me know if we are on the same page in that regard.

Thanks,
Amir.

> Kind regards,
> Petr
>
>
>  testcases/kernel/syscalls/fanotify/fanotify10.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/fanotify/fanotify10.c b/testcases/kernel/syscalls/fanotify/fanotify10.c
> index 2c4401f61..5b4591b4a 100644
> --- a/testcases/kernel/syscalls/fanotify/fanotify10.c
> +++ b/testcases/kernel/syscalls/fanotify/fanotify10.c
> @@ -508,8 +508,8 @@ static void test_fanotify(unsigned int n)
>                                         "zero length read from fanotify fd");
>                         }
>                         if (ret > 0) {
> -                               tst_res(TFAIL, "group %d (%x) with %s and "
> -                                       "%s ignore mask got event",
> +                               tst_res((tst_kvercmp(5, 9, 0)) < 0 ? TCONF : TFAIL,
> +                                       "group %d (%x) with %s and %s ignore mask got event",
>                                         i, fanotify_class[p], mark->name, ignore_mark->name);
>                                 if (event->fd != FAN_NOFD)
>                                         SAFE_CLOSE(event->fd);
> --
> 2.28.0
>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
