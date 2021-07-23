Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B6D3D39ED
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:03:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 398C83C950C
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 14:03:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 286283C58B2
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:03:42 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 36D991A0149C
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 14:03:41 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDE8360ED4;
 Fri, 23 Jul 2021 12:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627041819;
 bh=PwjtfCTo8tHsPYPLNc6oR+NsanQdP6K5wpoC58YhcD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWOOfsfzvJ7ztmEmEZDPGApUZaC7JkdjD65E2rZZD6219b0QDxn0mPZdfJl5VrviB
 nE4o7MF7oxSimILe2n9LYnzMusBjsyjSiMh6o2iJIs5T5odKEZtfy1BDTuqptC0dAZ
 F3l8kI2YE4CJq5sD1AQtS/sbkLVseyZ4B8wGIA5g=
Date: Fri, 23 Jul 2021 14:03:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <YPqwF7wtM6n3wHlr@kroah.com>
References: <20210722155628.371356843@linuxfoundation.org>
 <CA+G9fYt_9nfDcQzKm8SZtmQXzzrybutS9vD4GgUw_0o8UD1HOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+G9fYt_9nfDcQzKm8SZtmQXzzrybutS9vD4GgUw_0o8UD1HOQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
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

On Fri, Jul 23, 2021 at 05:26:22PM +0530, Naresh Kamboju wrote:
> On Thu, 22 Jul 2021 at 22:17, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 5.13.5 release.
> > There are 156 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 24 Jul 2021 15:56:00 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.13.5-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.13.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> The following error is due to SATA drive format failing with arm64 64k-page
> size ( CONFIG_ARM64_64K_PAGES=y ) kernel.
> while running LTP syscalls test suite on running 5.13.3 and 5.13.5-rc1 kernel.
> 
> First it was noticed on the stable-rc 5.13.3-rc2 kernel.
> 
> Whereas 64bit kernel and 32bit kernel pass with 4K page size.
> 
> Initially, I thought it could be a Hard drive fault but it is reproducible on
> other devices but not always. Which is a blocker to bisect the problem.
> 
> The steps to reproduce:
>  - Boot arm64 juno device with 64k page stable-rc 5.13 kernel Image [1]
>    - CONFIG_ARM64_64K_PAGES=y
>  - format connected SATA drives and mount /scratch
>  - Use the mounted /scratch for LTP runs to create and delete files from this
>  - cd /opt/ltp
>  - ./runltp -d /scratch -f syscalls

And does that also fail for 5.13.2?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
