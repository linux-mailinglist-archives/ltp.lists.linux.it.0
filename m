Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A572BCE
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:55:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F420C3C1CF5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 11:55:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9D8293C13D8
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:55:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6CBD41A0145E
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 11:55:06 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2FCBAC67
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 09:55:05 +0000 (UTC)
References: <20190724080328.16145-1-rpalethorpe@suse.com>
 <20190724080328.16145-2-rpalethorpe@suse.com>
 <20190724092715.GB4917@dell5510>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <20190724092715.GB4917@dell5510>
Date: Wed, 24 Jul 2019 11:55:05 +0200
Message-ID: <87h87bdafa.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Essential headers for BPF map creation
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

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>> ---
>>  include/lapi/bpf.h               | 242 +++++++++++++++++++++++++++++++
>>  include/lapi/syscalls/aarch64.in |   1 +
>>  include/lapi/syscalls/i386.in    |   1 +
>>  include/lapi/syscalls/s390.in    |   1 +
>>  include/lapi/syscalls/sparc.in   |   1 +
>>  include/lapi/syscalls/x86_64.in  |   1 +
>>  6 files changed, 247 insertions(+)
>>  create mode 100644 include/lapi/bpf.h
>
>> diff --git a/include/lapi/bpf.h b/include/lapi/bpf.h
>> new file mode 100644
>> index 000000000..369de0175
>> --- /dev/null
>> +++ b/include/lapi/bpf.h
>> @@ -0,0 +1,242 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (c) 2019 Richard Palethorpe <rpalethorpe@suse.com>
>> + *
>> + * Essential Extended Berkeley Packet Filter (eBPF) headers
>> + *
>> + * Mostly copied/adapted from linux/bpf.h and libbpf so that we can perform
>> + * some eBPF testing without any external dependencies.
> Probably the only sane way. But it will be uncomfortable to keep the header
> updated. Simple copy of include/uapi/linux/bpf.h would be easier
> (but we'd require to have kernel headers anyway (<linux/types.h> and
> <linux/bpf_common.h>).

It hasn't been a problem in the past, we just need to add the missing
parts when adding a new test.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
