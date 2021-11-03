Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D31B5444037
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:55:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9901F3C71C9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 11:55:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF3633C6E38
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:55:17 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2871D1A000B2
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 11:55:16 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 66FB72191A
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 10:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635936916;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N9gJR8zaMD+CFDd7BjHk3ERrzqhLJauo6I35ksn8fEU=;
 b=j/JH3m0i0cFD2BCWJlscZS9U9IpMGQYmv+3FetdK8PvtaqmUjnn5yhMwKm2y+xDgXeFWUK
 yJFr43Nvz+2xIlTXy+KdN9tfA52d+tCtymoMb/FdfHmIXaiGtyJ3V+HHDhc61TV+2Uu5mq
 SJy9D+bZ/dpSmnxHo/kGKDGc6tJkgMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635936916;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N9gJR8zaMD+CFDd7BjHk3ERrzqhLJauo6I35ksn8fEU=;
 b=GS3pXA2RyKRas8jMm50Fc03hcP2mtJwpIuEzLx0jNYh34rcyUGZhPvP41R+zlyUSUmv36U
 yntDupnhSNbnUgBA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3BB6A2C14A;
 Wed,  3 Nov 2021 10:55:16 +0000 (UTC)
References: <20211025160134.9283-1-chrubis@suse.cz>
 <20211025160134.9283-3-chrubis@suse.cz>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 03 Nov 2021 09:34:52 +0000
In-reply-to: <20211025160134.9283-3-chrubis@suse.cz>
Message-ID: <87bl31o6ek.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/6] lib: Add .max_runtime and
 tst_remaining_runtime()
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

> This is another attempt of decoupling test runtime from timeouts.

Do we have documentation explaining what runtimes and timeouts are?

These two words are interchangeable.

>
> Fundamentally there are two types of tests in LTP. First type are tests
> that are rather quick (much less than a second) and can live with
> whatever default timeout we set up. Second type of tests are tests that
> run in a loop until timeout or a number of iterations is reached, these
> are the tests that are going to be converted to the .max_runtime added
> by this patch and followups.

The code looks good, but this all feels quite hard to parse on a
more abstract level. I think it is because you are trying to over
generalise between different categories of test.

So we have tests which run to completion as fast as they can. Then we
have tests which iterate for some arbitrary time period (usually capped
by some number of iterations as well, but it's not important).

In the first case the concept of a target runtime makes no sense. So we
end up with 'max runtime' which is the same type of thing as the timeout
(although the value of timeout is greater).

In the second case, where the test tries to execute for some length of
time. Then the target runtime and timeout are really seperate things.

I would suggest renaming 'max_runtime' to just 'runtime' and make it
optional (defaults to 0). All tests which are of the second type can set
.runtime = DEFAULT_RUNTIME (or whatever). If the test tries to use
tst_remaining_runtime() without runtime being set, then an error is
thrown.

If runtime is present then it can simply be added to the timeout to
produce the "total timeout" (total_timeout = runtime + timeout).

This has the advantage of clearly showing in the meta data which tests
are likely to run for some time. Also it means that the concept of
'runtime' doesn't change depending on the type of test. Finally we can
set timeout very low by default.

So when calculating how long a test executable may run for we have

(runtime + timeout) * variants * iterations

The wording is still not great. runtime is more like "deliberate
runtime" and timeout is "maximal expected runtime after the deliberate
runtime".

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
