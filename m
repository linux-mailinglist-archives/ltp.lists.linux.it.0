Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD32B9034
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:37:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 79C5D3C4EEB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Nov 2020 11:37:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 702353C2F4A
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:37:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 202DE600B3E
 for <ltp@lists.linux.it>; Thu, 19 Nov 2020 11:37:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69592ACBA;
 Thu, 19 Nov 2020 10:37:36 +0000 (UTC)
Date: Thu, 19 Nov 2020 11:38:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Po-Hsu Lin <po-hsu.lin@canonical.com>
Message-ID: <20201119103825.GG2785@yuki.lan>
References: <20201119100617.70968-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119100617.70968-1-po-hsu.lin@canonical.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] acct02: make explicit kernel config requirement
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> With commit eeed458492cc ("lib/tst_kconfig: Validate variables"), the
> kernel config check is now more strict.
> 
> In this acct02 test, it will fail on an ARM64 system running with
> Ubuntu Bionic 4.15 kernel:
>   tag=acct02 stime=1605709219 dur=0 exit=exited stat=2 core=no cu=0 cs=0
>   startup='Wed Nov 18 14:20:19 2020'
>   CONFIG_BSD_PROCESS_ACCT
>   ^
>   Missing value
> 
>   tst_kconfig.c:475: TBROK: Invalid kconfig variables!

Sigh, I will fix this so that we can have config variables without
values again.

> While the kernel config shows:
>   $ grep CONFIG_BSD_PROCESS_ACCT /boot/config-4.15.0-1087-aws
>   CONFIG_BSD_PROCESS_ACCT=y
>   CONFIG_BSD_PROCESS_ACCT_V3=y
> 
> Change the kernel config requirement to CONFIG_BSD_PROCESS_ACCT=y
> to solve this issue.

But I guess that we should change the kconfig into:

"CONFIG_BSD_PROCESS_ACCT | CONFIG_BSD_PROCESS_ACCT_V3"

> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> ---
>  testcases/kernel/syscalls/acct/acct02.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
> index fbcde0bcb..bd0427848 100644
> --- a/testcases/kernel/syscalls/acct/acct02.c
> +++ b/testcases/kernel/syscalls/acct/acct02.c
> @@ -255,7 +255,7 @@ static void cleanup(void)
>  }
>  
>  static const char *kconfigs[] = {
> -	"CONFIG_BSD_PROCESS_ACCT",
> +	"CONFIG_BSD_PROCESS_ACCT=y",
>  	NULL
>  };
>  
> -- 
> 2.25.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
