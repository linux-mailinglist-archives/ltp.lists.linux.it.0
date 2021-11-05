Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9483D4461CD
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 11:00:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5E64B3C7369
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 11:00:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BD8403C6A2E
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 11:00:07 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B654B20108C
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 11:00:05 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 2E2F91FD47;
 Fri,  5 Nov 2021 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636106405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3WBB03aog6geq1DvSLrDWyWAvby++7Yz6YSc3fc5Js=;
 b=riWI/hUNJrnDbigyKRNG5WgVDC6nTKo3PeQ+W1qP/mQ3InDRpFiUoIhUgFi1dlM7v7As+U
 g2DebOKQyDo/1Q+pFwwnX4Ab6niiXVjx7KNTlT5l2NAUZhvmnd9mOW8FWfKJ3Xd7eLRcmi
 Y1Ie4MTVwoDWtKHR/yXsWVBx89vgHDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636106405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3WBB03aog6geq1DvSLrDWyWAvby++7Yz6YSc3fc5Js=;
 b=39tqPkO4DU3ZLeCTto+k2aYS2omyQsVBdcA3f05B4INClNR7/1tkWpsQzUWrNkJBtAP7ZK
 9Vevw1gdYtg++gCg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C02232C150;
 Fri,  5 Nov 2021 10:00:04 +0000 (UTC)
References: <20190615042048.29839-1-liwang@redhat.com> <877ddpo35n.fsf@suse.de>
 <CAEemH2fDxJ1xQ9qNejHDxv0p_Cx2cq5LsXTesuhAEBrDe43Hmg@mail.gmail.com>
 <YYKYR4kspdlXuoDB@yuki>
 <CAEemH2e4sp_CYbAF05EA80Y1ggVG6yjRFp=-4EOudGBjTh7Wkg@mail.gmail.com>
 <YYO1WZh7Kz+en5nY@yuki>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 05 Nov 2021 09:47:30 +0000
In-reply-to: <YYO1WZh7Kz+en5nY@yuki>
Message-ID: <87ee7u9b30.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] lib: adding .arch field in tst_test
 structure
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> > least array of supported architectures in the test_test structure would
>> > be a good addition.
>> >
>> 
>> I guess defining .arch as a string and making a valid check will be enough.
>> Array for that sounds a bit complicated in use.
>
> Quite the opposite, it should be an array of strings, so that it's easy
> to work with such as:
>
> 	.supported_archs = (const char *const []){"x86_64", "ppc64le", NULL},
>
> We can put it into a single string delimited by a space, but that would
> be more complicated to work with.
>
>> > However the hard part would be keeping the actual code and metadata in
>> > sync, we still have to keep the ifdefs in the code.
>> >
>> 
>> Yes, some inline assemble require ifdefs.
>> 
>> Btw, I look back at the reviews and find Jan said:
>>     "I can see how tst_on_arch() would be useful. Test is valid
>>      on all arches, but needs different input/constants/code/etc."
>> 
>> That may be a slight reason for keeping tst_on_arch.
>
> I guess that we should reviewe the code we have, I guess that there are
> a few tests where we can get rid of a few ifdefs by doing the checks
> dynamically.
>
> Also I guess that it would be slightly easier to work with as an enum,
> so that we can do:
>
> 	switch (tst_arch) {
> 	case TST_X86_64:
> 		...
> 	break;
> 	case TST_PPC64_LE:

I prefer enum as well. As an aside, we don't want to include LE in
ppc64. If someone finds that the byte order is significant for a test
then we can add ppc64le or ppc64be. Also at some point we may need to
add a "machine" field for e.g. POWER8, i386 etc.

Which btw, I have some buildroot and QEMU scripts which can be used to
test ppc64 BE and any other machine you have the hardware or QEMU
emulator for.

https://gitlab.com/Palethorpe/cross

> 		...
> 	break;
> 	default:
> 		...
> 	break;
> 	}
>
> instead of:
> 	if (!strcmp(tst_arch, "x86_64"))
> 		...
> 	else if (!strmcp(tst_arch, ...)))
> 		...
> 	else
> 		...


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
