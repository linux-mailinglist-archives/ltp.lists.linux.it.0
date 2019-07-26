Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F16D176596
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:23:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB6BF3C1D0E
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Jul 2019 14:23:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id AC4623C1D01
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:22:59 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 35BC2600C13
 for <ltp@lists.linux.it>; Fri, 26 Jul 2019 14:22:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7CFB330C34DD;
 Fri, 26 Jul 2019 12:22:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 727FD5C22F;
 Fri, 26 Jul 2019 12:22:57 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3973E41F53;
 Fri, 26 Jul 2019 12:22:57 +0000 (UTC)
Date: Fri, 26 Jul 2019 08:22:57 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1968200096.2791881.1564143777013.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190726092110.13116-1-pvorel@suse.cz>
References: <20190726092110.13116-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.148, 10.4.195.24]
Thread-Topic: syscalls/mprotect04: Fix compilation error for ia64
Thread-Index: fLMcGnIOXzEnvgDF3CeluJ4tACvK4A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 26 Jul 2019 12:22:57 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mprotect04: Fix compilation error for
 ia64
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



----- Original Message -----
> Fixes: 94f5be719 ("syscalls/mprotect04: align exec_func to 64 bytes")
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
> 
> or should we drop ia64 support as the architecture is obsolete?
> Since we don't test this arch, there are some other build failures
> (at least on old SLES I tested the patch).

Thanks, I missed the ia64-specific code. RHEL dropped support for ia64 in RHEL6,
and RHEL5 will likely be EOL in ~6 months, so I'm fine either way.

One note below.

> 
> Kind regards,
> Petr
> 
>  testcases/kernel/syscalls/mprotect/mprotect04.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/mprotect/mprotect04.c
> b/testcases/kernel/syscalls/mprotect/mprotect04.c
> index a014ab6b4..d1991a2db 100644
> --- a/testcases/kernel/syscalls/mprotect/mprotect04.c
> +++ b/testcases/kernel/syscalls/mprotect/mprotect04.c
> @@ -141,7 +141,7 @@ struct func_desc {
>  	uint64_t glob_pointer;
>  };
>  
> -static __attribute__((noinline)) void *get_func(void *mem)
> +static __attribute__((noinline)) void *get_func(void *mem, uintptr_t
> *func_page_offset LTP_ATTRIBUTE_UNUSED)
>  {
>  	static struct func_desc fdesc;
>  
> @@ -275,11 +275,13 @@ static void testfunc_protexec(void)
>  	if (!func)
>  		goto out;
>  
> +#ifndef __ia64__

If you initialize func_page_offset to 0 in ia64 get_func(), then this ifdef
is not needed. Either way:

Acked-by: Jan Stancek <jstancek@redhat.com>

>  	if (func_page_offset + 64 > page_sz) {
>  		SAFE_MUNMAP(cleanup, p, page_sz);
>  		tst_brkm(TCONF, cleanup, "func too close to page boundary, "
>  			"maybe your compiler ignores -falign-functions?");
>  	}
> +#endif
>  
>  	/* Change the protection to PROT_EXEC. */
>  	TEST(mprotect(p, page_sz, PROT_EXEC));
> --
> 2.22.0
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
