Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 93969552DA8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 10:56:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1ACF73C93E2
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jun 2022 10:56:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 571BD3C21D9
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 10:56:38 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A0607600905
 for <ltp@lists.linux.it>; Tue, 21 Jun 2022 10:56:37 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DC68021AFD;
 Tue, 21 Jun 2022 08:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655801796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yi68A7fM0w94OHyzwJkhPsVKHrCM8I6JqFhnHFc9ORA=;
 b=0G+/JNNKVRNT1WHA7Y6ltFTZ6kmCGq4kuRTp+MZuWe5C6j5C3ZNaFQRUDpUPWNXeNQyiaX
 JojxLOxsNyXKBNwfOywTqpaDh0rKaYskb6jwoDXOPBf7TrWxvHO9EWzFNonRbd37cgPc1X
 VANA4PcbnvNUt+u1rOVjFzGADnJrcVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655801796;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yi68A7fM0w94OHyzwJkhPsVKHrCM8I6JqFhnHFc9ORA=;
 b=ifD6I0Q269lVoluyWfy2oP8RIz8RM6TemogVk+u0709TEZ0vp5I/6OxfVv82LmkTc8dsK2
 4LJiCGemcBWfGFDw==
Received: from g78 (unknown [10.163.24.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 8AA1A2C141;
 Tue, 21 Jun 2022 08:56:36 +0000 (UTC)
References: <010001816f3c352e-f5ee78c6-1425-42f5-b673-409a0a92ef74-000000@email.amazonses.com>
 <11d7d8a6-c062-03aa-7e7c-f7d3c3c2f095@jv-coder.de>
 <CAASaF6wyH7YJtNaGfR9n-yhnHv9Pc7BvCMYe1EWvwnCMtNhfDQ@mail.gmail.com>
 <60876a29-d589-1de9-b4fd-a9000b8e7d68@jv-coder.de>
User-agent: mu4e 1.6.10; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
Date: Tue, 21 Jun 2022 09:35:55 +0100
In-reply-to: <60876a29-d589-1de9-b4fd-a9000b8e7d68@jv-coder.de>
Message-ID: <871qvi5r97.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [REGRESSION] lkft ltp for 6763a36
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

Joerg Vehlow <lkml@jv-coder.de> writes:

> Hi Jan,
>
> Am 6/21/2022 um 9:22 AM schrieb Jan Stancek:
>> On Tue, Jun 21, 2022 at 9:15 AM Joerg Vehlow <lkml@jv-coder.de> wrote:
>>>
>>> Hi,
>>>
>>> Am 6/17/2022 um 3:17 AM schrieb lkft@linaro.org:
>>>> * qemu_i386, ltp-fs-tests
>>>>   - read_all_proc
>>> I've seen this test fail a lot, has anyone ever tried to analyze it? I
>>> was unable to reproduce the problem when running the test in isolation.
>> 
>> I see it hit timeouts too (read_all_sys as well). I think it needs
>> runtime restored to 5minutes as well, atm. it has 30s.
> Didn't think about that, but at least for the failures I've seen, this
> is not the reason. The message printed by the test is "Test timeout 5
> minutes exceeded."
>
> Joerg

The main issue with read_all is that it also acts as a stress
test. Reading some files in proc and sys is very resource intensive
(e.g. due to lock contention) and varies depending on what state the
system is in. On some systems this test will take a long time. Also
there are some files which have to be filtered from the test. This
varies by system as well.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
