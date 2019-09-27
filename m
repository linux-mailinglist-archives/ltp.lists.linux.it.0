Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF4BC07EA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 16:49:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 78EFF3C2152
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 16:49:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4D8A93C04F9
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 16:49:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id AA1441400E42
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 16:49:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B9309B019;
 Fri, 27 Sep 2019 14:49:03 +0000 (UTC)
Date: Fri, 27 Sep 2019 16:49:02 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Message-ID: <20190927144902.GA25060@rei.lan>
References: <20190926144507.15765-1-cascardo@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926144507.15765-1-cascardo@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_create01: accept ENOTSUP
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
> CLOCK_REALTIME_ALARM and CLOCK_BOOTTIME_ALARM require an RTC with alarm
> support, which may not be present on a system. In that case, the kernel
> will return EOPNOTSUPP, which is defined as ENOTSUP in userspace.
> 
> As these clocks are already possibly unsupported, accept that as an error
> code besides the EINVAL code.
> 
> Note that previously the kernel would incorrectly return the ENOTSUPP code,
> which is undefined in userspace. With these unfixed kernels, the test will
> fail when those RTCs are not present.

Can you please include the kernel commit id that fixed the kernel here?

Otherwise this patch is fine.

> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
> ---
>  testcases/kernel/syscalls/timer_create/timer_create01.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/testcases/kernel/syscalls/timer_create/timer_create01.c b/testcases/kernel/syscalls/timer_create/timer_create01.c
> index 258b6444c362..1ae5b9b2d1c2 100644
> --- a/testcases/kernel/syscalls/timer_create/timer_create01.c
> +++ b/testcases/kernel/syscalls/timer_create/timer_create01.c
> @@ -77,7 +77,8 @@ static void run(unsigned int n)
>  				&created_timer_id));
>  
>  		if (TST_RET != 0) {
> -			if (possibly_unsupported(clock) && TST_ERR == EINVAL) {
> +			if (possibly_unsupported(clock) &&
> +			    (TST_ERR == EINVAL || TST_ERR == ENOTSUP)) {
>  				tst_res(TPASS | TTERRNO,
>  					"%s unsupported, failed as expected",
>  					get_clock_str(clock));
> -- 
> 2.20.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
