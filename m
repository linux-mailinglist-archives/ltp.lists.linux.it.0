Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AB78D417057
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:30:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 130863C8F42
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Sep 2021 12:30:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1CEC93C848C
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:30:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CBF060222B
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 12:30:53 +0200 (CEST)
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out2.suse.de (Postfix) with ESMTP id 80F681FFE6
 for <ltp@lists.linux.it>; Fri, 24 Sep 2021 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632479453;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZgTkdxYvtxgmJkuqVy8mkZ7Xkxl2a1SZhv5CsWAw1+k=;
 b=I8CtE94Na0c23bI/RuPrqfjPHcsu2YMa+PualBTWmzW6EldM+rqGwcwPcvTVFXIBmPWAVn
 EgRqiCN7IoBvMNf7ddL12jA0XUeFAQYw99Z+Kai6zWM6fyCepJWcvQI+/JsINc/7h5vDt3
 5/YhNajJvOoq5czaNf1qcZojq9aUoHM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632479453;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZgTkdxYvtxgmJkuqVy8mkZ7Xkxl2a1SZhv5CsWAw1+k=;
 b=kiGGcyWIdV0W4fmwxbHhG2Yz9d6H3BZOEQVwK6Jg+eXS6um4RaIvfhry6v2so8IP2SzEhf
 /KYAUrY6kSFo2yAA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay1.suse.de (Postfix) with ESMTPS id 45D0E25D3E;
 Fri, 24 Sep 2021 10:30:53 +0000 (UTC)
References: <20210924092111.20012-1-rpalethorpe@suse.com>
 <YU2n6tamyCf13OS5@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YU2n6tamyCf13OS5@pevik>
Date: Fri, 24 Sep 2021 11:30:52 +0100
Message-ID: <878rzml0yr.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] msgrcv07: Check negative msg type filters
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
> ...
>> +++ b/testcases/kernel/syscalls/ipc/msgrcv/msgrcv07.c
>> @@ -232,6 +232,13 @@ static void test_negative_msgtyp(void)
>>  			"-msgtyp didn't get the first message in the queue with the lowest type");
>>  	}
>
>> +	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, IPC_NOWAIT),
>> +		     ENOMSG,
>> +		     "-msgtype didn't recv next lowest msg");
>> +	TST_EXP_FAIL(msgrcv(queue_id, &rcv_buf, MSGSIZE, -MSGTYPE1, MSG_EXCEPT | IPC_NOWAIT),
>> +		     ENOMSG,
>> +		     "-msgtype (with except) didn't recv next lowest msg");
> nit: I'd use msgtyp instead of msgtype (although it looks like typo, it's used
> without 'e' as a parametr name in man msgop(2) and also throughout this test
> (obviously can be changed during merge).

Sure, sounds good.

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
