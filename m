Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D855B422606
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Oct 2021 14:12:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 397113C95FD
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Oct 2021 14:12:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 131113C6C8D
 for <ltp@lists.linux.it>; Tue,  5 Oct 2021 14:12:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 76EDF1400191
 for <ltp@lists.linux.it>; Tue,  5 Oct 2021 14:12:46 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D36A5223E8;
 Tue,  5 Oct 2021 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633435965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DgGoH/2xdpZTReBmA50PSlyLH6UHt6X85N5P8Yw7wVI=;
 b=Bd/0gnnjJ1vY5bzNFB4vT3Sl/mK/VnIT95gQKYG946xEwVUkJNSEdYKAmdqkATqGCPKApO
 19RttNeMkWlo26o9GIbMvEbNmfyk1kgP75Pdjpox7vL1M0Hrv9gczniusOkOQAOfGV6tqg
 3pxhMzOnRu8sm/1jh7ucMXUXfZrfi7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633435965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DgGoH/2xdpZTReBmA50PSlyLH6UHt6X85N5P8Yw7wVI=;
 b=CQSdJhhe2NtqOOzy5jRnTxuBwzfXznqLGN3cn9wRoLpHz8YlD84vXnVOknIeIahYbv40TC
 KCFkZNNt7RQy12Cw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 999B0A3B84;
 Tue,  5 Oct 2021 12:12:45 +0000 (UTC)
References: <20210929085910.23073-1-rpalethorpe@suse.com>
 <YVqaH2wxGRegEfiR@pevik>
 <CAASaF6wtsAFJY8pkKdUSycFcaCQySL+xXLeUg8RrTRvxDdShLw@mail.gmail.com>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Jan Stancek <jstancek@redhat.com>
Date: Tue, 05 Oct 2021 13:04:51 +0100
In-reply-to: <CAASaF6wtsAFJY8pkKdUSycFcaCQySL+xXLeUg8RrTRvxDdShLw@mail.gmail.com>
Message-ID: <87ilybbrgo.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] clock_nanosleep01: Avoid dereferencing bad
 pointers in libc on 32bit
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

Hello Jan,

Jan Stancek <jstancek@redhat.com> writes:

> On Mon, Oct 4, 2021 at 8:07 AM Petr Vorel <pvorel@suse.cz> wrote:
>
>  Hi Richie,
>
>  > In 32-bit (regardless of kernel bits) glibc and musl will usually
>  > dereference the timespec pointers and try to read them. In some cases
>  > this might be avoidable, but they must do it in others.
>
>  > Passing invalid pointers is undefined in POSIX. In any case, AFAICT
>  > libc would have to catch the signal in order to guarantee EFAULT is
>  > returned.
>
>  LGTM.
>
>  Reviewed-by: Petr Vorel <pvorel@suse.cz>
>
>  > Possibly we shouldn't test things like this at all through libc
>  > wrappers.
>  Only for 32bit or also for 64 bit? Anyway, there has always been some cases
>  where bad addr testing was problematic (e.g. non-intel arch).
>
> I'd skip it for both, I recall that some implementations
> were crashing.

Yes, there is not much we can do if it fails.

>
> Acked-by: Jan Stancek <jstancek@redhat.com>
>  
>  
>  Kind regards,
>  Petr
>
>  -- 
>  Mailing list info: https://lists.linux.it/listinfo/ltp


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
