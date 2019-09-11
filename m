Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D042AFFAA
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 17:10:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C62953C20C3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 17:10:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id C3D6A3C076F
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 17:10:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9CC6D60243F
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 17:10:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB08ABC46;
 Wed, 11 Sep 2019 15:10:14 +0000 (UTC)
References: <20190823094621.21747-1-rpalethorpe@suse.com>
 <20190904121147.26027-1-rpalethorpe@suse.com>
 <20190911144107.GA23680@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <20190911144107.GA23680@rei.lan>
Date: Wed, 11 Sep 2019 17:10:14 +0200
Message-ID: <878squlvhl.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] capability: Introduce capability API
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

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
> A few very minor points pointed out below, if you agree with these I can
> fix them up when applying the patch. Othat than these it looks fine.
>
>> diff --git a/lib/tst_capability.c b/lib/tst_capability.c
>> new file mode 100644
>> index 000000000..2b55849f7
>> --- /dev/null
>> +++ b/lib/tst_capability.c
>> @@ -0,0 +1,114 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
>> + */
>> +
>> +#include <string.h>
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
>
> Shouldn't we put these comments into the header instead?

Yes.

>
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
>> +	if (*set & mask) {
>> +		tst_res(TINFO, "Dropping %s(%d)", cap->name, cap->id);
>> +		*set &= ~mask;
>> +	}
>> +}
>> +
>> +static void do_cap_req(uint32_t *permitted, uint32_t *effective, uint32_t mask,
>> +		       const struct tst_cap *cap)
>> +{
>> +	if (!(*permitted & mask))
>> +		tst_brk(TCONF, "Need %s(%d)", cap->name, cap->id);
>> +
>> +	if (!(*effective & mask)) {
>> +		tst_res(TINFO, "Permitting %s(%d)", cap->name, cap->id);
>> +		*effective |= mask;
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
>> +	uint32_t *pE = &new[CAP_TO_INDEX(cap->id)].effective;
>> +	uint32_t *pP = &new[CAP_TO_INDEX(cap->id)].permitted;
>> +	uint32_t mask = CAP_TO_MASK(cap->id);
>> +
>> +	if (tst_capget(&hdr, cur))
>> +		tst_brk(TBROK | TTERRNO, "tst_capget()");
>> +
>> +	memcpy(new, cur, sizeof(new));
>> +
>> +	switch (act) {
>> +	case TST_CAP_DROP:
>> +		do_cap_drop(pE, mask, cap);
>> +		break;
>> +	case TST_CAP_REQ:
>> +		do_cap_req(pP, pE, mask, cap);
>> +		break;
>> +	default:
>> +		tst_brk(TBROK, "Unrecognised action %d", cap->action);
>> +	}
>> +
>> +	if (memcmp(cur, new, sizeof(new)) && tst_capset(&hdr, new))
>> +		tst_brk(TBROK | TERRNO, "tst_capset(%s)", cap->name);
>
> This is a bit ugly I would prefer:
>
> 	if (!memcmp(cur, new, sizeof(new))
> 		return;
>
> 	if (tst_capset(&hdr, new))
> 		tst_brk(...);
>

OK

Thanks a bunch!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
