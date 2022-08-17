Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7659716E
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 16:38:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85D653C9F31
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Aug 2022 16:38:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B9CB43C9B66
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 16:38:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B1D0D60029F
 for <ltp@lists.linux.it>; Wed, 17 Aug 2022 16:38:37 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CEC191F8C1;
 Wed, 17 Aug 2022 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1660747115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoDojTd/DI7oIeXRPoIdBWqq9606Op8405fk6E1O+1I=;
 b=RmgcC4HJMz89NxCUo7qKq1NY1CEJPM9Eql7dPuf8/24DdUg0NEf0XPMIS5vSVV8abmB3EF
 CtfrI+hWOhJ5U+t0wDgtFEntq8MNvhH3tuas9eEbsqByAkRBAWdK/JTFTPEaMjb0LHf7gX
 lnIeNE3vSMBQF3AowqQKvbRU7BphtHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1660747115;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoDojTd/DI7oIeXRPoIdBWqq9606Op8405fk6E1O+1I=;
 b=ugqxsqOgEEfmlE2tWsLpSJQvN1VJxBH7Wza7VzTfuiV3IYE4lqhekvOtDkOXj81AXqc/uB
 O2HGJ5huW3sqTFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF40F13428;
 Wed, 17 Aug 2022 14:38:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id duQVKGv9/GJUeQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 17 Aug 2022 14:38:35 +0000
Date: Wed, 17 Aug 2022 16:40:32 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Tudor Cretu <tudor.cretu@arm.com>
Message-ID: <Yvz94MEujALdeDRE@yuki>
References: <20220817133946.234985-1-tudor.cretu@arm.com>
 <20220817133946.234985-5-tudor.cretu@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817133946.234985-5-tudor.cretu@arm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] syscalls/statfs: Avoid dereferencing invalid
 buf in libc
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
> The [f]statfs02 testsuites check that [f]statfs returns EFUALT when the
> provided buf parameter is invalid. There are cases in which the supported
> libcs don't exhibit this behaviour.
> 
> glibc versions newer than 2.34 and on systems that support [f]statfs64,
> call the syscall with a local struct statfs and then copy the result
> into buf. This throws a segfault for an invalid buf. musl dereferences buf
> before the syscall is called and, similarly, throws a segfault.
> 
> To avoid dereferencing an invalid buf in libc, bypass the [f]statfs wrapper
> and call the syscall directly. Consistently with the libc wrappers,
> choose [f]statfs64 instead of [f]statfs if the target supports it.

Another solution that we used in the past would be installing a signal
handler for segfault and treat that signal as a PASS for the EFAULT
test.

> Signed-off-by: Tudor Cretu <tudor.cretu@arm.com>
> ---
>  testcases/kernel/syscalls/fstatfs/fstatfs02.c | 7 ++++++-
>  testcases/kernel/syscalls/statfs/statfs02.c   | 7 ++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/testcases/kernel/syscalls/fstatfs/fstatfs02.c b/testcases/kernel/syscalls/fstatfs/fstatfs02.c
> index db2230f82..c1af07070 100644
> --- a/testcases/kernel/syscalls/fstatfs/fstatfs02.c
> +++ b/testcases/kernel/syscalls/fstatfs/fstatfs02.c
> @@ -25,6 +25,7 @@
>  #include <sys/types.h>
>  #include <sys/statfs.h>
>  #include <errno.h>
> +#include "lapi/syscalls.h"
>  #include "test.h"
>  #include "safe_macros.h"
>  
> @@ -68,7 +69,11 @@ int main(int ac, char **av)
>  
>  		for (i = 0; i < TST_TOTAL; i++) {
>  
> -			TEST(fstatfs(TC[i].fd, TC[i].sbuf));
> +#if __NR_fstatfs64 != __LTP__NR_INVALID_SYSCALL
> +			TEST(tst_syscall(__NR_fstatfs64, TC[i].fd, TC[i].sbuf));
> +#else
> +			TEST(tst_syscall(__NR_fstatfs, TC[i].fd, TC[i].sbuf));
> +#endif

Even if we wanted to go with this version this should be put into an
header in lapi/ and not added into each test that calls statfs().

>  			if (TEST_RETURN != -1) {
>  				tst_resm(TFAIL, "call succeeded unexpectedly");
> diff --git a/testcases/kernel/syscalls/statfs/statfs02.c b/testcases/kernel/syscalls/statfs/statfs02.c
> index 279665f86..e1afbda39 100644
> --- a/testcases/kernel/syscalls/statfs/statfs02.c
> +++ b/testcases/kernel/syscalls/statfs/statfs02.c
> @@ -39,6 +39,7 @@
>  #include <sys/vfs.h>
>  #include <sys/mman.h>
>  #include <errno.h>
> +#include "lapi/syscalls.h"
>  #include "test.h"
>  #include "safe_macros.h"
>  
> @@ -116,7 +117,11 @@ static void setup(void)
>  
>  static void statfs_verify(const struct test_case_t *test)
>  {
> -	TEST(statfs(test->path, test->buf));
> +#if __NR_statfs64 != __LTP__NR_INVALID_SYSCALL
> +	TEST(tst_syscall(__NR_statfs64, test->path, test->buf));
> +#else
> +	TEST(tst_syscall(__NR_statfs, test->path, test->buf));
> +#endif
>  
>  	if (TEST_RETURN != -1) {
>  		tst_resm(TFAIL, "call succeeded unexpectedly");
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
