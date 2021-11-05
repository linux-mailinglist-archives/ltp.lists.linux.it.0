Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63063446276
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 12:01:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 720933C7390
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 12:01:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 49BE13C4B8F
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 12:01:40 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 3FCC6600702
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 12:01:38 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 91F1F21892;
 Fri,  5 Nov 2021 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636110098;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kdnAhgC5ru5wVJV/+QXGuKT6ULgmdiQJAWyPE79WNpE=;
 b=BHMy8ihasX5zX92bnHJfOIOEx4Zhc5SpLzn8ANEg8ovOldVDNH03QVAAjuG19Zp7bRs0dx
 zzHevXOzyxIWVNNtQRnv11H7qDyac+yTgecnGeOS5utsy9ktNqSpRB1hSeKTCM8r6kEuXB
 sFpPJgs6DMk2wLRp7n+O7oUD11Sh0cc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636110098;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kdnAhgC5ru5wVJV/+QXGuKT6ULgmdiQJAWyPE79WNpE=;
 b=eA6Lx0QXXPjnDnZSO4foV67L79MFufDBXrCl87TbnT2dwc83TQXyULxFQYqxHkgEC0g0P6
 rje0iQpK/9vH4fBA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D46A32C144;
 Fri,  5 Nov 2021 11:01:37 +0000 (UTC)
References: <20210224165045.17738-1-chrubis@suse.cz>
 <20210224165045.17738-3-chrubis@suse.cz> <YDyaEd7xNx3NcMGE@pevik>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Fri, 05 Nov 2021 10:56:47 +0000
In-reply-to: <YDyaEd7xNx3NcMGE@pevik>
Message-ID: <875yt6988e.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH v2 2/5] lib: Add minimalistic
 json parser
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
Cc: Carlos Hernandez <ceh@ti.com>, Michal Simek <michals@xilinx.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>,
 ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

"Petr Vorel" <pvorel@suse.cz> writes:

> Hi Cyril,
>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
> Nice work!
>
>> +static int eatws(struct tst_json_buf *buf)
>> +{
>> +	while (!buf_empty(buf)) {
>> +		switch (buf->json[buf->off]) {
>> +		case ' ':
>> +		case '\t':
>> +		case '\n':
>> +		case '\f':
> Shouldn't there be '\r' as well? (handled at copy_str()).

Yeah, it seems to be in the spec.

At any rate, I wouldn't mind this patch being applied immediately
because there is more than one WIP it may be useful for.

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

>> +		break;
>> +		default:
>> +			goto ret;
>> +		}
>> +
>> +		buf->off += 1;
>> +	}
>> +ret:
>> +	return buf_empty(buf);
>> +}
>
>
> Kind regards,
> Petr
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#872): https://lists.yoctoproject.org/g/automated-testing/message/872
> Mute This Topic: https://lists.yoctoproject.org/mt/80881162/3616767
> Group Owner: automated-testing+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/automated-testing/unsub [rpalethorpe@suse.de]
> -=-=-=-=-=-=-=-=-=-=-=-


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
