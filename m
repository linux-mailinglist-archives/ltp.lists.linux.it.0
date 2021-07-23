Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9043D3A2B
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:25:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9A0E3C6FF6
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:25:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E487C3C074D
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:25:28 +0200 (CEST)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 4AFF4201026
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:25:28 +0200 (CEST)
Received: by mail-ot1-x32b.google.com with SMTP id
 z6-20020a9d24860000b02904d14e47202cso1862998ota.4
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aRUskXGznymjiPhSPPZyhJYIsZLMytqVDg3CZ0gajkI=;
 b=dQT4tlqWkatDtLUgzzl1zSN7dtH3n39/QVn66bgkMWjc4p4kY16tD9Z7zhPTivaasa
 7y01sspGAtEP4d6tZIeP+GIe5MUv9rZabiNNQAVz0Cu0n9uT5ujG9tjFJ/nc395mfYr9
 A7FqOZ9iRlG+x8bEzf2bS/V8cpKblV4LD8owGUBU2xbHck5etFryu5ohz9hc+83Yuxfr
 I4uGojvb471OrMlDLn+pofsiy1wXFRdvYIk0OReuw5lCiNFCmspq0OOBeiJ0fWGLv/hT
 V+24BgzruN5ybwF4UWCV3oHEKgKwCSTGT8YAwM+HbLs85kZQsyUNjP662kQyyjbcunI0
 Bfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aRUskXGznymjiPhSPPZyhJYIsZLMytqVDg3CZ0gajkI=;
 b=TMdjDae0Npejm6EmfClZMJqu08W4v45EAl9dZbDmDlAeJKDhD5AA9W4Om4Ldg22QTt
 VCtib9Q9eo5VLPovJw1AUQVLb77UMZ7QD0DkAiDsvnfafooq/REFN2geLzfumIZZrWz5
 zMQ8oDdz+kUy9yUkhIVK+Dho2AFvprEHJNi+MNl0SNiz0YM1tEgYY0R+FCTtIV3BbRM2
 wGJpvHImoZ/W5s6bZU7kx4Ru9h3gbjOXWKlzOtnTd3BhtZJ6B05q6BeNuqCEiuo7e/jH
 7o5bg5LzYjsP4EpFVa7uSiYTM1pJHL6yEpvHQ0M6gyx3gauZzieJ6vdSmG+4A4nwGkve
 jNBg==
X-Gm-Message-State: AOAM531fYhepSEhJjDZH46T9phrp64zyJS8fvULMO2MI7gy+X2wvURkF
 ZeQK/31ilO9dXaHNERKUmjdLL/HeG4HO5Us4a38Z6Q==
X-Google-Smtp-Source: ABdhPJwXTpo12ME8GoDOuTPYTK33J28upzzgQJgLGzW+l1l5KobGs/3ySmoblDwwcR5fo1Pd7kAxk7/KUCLFlb24NBQ=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr2911795otb.281.1627043126908; 
 Fri, 23 Jul 2021 05:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210722155628.371356843@linuxfoundation.org>
 <CA+G9fYt_9nfDcQzKm8SZtmQXzzrybutS9vD4GgUw_0o8UD1HOQ@mail.gmail.com>
 <YPqwF7wtM6n3wHlr@kroah.com>
In-Reply-To: <YPqwF7wtM6n3wHlr@kroah.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 23 Jul 2021 17:55:15 +0530
Message-ID: <CA+G9fYvjgkaQxdW52sMzQm73f2xJreQzrPiCV48qD+5EN-b0Kw@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5.13 000/156] 5.13.5-rc1 review
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 patches@kernelci.org, linux-block <linux-block@vger.kernel.org>,
 linux-stable <stable@vger.kernel.org>, Pavel Machek <pavel@denx.de>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jon Hunter <jonathanh@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 23 Jul 2021 at 17:33, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jul 23, 2021 at 05:26:22PM +0530, Naresh Kamboju wrote:
> > On Thu, 22 Jul 2021 at 22:17, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 5.13.5 release.
> > > There are 156 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Sat, 24 Jul 2021 15:56:00 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.13.5-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.13.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > The following error is due to SATA drive format failing with arm64 64k-page
> > size ( CONFIG_ARM64_64K_PAGES=y ) kernel.
> > while running LTP syscalls test suite on running 5.13.3 and 5.13.5-rc1 kernel.
> >
> > First it was noticed on the stable-rc 5.13.3-rc2 kernel.
> >
> > Whereas 64bit kernel and 32bit kernel pass with 4K page size.
> >
> > Initially, I thought it could be a Hard drive fault but it is reproducible on
> > other devices but not always. Which is a blocker to bisect the problem.
> >
> > The steps to reproduce:
> >  - Boot arm64 juno device with 64k page stable-rc 5.13 kernel Image [1]
> >    - CONFIG_ARM64_64K_PAGES=y
> >  - format connected SATA drives and mount /scratch
> >  - Use the mounted /scratch for LTP runs to create and delete files from this
> >  - cd /opt/ltp
> >  - ./runltp -d /scratch -f syscalls
>
> And does that also fail for 5.13.2?

Yes. It failed on 5.13.2 also.

Ref failed log:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.13.y/build/v5.13.2/testrun/5147287/suite/ltp-syscalls-tests/test/copy_file_range01/log

- Naresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
