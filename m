Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451754A16E
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 23:31:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2CD43C9434
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jun 2022 23:31:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2F0A83C895D
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 23:31:20 +0200 (CEST)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 85CB76008B4
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 23:31:19 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 r123-20020a1c2b81000000b0039c1439c33cso3778426wmr.5
 for <ltp@lists.linux.it>; Mon, 13 Jun 2022 14:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=bWRXKgPnhqxfXZsvcuTBnjVrWKn7V7LNUx8GhgEu6SA=;
 b=a9pjcH+aJw04uuHwmBhhHJWBULeRIbSUYxUsnCGgxCs9/h5IvQCVHbzQUG2ZDUzeUW
 Vbird6TunscmhTt8XCtIra+01BL9I4TLmSay99xMj6DuIP44uOhh6CBm+cXZ3/8A9PoL
 QbAfoL+P0Pt/8qFs0INfU08VuyAzdoaL7E/qPJd/IvOO97K8GMyHcorLOkDjzQQtIkd6
 aCZD/S38P+v9fUR2+ZYuZXNHa81l8uU8kRmTTPtbISS289pSQ+BdxKlWqzYiK+Bhg3ir
 bKGN/2dJQLcJduToCkr0G5rDPEgBW5fCvztK/+EdivgRg0jWter4bj8cyBnvaVqp2bBB
 CfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=bWRXKgPnhqxfXZsvcuTBnjVrWKn7V7LNUx8GhgEu6SA=;
 b=AKbxRsYzpSqF1MROyS23SOnrUlaqEZAQ4Jc0yzeD4OJL0wEZMsLdgrJd57cV2w8tcZ
 BHWP2bJzkbG6+c1rwHUFg5IYlV5rOOoSh0QqqfchAkf2BGTqIeXBxdNWHp6IGuwAGLzB
 aq2P6Y45qEkdpyxizrPTLtHJWlaiMZZbp7oB53lgW9AGpoFHjloehuQqoGr5b6Lgq4uM
 IMWiUQ2YIJylL82ipWTCMsO2Dp9XebPJpwVPBuMCad18nrTEcwMwjheFZHjhAEq0lQfD
 Sis7ZkeQ5IV3MG8aeAqdCOONuGV6kqN8zWrIovyr+PTEwrFweFBYe+YZio4bg/dOQSsM
 CPxQ==
X-Gm-Message-State: AOAM533R3Af+LgnpZAr2NVBBiWqHTzRCV03N20702+NewgU0erFdLt3a
 4Caf3dck6Ejt+u24kUb7ITg=
X-Google-Smtp-Source: ABdhPJzONC70ikiwdtkVw1ey6gQw1AlQ/1RiHNFY2i5gZUqHfyD2A3MhaVDvRilWyuIqqNxylfvibQ==
X-Received: by 2002:a05:600c:3516:b0:39c:8091:31b6 with SMTP id
 h22-20020a05600c351600b0039c809131b6mr711372wmq.164.1655155878952; 
 Mon, 13 Jun 2022 14:31:18 -0700 (PDT)
Received: from pevik (37-188-191-82.red.o2.cz. [37.188.191.82])
 by smtp.gmail.com with ESMTPSA id
 v187-20020a1cacc4000000b0039749256d74sm14781714wme.2.2022.06.13.14.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 14:31:18 -0700 (PDT)
Date: Mon, 13 Jun 2022 23:31:15 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <Yqeso3ZYuZZatAfQ@pevik>
References: <20220606184320.8210-1-petr.vorel@gmail.com>
 <20220606184320.8210-3-petr.vorel@gmail.com>
 <5d4a4e2b-4d1d-88d6-4905-67083c154775@suse.cz>
 <024cf3d9-f9c1-80a4-8b06-799309912c7f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <024cf3d9-f9c1-80a4-8b06-799309912c7f@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] kvm: Fix undefined reference to
 __stack_chk_fail()
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

> Hi,


> Am 6/9/2022 um 10:26 AM schrieb Martin Doucha:
> > On 06. 06. 22 20:43, Petr Vorel wrote:
> >> Some x86_64 buildroot toolchains (bootlin-x86-64-glibc,
> >> bootlin-x86-64-musl) try to link to __stack_chk_fail().
> >> -nostdlib is not enough, it requires also -fstack-protector.

> >> x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccgBXEoR.o: in function `handle_page_fault':
> >> kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
> >> collect2: error: ld returned 1 exit status

> >> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> >> ---
> >>  testcases/kernel/kvm/Makefile | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)

> >> diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
> >> index 8d5193d8e..bce1a4eb5 100644
> >> --- a/testcases/kernel/kvm/Makefile
> >> +++ b/testcases/kernel/kvm/Makefile
> >> @@ -9,7 +9,7 @@ ASFLAGS =
> >>  CPPFLAGS += -I$(abs_srcdir)/include
> >>  GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
> >>  GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
> >> -GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
> >> +GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fstack-protector

> > We should use -fno-stack-protector here instead. Your patch probably
> > enables linking of libssp despite -nostdlib which we don't want. The GCC
> > stack protector may also break tests because bootstrap initializes stack
> > manually instead of letting GCC handle it.
> I can confirm, that adding -fno-stack-protector to GUEST_LDFLAGS fixes
> the linker error.

Thanks a lot for your input. Martin, thanks a lot for testing.
I also verified that -fno-stack-protector fix compilation, thus patchset merged.

Kind regards,
Petr

> >>  GUEST_LDLIBS =

> >>  FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86



> Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
