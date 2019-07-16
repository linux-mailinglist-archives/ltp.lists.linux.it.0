Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC26A2A8
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 09:07:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 71BB13C1D0A
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Jul 2019 09:07:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 991E03C07AD
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 09:07:10 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 63AC81000D54
 for <ltp@lists.linux.it>; Tue, 16 Jul 2019 09:07:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D217C04BD55;
 Tue, 16 Jul 2019 07:07:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6249A600C4;
 Tue, 16 Jul 2019 07:07:07 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54B6D4EBC3;
 Tue, 16 Jul 2019 07:07:07 +0000 (UTC)
Date: Tue, 16 Jul 2019 03:07:07 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Message-ID: <1694827109.292834.1563260827076.JavaMail.zimbra@redhat.com>
In-Reply-To: <1563185037-236824-2-git-send-email-hongzhi.song@windriver.com>
References: <1563185037-236824-1-git-send-email-hongzhi.song@windriver.com>
 <1563185037-236824-2-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.16]
Thread-Topic: getrlimit03: adjust a bit of code to compatiable with mips32
Thread-Index: 0Q7og+YWV1m1G2qK/4cyWuuQqp1QHA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 16 Jul 2019 07:07:07 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V4] getrlimit03: adjust a bit of code to
 compatiable with mips32
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
> Error info:
> getrlimit03.c:104: FAIL: __NR_prlimit64(0) had rlim_cur =
> ffffffffffffffff but __NR_getrlimit(0) had rlim_cur = 7fffffff
> 
> According to kernel code: [arch/mips/include/uapi/asm/resource.h]
> RLIM_INFINITY is set to 0x7fffffffUL instead of ULONG_MAX on mips32.
> 
>  /*
>  * SuS says limits have to be unsigned.
>  * Which makes a ton more sense anyway,
>  * but we keep the old value on MIPS32,
>  * for compatibility:
>  */
>  #ifndef __mips64
>  # define RLIM_INFINITY      0x7fffffffUL
>  #endif
> 
> Adding conditional statement about mips to fix this.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  testcases/kernel/syscalls/getrlimit/getrlimit03.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> index e4d56c4..03bd821 100644
> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> @@ -26,6 +26,7 @@
>  
>  #include "tst_test.h"
>  #include "lapi/syscalls.h"
> +#include "lapi/abisize.h"
>  
>  /**
>   * Linux provides an "old" getrlimit syscall handler that uses signed long,
> @@ -61,7 +62,12 @@ struct rlimit_ulong {
>  	unsigned long rlim_cur;
>  	unsigned long rlim_max;
>  };
> -const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
> +
> +#if defined(__mips) && defined(TST_ABI32)

I see several tests already use __mips__, why did you go with __mips here?
Anyway, I'm fine with the patch.

> +	const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
> +#else
> +	const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
> +#endif
>  
>  static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>  {
> --
> 2.8.1
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
