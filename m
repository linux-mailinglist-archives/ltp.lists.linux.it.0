Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CDE14283B
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:31:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D1DED3C2452
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:31:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A59553C229C
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:31:15 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ADC0D64980C
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:31:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F37FADCF;
 Mon, 20 Jan 2020 10:31:10 +0000 (UTC)
Date: Mon, 20 Jan 2020 11:31:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200120103108.GA15405@dell5510>
References: <20200117113715.22786-1-pvorel@suse.cz>
 <20200117113715.22786-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117113715.22786-3-pvorel@suse.cz>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] tst_device.h: Use lapi/syscalls.h instead of
 <sys/syscall.h>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> As a fallback for old distros which does not define __NR_syncfs
> (the dependency is in the library itself).

> This was needed on SLES 11 (kernel 2.6.32).

> Fixes: 74aeb88c9 ("tst_device: use raw syscall in the tst_device.h")

> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  include/tst_device.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/include/tst_device.h b/include/tst_device.h
> index 3db5275c9..13d92ee54 100644
> --- a/include/tst_device.h
> +++ b/include/tst_device.h
> @@ -19,7 +19,7 @@
>  #define TST_DEVICE_H__

>  #include <unistd.h>
> -#include <sys/syscall.h>
> +#include "lapi/syscalls.h"
Hm, maybe this fix wasn't a good idea.
It effectively uses lapi/syscalls.h everywhere instead of <sys/syscall.h>.
Not sure if this is what we want.

Example of the error is #634 [1], which is caused by __NR_socketcall being -1
instead of not defined (socketcall is not defined on some archs, e.g. x86-64 and ARM).
We can fix the condition, but it will lead to numerous not obvious errors, so I
suggest to revert this (and thus get LTP broken on very old distros).

I'm sorry to break LTP just before release.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/issues/634

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
