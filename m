Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE84350ED9
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 08:12:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 407AA3C77C7
	for <lists+linux-ltp@lfdr.de>; Thu,  1 Apr 2021 08:12:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id ADB4D3C2238
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 08:12:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2B8151000B54
 for <ltp@lists.linux.it>; Thu,  1 Apr 2021 08:12:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A09C6B121;
 Thu,  1 Apr 2021 06:12:29 +0000 (UTC)
Date: Thu, 1 Apr 2021 08:12:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhanglianjie <zhanglianjie@uniontech.com>
Message-ID: <YGVkS23e+/eytuEn@pevik>
References: <20210330021830.17402-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330021830.17402-1-zhanglianjie@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] bugfix for ssetmask01.c
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
Cc: He Zhe <zhe.he@windriver.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> mips architecture syscall(69) __NR_ssetmask not supported on your arch.

nit: "mips_o32: Fix __NR_s{g,s}etmask" for bug title would be more descriptive
than "bugfix for ssetmask01.c". And then in text mention ssetmask01.c.

> +++ b/include/lapi/syscalls/mips_o32.in
> @@ -66,8 +66,8 @@ getppid 64
>  getpgrp 65
>  setsid 66
>  sigaction 67
> -sgetmask 68
> -ssetmask 69
> +sgetmask 4068
> +ssetmask 4069

But more important: I guess you're right because we don't add any offset to the
numbers. But IMHO all numbers are wrong, all mips files should contain offset
(01e4dc222 was wrong). mips_o32.in should be offset 4000, mips_n32.in 6000 and
mips_n64.in 5000 (comparing scall32-o32.S, scall64-64.S, scall64-n32.S in
arch/mips/kernel in kernel and mips{,n32,64}/bits/syscall.h.in in musl).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
