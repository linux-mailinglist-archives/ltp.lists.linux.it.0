Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 186B29F348
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 21:26:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C091E3C1CFB
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 21:26:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 80D3B3C1CE4
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 21:26:23 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 829C01001285
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 21:26:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 061F418C427C;
 Tue, 27 Aug 2019 19:26:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A1360933;
 Tue, 27 Aug 2019 19:26:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9586724F2F;
 Tue, 27 Aug 2019 19:26:19 +0000 (UTC)
Date: Tue, 27 Aug 2019 15:26:19 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: zhe he <zhe.he@windriver.com>
Message-ID: <4200333.8516580.1566933979370.JavaMail.zimbra@redhat.com>
In-Reply-To: <1566544121-147769-1-git-send-email-zhe.he@windriver.com>
References: <1566544121-147769-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.126, 10.4.195.28]
Thread-Topic: syscalls: rt_sigwaitinfo01: Fix failure for MIPS arches
Thread-Index: 2rU4WU0x6JwnIzZERDEZAerBUXuHPg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Tue, 27 Aug 2019 19:26:20 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: rt_sigwaitinfo01: Fix failure for MIPS
 arches
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
> From: He Zhe <zhe.he@windriver.com>
> 
> rt_sigtimedwait01 fails as follow on MIPS arches
> rt_sigtimedwait01    1  TFAIL  :  .../sigwaitinfo01.c:58: test_empty_set
> (.../sigwaitinfo01.c: 148): Unexpected failure:
> TEST_ERRNO=EINVAL(22): Invalid argument
> 
> As this case purposely bypasses glibc, it should align with the size of
> kernel
> definition of sigset_t which is different from other arches.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/include/uapi/asm/signal.h#n15
> 
> This patch adds specific case for MIPS.
> 
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> index 5a32ce1..5c2fa99 100644
> --- a/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> +++ b/testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
> @@ -128,9 +128,16 @@ static int my_sigtimedwait(const sigset_t * set,
> siginfo_t * info,
>  static int my_rt_sigtimedwait(const sigset_t * set, siginfo_t * info,
>  			      struct timespec *timeout)
>  {
> -
> -	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64
> and 8, resp. */
> -	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout, 8);
> +	/* The last argument is (number_of_signals)/(bits_per_byte), which are 64
> and 8, resp,
> +	 * except for MIPS which are 128 and 8, resp.
> +	 */
> +	return ltp_syscall(__NR_rt_sigtimedwait, set, info, timeout,
> +#ifdef __mips__
> +		16
> +#else
> +		8
> +#endif

Hi,

looking at kernel SYSCALL_DEFINE4(rt_sigtimedwait,..), the size is
used in this check:
        if (sigsetsize != sizeof(sigset_t))                                                                                                                   
                return -EINVAL; 

So I'm wondering if need to have an absolute value here, and if we can't
replace it with sizeof(sigset_t) or _NSIG / 8?

Regards,
Jan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
