Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5123BC824
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 10:54:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 93B813C89E1
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 10:54:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D62D3C1821
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 10:54:01 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A84751000952
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 10:54:00 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A97411FF35
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 08:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625561639;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1ha39PXnUiVhnBLLdzd+pNI5r7EmTikn8gR97cBOC0=;
 b=bmiWRxL9M0mDAu9F9r4cGOAXHCKtgJ5a6yEX4JOTp+B797clciElR+zTfz0xYqoJM2gtgO
 +bNhbPP4ikdg1FkFJSL9jxVVVno4OO2jR1V9FTWNPQQ2zq+Nb4j9wiM0mLWSiwHmqQFi+C
 jRTFLPMtqga50x1yEEjHG3OzaBOssds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625561639;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M1ha39PXnUiVhnBLLdzd+pNI5r7EmTikn8gR97cBOC0=;
 b=cBbmr0+jp54HjhcxEdfmKLlaW9ogzYBBpXWQXsobYVJ8Sq2MPAlvxB3eF2hNHuCw+PJiTG
 zkzmiFVStJuqYxDw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3A18DA3B98;
 Tue,  6 Jul 2021 08:53:59 +0000 (UTC)
References: <20210702123533.18008-1-rpalethorpe@suse.com>
 <YN8iG1fchuyC/SEI@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YN8iG1fchuyC/SEI@yuki>
Date: Tue, 06 Jul 2021 09:53:51 +0100
Message-ID: <8735sr961s.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] vsock01,
 CVE-2021-26708: Add reproducer for race condition
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

Hello Cyril,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> diff --git a/include/lapi/vm_sockets.h b/include/lapi/vm_sockets.h
>> new file mode 100644
>> index 000000000..94d0248c5
>> --- /dev/null
>> +++ b/include/lapi/vm_sockets.h
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2021 SUSE LLC <rpalethorpe@suse.com>
>> + */
>> +
>> +#include <sys/socket.h>
>> +
>> +#if HAVE_LINUX_VM_SOCKETS_H
>> +#  include <linux/vm_sockets.h>
>> +#endif
>> +
>> +#ifndef VMADDR_CID_LOCAL
>> +#  define VMADDR_CID_LOCAL 1
>> +#endif
>
> I've added guards to this header.
>
>> +#include "config.h"
>> +#include "tst_test.h"
>> +
>> +#if HAVE_LINUX_VM_SOCKETS_H
>> +#  include "tst_fuzzy_sync.h"
>> +#  include "lapi/vm_sockets.h"
>> +
>> +static struct tst_fzsync_pair pair;
>> +int vsock = -1;
>> +
>> +void *writer(LTP_ATTRIBUTE_UNUSED void *unused)
>> +{
>> +	const uint64_t b_buflen = 0x4141;
>> +
>> +	while (tst_fzsync_run_b(&pair)) {
>> +		tst_fzsync_start_race_b(&pair);
>> +		SAFE_SETSOCKOPT(vsock, AF_VSOCK,
>> +				SO_VM_SOCKETS_BUFFER_SIZE,
>> +				&b_buflen, sizeof(b_buflen));
>> +		tst_fzsync_end_race_b(&pair);
>> +	}
>> +
>> +
>> +	return NULL;
>> +}
>
> And sprinkled a few 'static' keywords here, and pushed, thanks.

Just noting; this would be caught by Wmissing-declarations.


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
