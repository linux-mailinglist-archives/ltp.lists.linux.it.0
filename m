Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E155797831
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 13:43:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8F2B33C1CF8
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 13:43:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5A72D3C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 13:43:37 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 54BC3600801
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 13:43:35 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 702B4AE60
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 11:43:34 +0000 (UTC)
References: <20190808153825.18363-1-rpalethorpe@suse.com>
 <20190808153825.18363-2-rpalethorpe@suse.com>
 <20190809122741.GC32115@rei.lan>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <20190809122741.GC32115@rei.lan>
Date: Wed, 21 Aug 2019 13:43:34 +0200
Message-ID: <87wof6vj4p.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] capability: Introduce capability API
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
Cc: Michael Moese <mmoese@suse.com>, ltp@lists.linux.it,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

>> +
>> +struct tst_cap_user_header {
>> +	uint32_t version;
>> +	int pid;
>> +};
>> +
>> +struct tst_cap_user_data {
>> +	uint32_t effective;
>> +	uint32_t permitted;
>> +	uint32_t inheritable;
>> +};
>
> This two should probably go to lapi as well.

Ah, but the naming of the original structures is so bad.

typedef struct __user_cap_header_struct {
        ...
} __user *cap_user_header_t.

Well not necessarily bad, but against current naming guidelines. I would
rather just use our own definitions and keep them separate from any
fallback definitions for test writers.

>
>> +struct tst_cap {
>> +	uint32_t action;
>> +	uint32_t id;
>> +	char *name;
>> +};
>
> I wonder if we should build a table of capability names for translation
> just as we do errnos and signals instead of storing the name here. But I
> guess that unless we will need a function to translate capabilitities
> into strings on runtime this approach is simpler.

I suppose if we want to print all the current capabilities then we need
this. Which I can imagine would be useful, but I would rather wait until
someone actually needs it.


--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
