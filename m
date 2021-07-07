Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F63BE3FB
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:52:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 85DAC3C6878
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 09:52:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BEE33C6843
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:52:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 422991401148
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 09:52:45 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A260F1FD5A;
 Wed,  7 Jul 2021 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625644364;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eD0spxPmxsZktci/ox62o99/a9SRDHtr6HNIktzHG8w=;
 b=oT7OrVY6gWi3Oe4hK7BHaQhilfx06pYX46AhBUetn5/v25EfQ5ZlN43URjY9fA1HG5GZQe
 97uW0i5wd6xV/jfITM/BMxBVew0RZsXMiO2tnG/7trX4dF4vMhiSmMhXqZTL8r8rmepAUt
 abktCZAqVze0hRmLiuSgp63qkQPCI9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625644364;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eD0spxPmxsZktci/ox62o99/a9SRDHtr6HNIktzHG8w=;
 b=vgTOQZh4tbuIxYuG/yW1+QTA7y4xaTPy0L/100VZlFMrINXtNmF/LhVi/C5MfMG6QxiTLM
 V2J+ijH7uBw06ADg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6F088A3B9C;
 Wed,  7 Jul 2021 07:52:44 +0000 (UTC)
References: <20210707071838.27834-1-rpalethorpe@suse.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20210707071838.27834-1-rpalethorpe@suse.com>
Date: Wed, 07 Jul 2021 08:52:43 +0100
Message-ID: <87fswq7e7o.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kill13, CVE-2018-10124: Reproduce INT_MIN negation
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
Reply-To: rpalethorpe@suse.de
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Richard Palethorpe <rpalethorpe@suse.com> writes:

> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>

Fixes: https://github.com/linux-test-project/ltp/issues/323

> ---
>  runtest/cve                               |  1 +
>  runtest/syscalls                          |  1 +
>  testcases/kernel/syscalls/kill/.gitignore |  1 +
>  testcases/kernel/syscalls/kill/kill13.c   | 35 +++++++++++++++++++++++
>  4 files changed, 38 insertions(+)
>  create mode 100644 testcases/kernel/syscalls/kill/kill13.c
>
> diff --git a/runtest/cve b/runtest/cve
> index 5a6ef966d..226b5ea44 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -49,6 +49,7 @@ cve-2018-5803 sctp_big_chunk
>  cve-2018-7566 snd_seq01
>  cve-2018-8897 ptrace09
>  cve-2018-9568 connect02
> +cve-2018-10124 kill13
>  cve-2018-1000001 realpath01
>  cve-2018-1000199 ptrace08
>  cve-2018-1000204 ioctl_sg01
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 98fe3c02e..0c1e16f9e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -644,6 +644,7 @@ kill09 kill09
>  kill10 kill10
>  kill11 kill11
>  kill12 kill12
> +kill13 kill13
>  
>  lchown01 lchown01
>  lchown01_16 lchown01_16
> diff --git a/testcases/kernel/syscalls/kill/.gitignore b/testcases/kernel/syscalls/kill/.gitignore
> index 75fdaa561..810ed0200 100644
> --- a/testcases/kernel/syscalls/kill/.gitignore
> +++ b/testcases/kernel/syscalls/kill/.gitignore
> @@ -8,3 +8,4 @@
>  /kill10
>  /kill11
>  /kill12
> +/kill13
> diff --git a/testcases/kernel/syscalls/kill/kill13.c b/testcases/kernel/syscalls/kill/kill13.c
> new file mode 100644
> index 000000000..b5afb653f
> --- /dev/null
> +++ b/testcases/kernel/syscalls/kill/kill13.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
> + */
> +
> +/*\
> + * [Description]
> + *
> + * Reproducer of CVE-2018-10124; INT_MIN negation.
> + *
> + * Most likely this test will always pass without UBSAN
> + * enabled. Perhaps unless negating INT_MIN results in -1 or
> + * 0. However on my computer it just results in INT_MIN.
> + *
> + */
> +
> +#include <limits.h>
> +#include <signal.h>
> +#include "tst_test.h"
> +
> +static void run(void)
> +{
> +	TST_EXP_FAIL2(kill(INT_MIN, 1000), ESRCH,
> +		      "kill(INT_MIN, ...) fails with ESRCH");
> +}
> +
> +static struct tst_test test = {
> +	.test_all = run,
> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
> +	.tags = (const struct tst_tag[]) {
> +		{"linux-git", "4ea77014af0d"},
> +		{"CVE", "CVE-2018-10124"},
> +		{}
> +	}
> +};


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
