Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 978413E0E77
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:37:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5D1523C7D7D
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Aug 2021 08:37:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 029F53C7D1F
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:37:54 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6C01660071A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 08:37:54 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A2A2C1FE2A
 for <ltp@lists.linux.it>; Thu,  5 Aug 2021 06:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628145473;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGYajQmQj2hsFIRE+ygulxu22F2+dh4AnrAQzgEolSM=;
 b=cS7xR0Wq1DdPKrXRJXFAn2FUWn02xGiDOY++xmhlWb/WSbblsFIBGl8c66p+kE+cQUwhAb
 f2TPbDfHaPdY9HSbMU3s/x8+9eGYw6bDFnC8cAHe5bfTqMwd9Bmzs0dXRoVVNcFUXKuayx
 Im/xhw/hyUicE6QYbzFhHNjPqHyFkvU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628145473;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TGYajQmQj2hsFIRE+ygulxu22F2+dh4AnrAQzgEolSM=;
 b=OAwgntkrFsJ+Dga2ZxTAz1DcOwI7BFUq38AMndM1UgRpyzIpHfuIa2wu9rr9pCAVphdTNR
 W1Wf8H3+SeEBAoCQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6E1A8A3B8D;
 Thu,  5 Aug 2021 06:37:53 +0000 (UTC)
References: <87czquna4l.fsf@suse.de>
 <20210803125252.16214-1-rpalethorpe@suse.com> <YQlhQa/q55F98Gui@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YQlhQa/q55F98Gui@yuki>
Date: Thu, 05 Aug 2021 07:37:47 +0100
Message-ID: <87a6lwmm6c.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/3] API: TST_EXP_FAIL: Allow passing when
 errno is not checked
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
>> Judging by the existing usage of TST_EXP_FAIL(..., 0, ...) in
>> finit_module02. We want to pass if errno == 0 otherwise the test will
>> not return a result.
>
> This is actually not true, we do not pass 0 to TST_EXP_FAIL() in
> finit_module() at all. The places that are not initialized in the
> structure are initialized at runtime based on the kernel version. I do
> not think that we even pass 0 to TST_EXP_FAIL*() as an errno anywhere,
> but I haven't really checked all the callers.
>
>> This is also less surprising than giving errno == 0 a dual
>> meaning.
>
> But I do agree that the current if (ERRNO) branch is confusing. I would
> be for dropping the if (ERRNO) and checking the TST_ERR against ERRNO
> unconditionally.
>
> Also note that the TEST() macro clears errno, so if a syscall fails but
> does not report any error TST_ERR will end up 0 either way so there is
> no need for having special handling for 0.

There is if the errno is set, but is undefined. Like if the resulting
errno is platform or config dependent.

In the present case though we can just check for EINVAL. That is what
the setsockopt man page indicates. Initially I wasn't sure if EFAULT
were equally valid, but it seems not.

I suppose we can fall back to using TEST() if the other case arises.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
