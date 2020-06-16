Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE221FBF2C
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 21:44:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 269623C2D00
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jun 2020 21:44:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F019C3C0731
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:44:14 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 654601000A98
 for <ltp@lists.linux.it>; Tue, 16 Jun 2020 21:44:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C094EAD39;
 Tue, 16 Jun 2020 19:44:17 +0000 (UTC)
Date: Tue, 16 Jun 2020 21:44:29 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200616194429.GA31700@yuki.lan>
References: <20200616190918.24761-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616190918.24761-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] lapi: Add posix_types.h
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> To fix undefined __kernel_ulong_t, which was defined in v3.4-rc1
> in afead38d011a ("posix_types: Introduce __kernel_[u]long_t").
> 
> This fixed build error:
> 
> In file included from /usr/src/ltp/include/lapi/msgbuf.h:13,
>                  from /usr/src/ltp/testcases/kernel/syscalls/ipc/msgctl/msgctl05.c:9:
> /usr/src/ltp/include/lapi/ipcbuf.h: At top level:
> /usr/src/ltp/include/lapi/ipcbuf.h:187: error: expected specifier-qualifier-list before '__kernel_ulong_t'
> 
> Fixes: 3e1fc0644 ("include: Add declaration of struct ipc64_perm")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> or is it a time to drop that support?
> If I remember we were talking about 3.0, this is 3.4.
> 
> Is this correct?
> +#ifndef __kernel_long_t
> +# if defined(__x86_64__) && defined(__ILP32__)
> +typedef long long		__kernel_long_t;
> +typedef unsigned long long	__kernel_ulong_t;
> +# else
> +typedef long			__kernel_long_t;
> +typedef unsigned long		__kernel_ulong_t;
> +# endif
> +#endif

As far as I can tell yes, I came to the same conclusion.

I guess that we may as well push this patch since you already put an
effort into crafting it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
