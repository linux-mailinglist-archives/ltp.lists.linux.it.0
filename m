Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECF3BE5C5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:43:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED53A3C6AD5
	for <lists+linux-ltp@lfdr.de>; Wed,  7 Jul 2021 11:42:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 36B593C2A8B
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:42:57 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F27C0600C76
 for <ltp@lists.linux.it>; Wed,  7 Jul 2021 11:42:56 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 29AC62003D;
 Wed,  7 Jul 2021 09:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625650976;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R55Gk+D8yvX2B+whG/zqiXVyl5HfIKERx04ZpHRz3gI=;
 b=V5G1vOxziEt+NHOVmYg/bamJkfG/MPT5fY3Kqn4NspqUk+lJQbtldqVLfHNQ5/S+p7G9/+
 HSxTGfn4aXuer1JVJbJCfJZUh4AgzFTKd59GAbwdHt078PxIqIMmV/HyY4iX+FLor4hSMr
 jIGuWOAewAzR5VjeJujMcxfDLDVntX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625650976;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R55Gk+D8yvX2B+whG/zqiXVyl5HfIKERx04ZpHRz3gI=;
 b=ulRqnex9lKSk2OwlvR2lfcoPXobJ55dTAQ8JeXyjKZnpeZXcUVyJZ3+55N81VTtioD4sbz
 bLs6B8/tf1zGB5Bg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E2E07A3B99;
 Wed,  7 Jul 2021 09:42:55 +0000 (UTC)
References: <20210706142325.11347-1-rpalethorpe@suse.com>
 <ce948ff6-4115-338c-7990-d27df8658534@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <ce948ff6-4115-338c-7990-d27df8658534@jv-coder.de>
Date: Wed, 07 Jul 2021 10:42:55 +0100
Message-ID: <87czru7940.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] wait403: Reproduce undefined INT_MIN negation
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> Hi Richard,
>
> On 7/6/2021 4:23 PM, Richard Palethorpe via ltp wrote:
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>   runtest/syscalls                           |  1 +
>>   testcases/kernel/syscalls/wait4/.gitignore |  1 +
>>   testcases/kernel/syscalls/wait4/wait403.c  | 40 ++++++++++++++++++++++
>>   3 files changed, 42 insertions(+)
>>   create mode 100644 testcases/kernel/syscalls/wait4/wait403.c
>>
>> diff --git a/runtest/syscalls b/runtest/syscalls
>> index 98fe3c02e..128eaadd2 100644
>> --- a/runtest/syscalls
>> +++ b/runtest/syscalls
>> @@ -1663,6 +1663,7 @@ wait02 wait02
>>     wait401 wait401
>>   wait402 wait402
>> +wait403 wait403
>>     waitpid01 waitpid01
>>   waitpid02 waitpid02
>> diff --git a/testcases/kernel/syscalls/wait4/.gitignore b/testcases/kernel/syscalls/wait4/.gitignore
>> index 9313eb72c..577f73479 100644
>> --- a/testcases/kernel/syscalls/wait4/.gitignore
>> +++ b/testcases/kernel/syscalls/wait4/.gitignore
>> @@ -1,2 +1,3 @@
>>   /wait401
>>   /wait402
>> +/wait403
>> diff --git a/testcases/kernel/syscalls/wait4/wait403.c b/testcases/kernel/syscalls/wait4/wait403.c
>> new file mode 100644
>> index 000000000..262351b7c
>> --- /dev/null
>> +++ b/testcases/kernel/syscalls/wait4/wait403.c
>> @@ -0,0 +1,40 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com>
>> + */
>> +
>> +/*
>> + * [Description]
>> + *
>> + * Check wait4(INT_MIN, ...) is not allowed. The pid is negated before
>> + * searching for a group with that pid. Negating INT_MIN is not
>> + * defined so UBSAN will be triggered if enabled.
>> + *
>> + * If the bug is present, but UBSAN is not enabled, then it should
>> + * result in ECHILD.
>> + */
>> +
>> +#include <stdlib.h>
>> +#include <errno.h>
>> +#define _USE_BSD
>> +#include <sys/types.h>
>> +#include <sys/resource.h>
>> +#include <sys/wait.h>
>> +#include "tst_test.h"
>> +
>> +static void run(void)
>> +{
>> +	int status = 1;
>> +	struct rusage rusage;
>> +
>> +	TST_EXP_FAIL2(wait4(-2147483648, &status, 0, &rusage), ESRCH,
>> +		      "wait4 fails with ESRCH");
> Could this use INT_MIN instead of the literal value? If not a comment
> would be nice, especially because there is already wait4(INT_MIN, ...) 
> in the description.

OK, I will roll another patch.

>> +}
>> +
>> +static struct tst_test test = {
>> +	.test_all = run,
>> +	.taint_check = TST_TAINT_W | TST_TAINT_D,
>> +	.tags = (const struct tst_tag[]) {
>> +		{"linux-git", "dd83c161fbcc"},
>> +	}
>> +};
>
> Otherwise:
>
> Acked-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>

Thanks.

>
>
> Joerg


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
