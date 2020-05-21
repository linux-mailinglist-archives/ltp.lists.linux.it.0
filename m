Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C091DCDC1
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:12:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AD2653C4D36
	for <lists+linux-ltp@lfdr.de>; Thu, 21 May 2020 15:12:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1265D3C042D
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:12:08 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 159706006CF
 for <ltp@lists.linux.it>; Thu, 21 May 2020 15:11:43 +0200 (CEST)
Received: from mail-qk1-f177.google.com ([209.85.222.177]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MKt3r-1jLS8232gn-00LBgK for <ltp@lists.linux.it>; Thu, 21 May 2020
 15:12:07 +0200
Received: by mail-qk1-f177.google.com with SMTP id f13so7137640qkh.2
 for <ltp@lists.linux.it>; Thu, 21 May 2020 06:12:07 -0700 (PDT)
X-Gm-Message-State: AOAM53103fAxgeF7KxKjjwFh2sN3MRfnW2pgQZCg73P0Lz3BFeqte0D6
 Xg15g8XRL9+KZu12fawL4/+bws7p8OTuBvnD59E=
X-Google-Smtp-Source: ABdhPJyksM/sZG10n9xDOvb5SrzhtbhDBTBCeadiR39IL/w8OCnDpDWMA7rvdJ/A6Vu6fWQWM1qUYwmNiazZvco2L0s=
X-Received: by 2002:ae9:ed95:: with SMTP id c143mr9873793qkg.394.1590066726593; 
 Thu, 21 May 2020 06:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
In-Reply-To: <5a10d33509ac73c26b233ab72c579f44386d0a55.1590057824.git.viresh.kumar@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 15:11:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2yN+AwWP-BdiPg+NkyB5z00jXoSt4vQCzPJfzWpZvW6w@mail.gmail.com>
Message-ID: <CAK8P3a2yN+AwWP-BdiPg+NkyB5z00jXoSt4vQCzPJfzWpZvW6w@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:KFXqKfO5hKivNi1EpHZDVnABzf343xlNyIFaLOLIKmROfUUo2lH
 PGLSPxwTplIYcdiNuUFC8fDScQwvGljQqPiqn9ZT+3F5MWJkGsPpgJ6pXGTvg6th6W0xSPk
 eaR8oZlOP8x+uuoFPCwwNjJcNZf9gJesBNKokoYvRKWBwO/ETbbbxTVp+JNR8+qc2CC2eO1
 rmCQEFxeR2WIM0ggOdtpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:e4NJBCkJvRc=:FK7Qhrs3ZHnN1Oz1q11m5M
 ZglDxe9sMhxAw+0K8pXEh78eEGPtqFQ6lPA6KFAVxIucDAWdCBnXZ2j9i924i8mQxcsjvaDI5
 0gXTELL3VSBHzKTgcE3G9qG7Kbp2GNE4EDtx5kABxlh/ZFMO9Kc2WaTybCZAOZWeiJrBI7Geq
 SNlyikz7V01CWDwM5RbrFxs/Mxp/6QvCK+MMezq3ltlZCUXlujZ6Gs92t7jjmmJcXrNHCY1jt
 4yj65WFkKAqIWqSwciT+/brQP6zsP2Ob0zUiXHosJNCq6gtq7I588INrby7Tt9jbhY1qLUbr4
 sP/zWf9YmzEWKkyt3kmU8jNnN5Obk8FRup8kuE0oA4r8WzfLHtRE2GbAdJR12zC+cnWhseevc
 CV4aOp4BVQpAQKNAxmFxH54zSeZ1MTjsyFuxyG/cv3eBzuzd0S/qZ3Wcen/8kTCdD84fSb44C
 dJCOqv11Xu4thoJmzQEpgAAvvrB2PmBpjqwsiH4icTxmpcxUOtPQt91HKz6rlHUZ00CVA661v
 RXjqZHAJf0P1fZUXJGXSTw9O/gG4hIdPEOcbFQhoKJDCLlhrunq2wKX6v8ehorQTqgfz1HJsx
 M19IuIJIU88fKPdpFVF21Jc6SAlmWQe5vZD9dKDkdUNpshHYI9WYshX1shkWNgn6ZfvtLYljo
 DvCL8sEQCWZOZMjf4+hCvt/qWHqDnF+8VPRGL+Vf0mZgvia3/8cLrithzXBh6mJZGFiUfcumK
 gI24GYBGBEgaLtV0lyHN0qCROPCHM078XTIwRfjVEMQkodRIKSAyyTZ5Nkt7cHyysjXu322w6
 yKKOM6pwPKfGW8WqTI4M+akItNN5kBxDfhnMzh4+gNMwIDuC04=
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/5] include: Add declaration of struct ipc64_perm
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, May 21, 2020 at 12:47 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> This adds declaration of struct ipc64_perm, which will be used by
> following patches.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Like the other structures, there are multiple definitions in the kernel:

$ git grep ^struct.ipc64_perm
arch/parisc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
arch/powerpc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
arch/s390/include/uapi/asm/ipcbuf.h:struct ipc64_perm
arch/sparc/include/uapi/asm/ipcbuf.h:struct ipc64_perm
arch/xtensa/include/uapi/asm/ipcbuf.h:struct ipc64_perm
include/uapi/asm-generic/ipcbuf.h:struct ipc64_perm

Any reason you can't just #include <asm/ipcbuf.h> to get the
kernel's definition for the correct architecture?

        Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
