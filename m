Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9954BDA1E
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 15:15:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AE133CA165
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Feb 2022 15:15:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 338DF3C6AD5
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 15:15:39 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3049A1400759
 for <ltp@lists.linux.it>; Mon, 21 Feb 2022 15:15:38 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 38E591F38E;
 Mon, 21 Feb 2022 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645452938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMbhA1TmP3DHzyiV55nEbdvJkcjIy39w0mu+NnVnyDg=;
 b=n/YEXXpP9+Hj/s8M/NGx+B65JGg2UlRWJAtu5F2mNq5sVGxg2glPwiFAMTkvRiECsA4Fz9
 d2TINWMz49EZOqXoFbr+mShhnvAKX7nxlSO1sCnX18fgkEfqXjv4bA5EjCKTVsMVOGAk1Y
 YA7pyOmEF/WzW3NqZ9RwrvIIYtVefic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645452938;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMbhA1TmP3DHzyiV55nEbdvJkcjIy39w0mu+NnVnyDg=;
 b=iwh4LC16s5c2c5bSATGgt5bGVijnMaKbQ0eMtn9L1S+o9HsEkJOUK/rtl/bK4hlaKkmpt/
 tLyqGhXz+SwMtOAw==
Received: from g78 (unknown [10.163.24.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id EBC84A3B88;
 Mon, 21 Feb 2022 14:15:37 +0000 (UTC)
References: <1645005868-2373-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1645005868-2373-4-git-send-email-xuyang2018.jy@fujitsu.com>
 <Yg6f6p/rdFTfzkoR@pevik> <620F118E.3070306@fujitsu.com>
 <Yg9EkoeDiRQhekhX@pevik> <87k0dojy5j.fsf@suse.de> <YhOI0W/PtQJP8fGK@pevik>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Mon, 21 Feb 2022 13:49:04 +0000
In-reply-to: <YhOI0W/PtQJP8fGK@pevik>
Message-ID: <87fsocjofw.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/5] Add pidfd_getfd01 test
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

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Hello Petr,
>
>> Petr Vorel <pvorel@suse.cz> writes:
>
>> > Hi Richie, Xu,
>
>> >> Hi Petr
>> >> > Hi Xu,
>
>> >> > ...
>> >> >> +++ b/testcases/kernel/syscalls/pidfd_getfd/pidfd_getfd01.c
>> >> > ...
>> >> >> +	remotefd = TST_RET;
>> >> >> +	flag = fcntl(remotefd, F_GETFD);
>> >> >> +	if (flag == -1)
>> >> >> +		tst_brk(TFAIL | TERRNO, "fcntl(F_GETFD) failed");
>> >> > Just:
>> >> > flag = SAFE_FCNTL(remotefd, F_GETFD);
>> >> Yes, I almost forgot we have this macro.
>> > @Richie: It'd be useful if sparse checks would suggest to use SAFE_*()
>> > functions, but not sure if easily detectable. Something like setup() and
>> > cleanup() function and syscall followed by if (foo == -1) followed by tst_brk().
>
>> > Kind regards,
>> > Petr
>
>> Yeah, this would be relatively simple in Coccinelle. In Sparse I'm not
>> sure, but it is one of the main use cases IMO.
> I remember few years ago (2017) metan did big cleanup with Coccinelle.
> If much simpler, we might want to introduce some basic scripts (without
> vendoring Coccinelle, it'd have to be installed).

Indeed, we already have some in scripts/coccinelle. These are mainly
useful for refactoring.

>
>> Hopefully the IR produced by these code patterns is fairly stable. In
>> that case we can do some simple pattern matching.
> Frankly speaking, if ever implemented it's probably you who is going to
> implement it, thus your choice what you use :).
>
> Kind regards,
> Petr

Yeah, although it still needs reviewing :-p

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
