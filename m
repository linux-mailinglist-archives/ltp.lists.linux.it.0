Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BDB652A2
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 09:48:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF1513C1CF7
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jul 2019 09:48:55 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D39963C03AD
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 09:48:51 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A00271000B40
 for <ltp@lists.linux.it>; Thu, 11 Jul 2019 09:48:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 926D6308623C;
 Thu, 11 Jul 2019 07:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87BAC194B3;
 Thu, 11 Jul 2019 07:48:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E4BDE161;
 Thu, 11 Jul 2019 07:48:48 +0000 (UTC)
Date: Thu, 11 Jul 2019 03:48:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Message-ID: <408194681.32599099.1562831328308.JavaMail.zimbra@redhat.com>
In-Reply-To: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
References: <1562826026-158569-1-git-send-email-hongzhi.song@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.11]
Thread-Topic: getrlimit03: adjust a bit of code to compatiable with mips32
Thread-Index: W6jg78f6n03mMwio7m573HCWlOySVA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 11 Jul 2019 07:48:48 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] getrlimit03: adjust a bit of code to
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
> /*
>  * SuS says limits have to be unsigned.
>  * Which makes a ton more sense anyway,
>  * but we keep the old value on MIPS32,
>  * for compatibility:
>  */
> #ifndef __mips64
> # define RLIM_INFINITY      0x7fffffffUL
> #endif
> 
> Adding conditional statement about mips to fix this.
> 
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  testcases/kernel/syscalls/getrlimit/getrlimit03.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> index e4d56c4..1903558 100644
> --- a/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> +++ b/testcases/kernel/syscalls/getrlimit/getrlimit03.c
> @@ -61,7 +61,13 @@ struct rlimit_ulong {
>  	unsigned long rlim_cur;
>  	unsigned long rlim_max;
>  };
> +#ifdef __mips
> +#ifndef __mips64
> +const unsigned long RLIM_INFINITY_UL = 0x7fffffffUL;
> +#else
>  const unsigned long RLIM_INFINITY_UL = ULONG_MAX;
> +#endif
> +#endif

Hi,

This will break every other arch, because it's now undefined everywhere except mips.

>  
>  static int getrlimit_ulong(int resource, struct rlimit_ulong *rlim)
>  {
> @@ -101,8 +107,8 @@ static int compare_u64_ulong(int resource, uint64_t
> val_u64,
>  {
>  	if ((val_u64 > RLIM_INFINITY_UL && val_ul != RLIM_INFINITY_UL) ||
>  	    (val_u64 <= RLIM_INFINITY_UL && val_ul != val_u64)) {
> -		tst_res(TFAIL, "__NR_prlimit64(%d) had %s = %" PRIx64 " but "
> __NR_getrlimit_ulong_str "(%d) had %s = %lx",
> -			resource, kind, val_u64,
> +		tst_res(TFAIL, "SIGNED_GETRLIMIT = %d __WORDSIZE %d ULONG_MAX = %lu
> RLIM_INFINITY_UL = %lu __NR_prlimit64(%d) had %s = %" PRIx64 " but "
> __NR_getrlimit_ulong_str "(%d) had %s = %lx",
> +			SIGNED_GETRLIMIT, __WORDSIZE, ULONG_MAX, RLIM_INFINITY_UL, resource,

I suggest to split it into another tst_res() message, line above is nearly 200 characters.

Regards,
Jan

> kind, val_u64,
>  			resource, kind, val_ul);
>  		return -1;
>  	}
> --
> 2.8.1
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
