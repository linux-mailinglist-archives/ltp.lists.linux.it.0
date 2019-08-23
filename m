Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 865289AA78
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 10:37:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 195CA3C1D47
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 10:37:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 046D83C1770
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 10:37:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 171866011F9
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 10:37:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 88FADAC6E;
 Fri, 23 Aug 2019 08:37:04 +0000 (UTC)
References: <20190808153825.18363-2-rpalethorpe@suse.com>
 <20190822141713.26825-1-rpalethorpe@suse.com>
 <5D5F6A8F.2040203@cn.fujitsu.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
In-reply-to: <5D5F6A8F.2040203@cn.fujitsu.com>
Date: Fri, 23 Aug 2019 10:37:04 +0200
Message-ID: <87sgpsuvkf.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] capability: Introduce capability API
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
Cc: ltp@lists.linux.it, Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Yang Xu <xuyang2018.jy@cn.fujitsu.com> writes:

> on 2019/08/22 22:17, Richard Palethorpe wrote:
>
>> diff --git a/lib/tst_capability.c b/lib/tst_capability.c
>> new file mode 100644
>> index 000000000..7e6c56e1d
>> --- /dev/null
>> +++ b/lib/tst_capability.c
>> @@ -0,0 +1,110 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2019 Richard Palethorpe<rpalethorpe@suse.com>
>> + */
>> +
>> +#include<string.h>
>> +
>> +#define TST_NO_DEFAULT_MAIN
>> +#include "tst_test.h"
>> +#include "tst_capability.h"
>> +
>> +#include "lapi/syscalls.h"
>> +
>> +/**
>> + * Get the capabilities as decided by hdr.
>> + *
>> + * Note that the memory pointed to by data should be large enough to store two
>> + * structs.
>> + */
>> +int tst_capget(struct tst_cap_user_header *hdr,
>> +	       struct tst_cap_user_data *data)
>> +{
>> +	return tst_syscall(__NR_capget, hdr, data);
>> +}
>> +
>> +/**
>> + * Set the capabilities as decided by hdr and data
>> + *
>> + * Note that the memory pointed to by data should be large enough to store two
>> + * structs.
>> + */
>> +int tst_capset(struct tst_cap_user_header *hdr,
>> +	       const struct tst_cap_user_data *data)
>> +{
>> +	return tst_syscall(__NR_capset, hdr, data);
>> +}
>> +
>> +static void do_cap_drop(uint32_t *set, uint32_t mask, const struct tst_cap *cap)
>> +{
>> +	if (*set&  mask) {
>> +		tst_res(TINFO, "Dropping %s(%d)", cap->name, cap->id);
>> +		*set&= ~mask;
>> +	}
>> +}
> If we drop a cap twice, the second drop reports nothing. I think we should print it as below:
>
> as below:
>
> @ -40,7 +40,10 @@ static void do_cap_drop(uint32_t *set, uint32_t mask, const struct tst_cap *cap)
> 	if (*set&  mask) {
> 		tst_res(TINFO, "Dropping %s(%d)", cap->name, cap->id);
> 		*set&= ~mask;
> -       }
> +       } else
> +               tst_res(TINFO,
> +                       "%s(%d) has not been in effective set before dropping",
> +                       cap->name, cap->id);
>

I think it should only print something if an action is required. Stating
that we already have or don't have a capability is noise. If it prints
nothing this tells the user the same thing.

>
>
>> +
>> +static void do_cap_req(uint32_t *set, uint32_t mask, const struct tst_cap *cap)
>> +{
>> +	if (!(*set&  mask))
>> +		tst_brk(TCONF, "Need %s(%d)", cap->name, cap->id);
>> +
> here has logic problem.  :-)  If set has not the cap, we should use
> set |mask instead of tst_brk.

Ah, I see I broke my original logic here completely which is why this
makes no sense. xD

>
> code should be as below:
>
>            if ((*set&  mask)) {
>                  tst_res(TINFO,
>                        "%s(%d) has been in effective set before requring",
>                        cap->name, cap->id);
>                return;
>        } else {
>                 tst_res(TINFO, "Permitting %s(%d)", cap->name, cap->id);
>                 *set |= mask;
>
>         }
>
>> +	if (!(*set&  mask)) {
>> +		tst_res(TINFO, "Permitting %s(%d)", cap->name, cap->id);
>> +		*set |= mask;
>> +	}
>> +}
>> +
>> +/**
>> + * Add, check or remove capabilities
>> + *
>> + * Takes a NULL terminated array of structs which describe whether some
>> + * capabilities are needed or not.
>> + *
>> + * It will attempt to drop or add capabilities to the effective set. It will
>> + * try to detect if this is needed and whether it can or can't be done. If it
>> + * clearly can not add a privilege to the effective set then it will return
>> + * TCONF. However it may fail for some other reason and return TBROK.
>> + *
>> + * This only tries to change the effective set. Some tests may need to change
>> + * the inheritable and ambient sets, so that child processes retain some
>> + * capability.
>> + */
>> +void tst_cap_action(struct tst_cap *cap)
>> +{
>> +	struct tst_cap_user_header hdr = {
>> +		.version = 0x20080522,
>> +		.pid = tst_syscall(__NR_gettid),
>> +	};
>> +	struct tst_cap_user_data cur[2] = { {0} };
>> +	struct tst_cap_user_data new[2] = { {0} };
>> +	uint32_t act = cap->action;
>> +	uint32_t *set =&new[CAP_TO_INDEX(cap->id)].effective;
>> +	uint32_t mask = CAP_TO_MASK(cap->id);
>> +
>> +	if (tst_capget(&hdr, cur))
>> +		tst_brk(TBROK | TTERRNO, "tst_capget()");
>> +
>> +	memcpy(new, cur, sizeof(new));
>> +
>> +	switch (act) {
>> +	case TST_CAP_DROP:
>> +		do_cap_drop(set, mask, cap);
>> +		break;
>> +	case TST_CAP_REQ:
>> +		do_cap_req(set, mask, cap);
>> +		break;
>> +	default:
>> +		tst_brk(TBROK, "Unrecognised action %d", cap->action);
>> +	}
>> +
>> +	if (memcmp(cur, new, sizeof(new))&&  tst_capset(&hdr, new))
>> +		tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);
>> +}
>> +
>> +void tst_cap_setup(struct tst_cap *caps)
>> +{
>> +	struct tst_cap *cap;
>> +
>> +	for (cap = caps; cap->action; cap++)
>> +		tst_cap_action(cap);
>> +}
>> diff --git a/lib/tst_test.c b/lib/tst_test.c
>> index 245e287fa..8d5fbd1f9 100644
>> --- a/lib/tst_test.c
>> +++ b/lib/tst_test.c
>> @@ -888,6 +888,9 @@ static void do_test_setup(void)
>>
>>   	if (main_pid != getpid())
>>   		tst_brk(TBROK, "Runaway child in setup()!");
>> +
>> +	if (tst_test->caps)
>> +		tst_cap_setup(tst_test->caps);
>>   }
>>
>>   static void do_cleanup(void)
> other than the minor things, this patch looks ok.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
