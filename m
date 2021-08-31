Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EC3FC4C3
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:39:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E2533C2AE0
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 11:39:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C66EC3C2A3D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:39:24 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D3AB31A00CA7
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 11:39:23 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 4A995221C2
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630402763;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YLd2HpJXVThDSwY55S4cTWwGTpBy2h14ZvhShUSimHg=;
 b=V8gJiXAj6NjMlOTk/W4SecusxhUTI1HG1NSs0wIVeo5gyYTu2ptVEI/twMbuow0UG2frZ/
 t8G6HZl19Q3CT/+xtyoQI1iPDV9MMupbaSTPfjOmkzjKRPXf+vK9VbcKFu8OoU/rCyO/Bx
 W7c6gJ1g/PaZqOHVZPaiI50g6BmBgHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630402763;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YLd2HpJXVThDSwY55S4cTWwGTpBy2h14ZvhShUSimHg=;
 b=0Yo7lLyyzO78+TMFXxQNzbHiFFTTryJxBf0fmaNc+xQK+XU1G9M6B3Z87KgA6727/CcbII
 wF+NqRNm3yrVqMCw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 1543EA3B91;
 Tue, 31 Aug 2021 09:39:23 +0000 (UTC)
References: <20210824101042.11772-1-rpalethorpe@suse.com>
 <YS0w6y6wxn6CjLur@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YS0w6y6wxn6CjLur@pevik>
Date: Tue, 31 Aug 2021 10:39:22 +0100
Message-ID: <878s0ikl6d.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel/irq: Add irqbalance01
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

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
> LGTM, only few nits found bellow (easily fixed before merge)

Thanks, but I also changed the printf to tst_printf which should be
added in the bpf_prog05 patch set. So I can post V2 after that is
merged.

>
> ...
>> +++ b/testcases/kernel/irq/.gitignore
>> @@ -0,0 +1 @@
>> +irqbalance01
> /irqbalance01
>
>> diff --git a/testcases/kernel/irq/Makefile b/testcases/kernel/irq/Makefile
>> new file mode 100644
>> index 000000000..085e06fac
>> --- /dev/null
>> +++ b/testcases/kernel/irq/Makefile
>> @@ -0,0 +1,9 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +top_srcdir		?= ../../..
>> +
>> +include $(top_srcdir)/include/mk/testcases.mk
>> +
>> +INSTALL_TARGETS		:= *.sh
> This should be removed (probably copy paste error
>> +
>> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
>> diff --git a/testcases/kernel/irq/irqbalance01.c b/testcases/kernel/irq/irqbalance01.c
>> new file mode 100644
>> index 000000000..0a476839c
>> --- /dev/null
>> +++ b/testcases/kernel/irq/irqbalance01.c
>> @@ -0,0 +1,288 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/* Copyright (c) 2021 SUSE LLC <rpalethorpe@suse.com> */
>> +/*\
>> + * [Description]
>> + *
>> + * Check that something (e.g. irqbalance daemon) is performing IRQ
>> + * load balancing.
>> + *
>> + * On most systems userland needs to set /proc/irq/$IRQ/smp_affinity
>> + * to prevent many IRQs being delivered to the same CPU.
>> + *
>> + * Note some drivers and IRQ controllers will distribute IRQs
>> + * evenly. Some systems will have housekeeping CPUs configured. Some
>> + * IRQs can not be masked etc. So this test is not appropriate for all
>> + * scenarios.
>> + *
>> + * Furthermore, exactly how IRQs should be distributed is a
>> + * performance and/or security issue. This is only a generic smoke
>> + * test. It will hopefully detect misconfigured systems and total
>> + * balancing failures which are often silent errors.
>> + *
>> + * Heuristic: Evidence of Change
> Add blank new line here to get better docparse formatting:
>
>> + * 1. Find IRQs with a non-zero count
>> + * 2. Check if they are now disallowed
> LGTM. It'd be interesting to hear opinion of IRQ subsystem maintainer
> Thomas Gleixner.

I guess I can copy them in on V2.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
