Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 667A24548F5
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 15:37:50 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BC1C53C8819
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Nov 2021 15:37:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A02493C292B
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 15:37:45 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B9651200923
 for <ltp@lists.linux.it>; Wed, 17 Nov 2021 15:37:44 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DD0DF1FD33;
 Wed, 17 Nov 2021 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637159863;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8wmJRzovC2NDCukNqsMz1IizBOBnZEzImDEwDhLL6hs=;
 b=dfpDz9SCp9RZ+V022fKOgIwO362e4BAIzM5nEK6vBjbDtJWwFFxvui8CJ0g7G+CSWYjz4n
 U6tnbN6bANgGSDEt2Zu+FZzcOx1xREttO3fWBAkcuAxYJAmNbAGUscb64KAYaxsi9l6jNp
 hYav677AI7G+6v8u2nt1GLFE3PRW4AI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637159863;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8wmJRzovC2NDCukNqsMz1IizBOBnZEzImDEwDhLL6hs=;
 b=8tzyBIMxrM1z6LDTvecLXZEQLTWdJrmSDC8EVeqRhOUt/0XXN2fErXlP7qBfRt5KRPaQcd
 QYen+9o6ZUlKGrDg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A0E05A3B89;
 Wed, 17 Nov 2021 14:37:43 +0000 (UTC)
References: <20211117070708.2174932-1-liwang@redhat.com>
 <77e0b8b9-5de6-73ab-0f73-e3d95bad0935@jv-coder.de>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
Date: Wed, 17 Nov 2021 14:25:12 +0000
In-reply-to: <77e0b8b9-5de6-73ab-0f73-e3d95bad0935@jv-coder.de>
Message-ID: <87ilwqalvs.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: adding .supported_archs field in
 tst_test structure
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
> On 11/17/2021 8:07 AM, Li Wang wrote:
>> Testcases for specific arch should be limited on that only being supported
>> platform to run, we now involve a .supported_archs to achieve this feature
>> in LTP library. All you need to run a test on the expected arch is to set
>> the '.supported_archs' array in the 'struct tst_test' to choose the required
>> arch list. e.g.
>>
>>      .supported_archs = (const char *const []){"x86_64", "ppc64", NULL}
>>
>> This helps move the TCONF info from code to tst_test metadata as well.
>
> while I do like this, I wonder if it wouldn't be better to do this
> using kernel config. IIRC there are config switches
> for all architectures. Further more this would allow adding more
> complex conditions in the future.
>
> E.g: I am pretty sure, that there are some syscalls, that have existed
> "forever" in x86_64, but where only added
> in a specific version for aarch64. By making the arch a separate
> option, there is no way, to model this.
> If it was done in the kernel config check, it could be possible to add
> version and arch checks like
> (CONFIG_AARCH64 && CONFIG_VERSION > 5.3) || CONFIG_X86_64
>
> While this probably does not produce a very good error message, it is
> more versatile.
>
> Sorry for this late questioning the whole approach.

It should never be too late IMO. We should also consider whether there
are existing tst_test flags which have been made redundant by kconfig.

I suspect the main issue would be meta-data. As an arbitrarily
complicated kconfig expression may confuse test harnesses.

It might be better for us to tackle that issue and use kconfig though.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
