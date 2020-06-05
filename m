Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649E1EF5B0
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 12:50:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DE543C2F67
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 12:50:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3600D3C2F5D
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 12:50:24 +0200 (CEST)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 990E61B601BC
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 12:50:23 +0200 (CEST)
Received: by mail-lf1-x143.google.com with SMTP id x22so5533049lfd.4
 for <ltp@lists.linux.it>; Fri, 05 Jun 2020 03:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6PBqcu4dVcPaFrw4BGh+fD0tEbF0DBVHcXKAqEgRwQ=;
 b=wJA8AXXEALmx6h3BWpbD9/vkieuXWksBsDZWq9Pl2uDeXenuSDoa0dznCTcn+aMeH1
 FDIoPzENIOa7kle1EeAj9gaWffiLBBFmuAngkJioqKpQekFVlm6P0k9pkF5h2JIR5qAg
 1sndcEZykPljB5wOYiMZa+ML8HJ98KRc/fLqhiZketrr8WCL5b5gk0CKHY8OgGK0JirH
 SrOXZPgxeIIZZEuIxfWlJIeUu9CUFvtJLJQaSXgkyiNvFiZil1NumLc9kpGLuzKLh/dq
 J6IaWNL2ex89PXCoVGoLet+kf9ulu9/9GpwsVhF0mQYfKxQVU9ZnK6wCSQlm89kVsN4s
 gSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6PBqcu4dVcPaFrw4BGh+fD0tEbF0DBVHcXKAqEgRwQ=;
 b=hBt6DZs8gLidf9Js7PJ7IoDfW/zclVj97DZjRAr1JJwLTG+4+NLF6tYRkaScidTQqd
 vhe4Ox+RmOemVmQ7Ea+1kBmBsAcUXHc7Yn+cMxjY3BHCnIZR8fwFlEigQkhT3fGumPaj
 4MDLg5YFNG/xb5dMFrqB5epjkST+YhZhMea9sKi/Mnyz96WMvxqL9M0+2VSac4WXWzKA
 P2EpvRs0ixjeedH+9sFl1CA+09e8g7hsUAjWxz/nYOUAUX3G1CnuJprfHoBr/xCCR/S+
 XUGBfOhxCUFagqC5IcoWi35Ppb7YpgvzBZlqmOoEHKvg/3tp1WSCw4MnTmS36x7qQSId
 WS2Q==
X-Gm-Message-State: AOAM532UtV4FqEEhSdh0SLC1x4wVfUvK30uApe0+RNAjnPBz6uNTm3S5
 i7uEQSZBZvC0BrE37mv7uJ2hpl1509d7JTH7Co3gBw==
X-Google-Smtp-Source: ABdhPJzOJiojtwmNr5SOMrlaeXW50qJdj5r2rISr3n1YjgPpD4saq3YvUGnbwmqz/JJwarjnkhdVjFMdX/8wIL2olCA=
X-Received: by 2002:ac2:55b2:: with SMTP id y18mr5064475lfg.55.1591354222649; 
 Fri, 05 Jun 2020 03:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYuGwcE3zyMFQPpfA0CyW=4WOg9V=kCfKhS7b8930jQofA@mail.gmail.com>
 <203212099.14886500.1591345676708.JavaMail.zimbra@redhat.com>
In-Reply-To: <203212099.14886500.1591345676708.JavaMail.zimbra@redhat.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 5 Jun 2020 16:20:10 +0530
Message-ID: <CA+G9fYv=2xqP0ue69jk-xMa7VRwg0dOm14TqkNUazsqvxbU0_A@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP: syscalls: regression on mainline - ioctl_loop01
 mknod07 setns01
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
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>,
 open list <linux-kernel@vger.kernel.org>,
 Richard Palethorpe <rpalethorpe@suse.com>, lkft-triage@lists.linaro.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Martijn Coenen <maco@android.com>,
 Christoph Hellwig <hch@lst.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 5 Jun 2020 at 13:58, Jan Stancek <jstancek@redhat.com> wrote:
>
>
>
> ----- Original Message -----
> > Following three test cases reported as regression on Linux mainline kernel
> > on x86_64, arm64, arm and i386
> >
> >   ltp-syscalls-tests:
> >     * ioctl_loop01
> >     * mknod07
>
> Test updated:
>   https://github.com/linux-test-project/ltp/commit/13fcfa2d6bdd1fb71c4528b47170e8e8fb3a8a32

ack.

>
> >     * setns01
>
> commit 303cc571d107 ("nsproxy: attach to namespaces via pidfds")
> changed errno that is returned for regular file from EINVAL to EBADF.
> This appears to fit more current man page, so I think we need to fix
> test to accept both. (I'm looking into that)

Thanks for investigating these failures.

 - Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
