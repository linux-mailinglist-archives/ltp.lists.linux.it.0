Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 887BF72E86
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 14:15:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B63F13C1D1B
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 14:15:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 4A23A3C18F7
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 14:15:20 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7910E20117A
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 14:15:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD355AC97
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:15:18 +0000 (UTC)
References: <20190724080328.16145-1-rpalethorpe@suse.com>
 <20190724080328.16145-3-rpalethorpe@suse.com>
 <20190724091851.GA4917@dell5510>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20190724091851.GA4917@dell5510>
Date: Wed, 24 Jul 2019 14:15:18 +0200
Message-ID: <87ftmvd3xl.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] BPF: Sanity check creating and updating maps
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


Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> LGTM with minor comments.
>
> ...
>> diff --git a/testcases/kernel/syscalls/bpf/bpf_map01.c b/testcases/kernel/syscalls/bpf/bpf_map01.c
> ...
>> +#include <limits.h>
>> +#include <string.h>
>> +
>> +#include "config.h"
>> +#include "tst_test.h"
>> +#include "lapi/bpf.h"
>> +
>> +#define KEY_SZ 8
>> +#define VAL_SZ 1024
>> +
>> +struct map_type {
>> +	uint32_t id;
>> +	char *name;
>> +};
>> +
>> +static const struct map_type map_types[] = {
>> +	{BPF_MAP_TYPE_HASH, "hash"},
>> +	{BPF_MAP_TYPE_ARRAY, "array"}
>> +};
>> +
>> +static void *key;
>> +static void *val0;
>> +static void *val1;
>> +
>> +static void setup(void)
>> +{
>> +	key = SAFE_MALLOC(KEY_SZ);
>> +	memset(key, 0, (size_t) KEY_SZ);
>> +	val0 = SAFE_MALLOC(VAL_SZ);
>> +	val1 = SAFE_MALLOC(VAL_SZ);
>> +	memset(val1, 0, (size_t) VAL_SZ);
>> +}
>> +
>> +void run(unsigned int n)
>> +{
>> +	int fd, i;
>> +	union bpf_attr attr;
>> +	memset(&attr, 0, sizeof(attr));
>> +	attr.map_type = map_types[n].id;
>> +	attr.key_size = n == 0 ? KEY_SZ : 4;
> Out of curiosity why 4? As whole test is working for KEY_SZ >= 1 (but for second
> test it's needed to be 4).

The second test is for an array map type which only supports 32bit integer indexes.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
