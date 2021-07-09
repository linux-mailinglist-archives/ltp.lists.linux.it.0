Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA0F3C2037
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:49:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66DCB3C67FA
	for <lists+linux-ltp@lfdr.de>; Fri,  9 Jul 2021 09:49:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C66C23C6794
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:49:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 871981A016C2
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 09:49:26 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DEF92220AD
 for <ltp@lists.linux.it>; Fri,  9 Jul 2021 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625816965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JhPCLuEA/EEWhDlMEY9o8YLkrgkgle/tsUClAF1gGpg=;
 b=X08FqOGmO3zN/F6TBSMftJYx3Xfo+jlewyPH3YxH5evY90qqY84nsqg0mEu36h8Tn6K3AP
 GLx8O1EIA66ZZA21DmHRaC1GJCatixhzySCLR/4NrsKjK6aaywUpe7AOl9xeSj3GU8Ef61
 OrldB91OKtfJH4NX2op59I9KxcpqgCk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625816965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JhPCLuEA/EEWhDlMEY9o8YLkrgkgle/tsUClAF1gGpg=;
 b=tlDTD6pANKG1fYvfamIA2t0PJ6uX3SweiLEUmVYk/VCuCWt2OMBQJXHEdJ4tdMTMqnpDMq
 n/1yKPGB0rwIk8Dw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ABB62A3B9C;
 Fri,  9 Jul 2021 07:49:25 +0000 (UTC)
References: <20210629072710.23800-1-rpalethorpe@suse.com>
 <20210629072710.23800-4-rpalethorpe@suse.com> <YOb5g66KfDWx77Hr@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YOb5g66KfDWx77Hr@yuki>
Date: Fri, 09 Jul 2021 08:49:25 +0100
Message-ID: <874kd46i62.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/7] meltdown: Set CFLAGS for check targets
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

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> The include set in the CFLAGS is necessary for Sparse to parse the
>> test source. If a specific target has variables set on it. Then these
>> won't be available to the corresponding check-target. Usually this is
>> not a problem because most variables set on a target are just for
>> linking and the checker doesn't need them.
>> 
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>  testcases/cve/Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/testcases/cve/Makefile b/testcases/cve/Makefile
>> index ddf8b6fe1..7b011b6c9 100644
>> --- a/testcases/cve/Makefile
>> +++ b/testcases/cve/Makefile
>> @@ -19,6 +19,7 @@ cve-2014-0196:  LDLIBS += -lutil
>>  endif
>>  
>>  meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
>> +check-meltdown: CFLAGS += -I$(abs_srcdir)/../realtime/include
>
> Uff, this will likely bite us in a different ways later on.
>
> I guess that it would be cleaner to move the libtsc.h into top level
> include so that it's clear that the header is used in several tests.

+1

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
