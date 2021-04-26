Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6336B3D0
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:09:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1C643C6760
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 15:09:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C81A23C66E9
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:09:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D429E140099D
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 15:09:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 48B95ACF9;
 Mon, 26 Apr 2021 13:09:23 +0000 (UTC)
Date: Mon, 26 Apr 2021 15:09:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <YIa7gZn/5i9pBqXf@pevik>
References: <20210422072609.9938-1-sujiaxun@uniontech.com>
 <YIZSzNd9uK8kItYb@pevik>
 <20210426055556.dmcogdykez2ddxn3@vireshk-i7>
 <YIZa4Ph81LmkEkLZ@pevik>
 <20210426062357.i72js3urkoofvzcj@vireshk-i7>
 <f06db611-5024-78d6-07e9-36115889b7a7@uniontech.com>
 <20210426070320.iow3avu2pq22qled@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210426070320.iow3avu2pq22qled@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Fix the 64-bit macro definition of mips
 architecture
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it, sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 26-04-21, 15:00, sujiaxun wrote:
> > uos@uos-PC:~$ echo |gcc -dM -E - | grep -i arch
> > #define _MIPS_ARCH "mips64r2"
> > #define _MIPS_ARCH_MIPS64R2 1
> > uos@uos-PC:~$ echo |gcc -dM -E - | grep -i mips64
> > #define _MIPS_ISA _MIPS_ISA_MIPS64
> > #define _MIPS_TUNE "mips64r2"
> > #define _MIPS_TUNE_MIPS64R2 1
> > #define _MIPS_ARCH "mips64r2"
> > #define _MIPS_ARCH_MIPS64R2 1
> > #define __mips64 1
> > uos@uos-PC:~$ uname  -m
> > mips64
Thanks for verification!

> > The mips architecture gcc has no built-in __arch64__, only __mips64
> > definitions. Of course, "__BITS_PER_LONG == 64" can also be used, but I
> > think it is better to use __mips64 in the mips architecture.

> Hmm, I will rather try to do what the kernel source code does, i.e.
> use __BITS_PER_LONG here instead.
+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
