Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47B3AAEF6
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 10:40:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B43093C7182
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Jun 2021 10:40:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DB79E3C2E09
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 10:40:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2385F600F1D
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 10:40:40 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 93E711FDBF
 for <ltp@lists.linux.it>; Thu, 17 Jun 2021 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623919240;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=caufQiHjakDETMBTjoE/0Anoterz+IUuHSw1X4whQfE=;
 b=GZtPVBwY54uXA+Q3U93LpMWN2QOnYRnDX1NU6LsMNGzFDbhr/6RJqfpxbt9uJ8yLvWzLaj
 27MKvK4kCevj2x4fkpcKrP0n4oo/pcu3aJ/PP63HU73WbhH5t0OeseMn38cHDXFCpc3xrL
 8ZU9fVSZRvs3UgqfeMRFGqsAttaiWbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623919240;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=caufQiHjakDETMBTjoE/0Anoterz+IUuHSw1X4whQfE=;
 b=jnUjq0dyMqCHaj+iViZQJpQC7iekxmNhz7AYuoz1xc+zGrvZqsdsN59OQJgHWabpk6R1Dm
 jQu1eqos5gt5uAAA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5A7E2A3BBA;
 Thu, 17 Jun 2021 08:40:40 +0000 (UTC)
References: <20210615074045.23974-1-rpalethorpe@suse.com>
 <20210615074045.23974-3-rpalethorpe@suse.com> <YMirQoiYRYsDP7Sb@yuki>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
In-reply-to: <YMirQoiYRYsDP7Sb@yuki>
Date: Thu, 17 Jun 2021 09:40:39 +0100
Message-ID: <87czsk51fc.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 3/3] API: Remove TST_ERR usage from
 rtnetlink/netdevice
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
>> The test author is guaranteed that the library will not set TST_ERR
>> except via the TEST macro and similar.
>> 
>> Currently the rtnetlink & netdevice API returns 0 on fail and 1 on
>> success. Either TST_ERR or errno is used to store the error
>> number. The commit stays with this scheme except that we only use
>> errno. This means that we have to temporarily save errno when it would
>> be overwritten by a less important operation.
>
> I do not like this fix. If nothing else it's fragile and would make any
> patch review for these libraries much harder.
>
> I would prefer having these functions modified to return the errors
> instead even if I have to do the work.

I think there are some other issues here as well. Like the macros are
not prefixed with SAFE_. A lot of the functions are not used or they are
just used internally, but are not marked as static.

I guess there are more tests on the way that use these
functions. However it is difficult to update the API, if you don't know
how it will be used. I like to have a concrete usecase for what I am
working on, especially if it's not code I have a lot of vision for.

I'd prefer to remove the stuff which is unused before making significant
changes to the library. Also mark internal functions as static and
remove the headers.

Also, it seems the problem functions are actually internal and not used
by the test. If they are marked static, then I don't see any problem
with them being inconsistent with the public API.

This may create more work for Martin, but any sweeping changes made by
myself or Cyril will probably break any WIP tests and need to be
changed.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
