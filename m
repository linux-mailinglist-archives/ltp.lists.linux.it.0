Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D8D3BE47E
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:35:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50D453C6879
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 10:35:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9FCDE3C4DAB
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:35:19 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C13B6200C3D
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 10:35:18 +0200 (CEST)
Received: from [192.168.178.40] (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 2974F9F7F3;
 Wed,  7 Jul 2021 08:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625646917; bh=0oXIbdPjRtD3FjC2FLm1LPWI4PeKTlL+zeoIami4VtE=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=OYR7FwkAIIPdufO2ZrlIRo3qve6aho0iZp9XMXTYLLvEC5Aqz6La0AN75cMQCPMS2
 RHHTGbFO34eOUnXdiQCzvz3bAiASEGBqCyRBczAh/1VB9DOOQOR8QrEg0DhJJqlfn0
 9Htlg2qG0zyomBoth3irQrvrncXUnsyifM9omiqY=
To: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
References: <20210707071838.27834-1-rpalethorpe@suse.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <43e8b66b-04df-9c4f-c47b-aba13347b6d8@jv-coder.de>
Date: Wed, 7 Jul 2021 10:35:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707071838.27834-1-rpalethorpe@suse.com>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

On 7/7/2021 9:18 AM, Richard Palethorpe via ltp wrote:
> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> ---
>   runtest/cve                               |  1 +
>   runtest/syscalls                          |  1 +
>   testcases/kernel/syscalls/kill/.gitignore |  1 +
>   testcases/kernel/syscalls/kill/kill13.c   | 35 +++++++++++++++++++++++
>   4 files changed, 38 insertions(+)
>   create mode 100644 testcases/kernel/syscalls/kill/kill13.c
>
> diff --git a/runtest/cve b/runtest/cve
> index 5a6ef966d..226b5ea44 100644
> --- a/runtest/cve
> +++ b/runtest/cve
> @@ -49,6 +49,7 @@ cve-2018-5803 sctp_big_chunk
>   cve-2018-7566 snd_seq01
>   cve-2018-8897 ptrace09
>   cve-2018-9568 connect02
> +cve-2018-10124 kill13
>   cve-2018-1000001 realpath01
>   cve-2018-1000199 ptrace08
>   cve-2018-1000204 ioctl_sg01
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 98fe3c02e..0c1e16f9e 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -644,6 +644,7 @@ kill09 kill09
>   kill10 kill10
>   kill11 kill11
>   kill12 kill12
> +kill13 kill13
>   
>   lchown01 lchown01
>   lchown01_16 lchown01_16
> diff --git a/testcases/kernel/syscalls/kill/.gitignore b/testcases/kernel/syscalls/kill/.gitignore
> index 75fdaa561..810ed0200 100644
> --- a/testcases/kernel/syscalls/kill/.gitignore
> +++ b/testcases/kernel/syscalls/kill/.gitignore
> @@ -8,3 +8,4 @@
>   /kill10
>   /kill11
>   /kill12
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
Results in INT_MIN? What does this mean or did you meant to write 
results in ESRCH?
Default negating int min in two's complement yields 0 (INT_MIN = 
b1000... and negating means inverting the first bit -> thus 0).

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
If at some point the kernel decides to change the order of pid and 
signal validation, it will probably return EINVAL.
Maybe using signal 0 would be better here? It does not "do" anything, 
but validates the given pid.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
