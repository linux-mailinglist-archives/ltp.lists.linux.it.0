Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C685F3C84F9
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:06:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F35B3C7754
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Jul 2021 15:06:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 611F03C245D
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:06:53 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 404C3200D40
 for <ltp@lists.linux.it>; Wed, 14 Jul 2021 15:06:52 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 89BC42029D;
 Wed, 14 Jul 2021 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626268012;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/dvYuwWF/gdUzYjmWbaLDENDqC8Ii0SKbd0Ei5gzm8=;
 b=aVLwNSkGlqEWD4em/zblaAiDQu3V6S0xqOJcEYuaXHMQ4dJ4w16WINS1xOQaxQfsQrR886
 z/YQQfX1jDFnzW2Muz9py34gVbDtLu3WLhkUfs6ryFJpabt6ygzJK6W2Vo7LeasWFEiqMs
 U/bQrhTsxNoVglZX10kKdBsk3D6jD/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626268012;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I/dvYuwWF/gdUzYjmWbaLDENDqC8Ii0SKbd0Ei5gzm8=;
 b=ylpUeaB8EDvJV/AbN3ji5bEhEO9KnkLm+wfgApcQFRK7kWMV/PY/R+n5TSLEIX1rdx39qg
 B5BicK0QwlA5LzBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5408FA3B88;
 Wed, 14 Jul 2021 13:06:52 +0000 (UTC)
References: <20210714071158.15868-1-rpalethorpe@suse.com>
 <20210714071158.15868-2-rpalethorpe@suse.com>
 <36430750-17c9-06e4-0f49-efc744116154@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <36430750-17c9-06e4-0f49-efc744116154@jv-coder.de>
Date: Wed, 14 Jul 2021 14:06:51 +0100
Message-ID: <87y2a9nixg.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/8] Add Sparse based checker and TST_RET/ERR
 check
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

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> Hi,
>
>
> On 7/14/2021 9:11 AM, Richard Palethorpe via ltp wrote:
>> Vendors in Sparse as a git module. Then uses it to check for stores to
>> TST_RET/ERR within the library.
>>
>> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
>> ---
>>   .gitmodules             |   3 +
>>   tools/Makefile          |   2 +
>>   tools/sparse/.gitignore |   1 +
>>   tools/sparse/Makefile   |  27 ++++++++
>>   tools/sparse/README.md  |  38 +++++++++++
>>   tools/sparse/main.c     | 148 ++++++++++++++++++++++++++++++++++++++++
> I think the name could be a bit better... sparse_main or ltp_checker
> or something, because a binary just called main could be confusing.

Sure or maybe sparse-ltp?

That would fit with upstream IMO.

>
> Otherwise good basis for additional checks and fixing the warnings
> emitted by sparse will allow use to raise the overall warning level.
> Hopefully at some point at least "-Wall -Werror" is possible.
>
> Joerg

Yes, I would really like to see -Wall enabled by default. Also Sparse
can maybe help highlight wierd crap only GCC and Clang accept.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
