Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F13B6E96
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:15:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0F5433C6C68
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 09:15:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 276633C0352
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:15:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 999251A00CCB
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 09:15:29 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DFA1E2038C
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624950928;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=evYuHqtKcxEd+rH0VbAhCAeevJEizxpcFxFLlZtCBog=;
 b=UeMYxA0kMrc1D04e0K1sxdRAKNLb9AVatzaB2QZSFZwO5+sdAW5eXdlqVH9LZcuDMlyG4+
 XUnRfU5yeKweiCPw4yk5dREiOue2qxswDSSQ6ZMSHuMlyZnraTuFcIc8oZNKYFAYa5fpjJ
 cifmq+PvHZYgetcSGotuJLVkWZlnFuE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624950928;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=evYuHqtKcxEd+rH0VbAhCAeevJEizxpcFxFLlZtCBog=;
 b=tTnye3zwWs/HfnOQObOZMUKi7Ci6jZywKWOj8/FIlubFZKAokWoEog9QwRTH7jWhEpWwId
 YPhyBEHPvFSRWwBw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AED2AA3B8F;
 Tue, 29 Jun 2021 07:15:28 +0000 (UTC)
References: <20210621113804.26179-1-rpalethorpe@suse.com>
 <20210621113804.26179-3-rpalethorpe@suse.com> <YNniPHlHTVyiz74B@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YNniPHlHTVyiz74B@pevik>
Date: Tue, 29 Jun 2021 08:15:28 +0100
Message-ID: <87wnqd2lbj.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] API: Cause GCC/Clang to blow up when TEST is
 used in the library
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

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> +#if LTPLIB
>> +#define TEST(SCALL) _Pragma("GCC error \"Do not use TEST macro in library\"")
>> +#define TEST_VOID(SCALL) _Pragma("GCC error \"Do not use TEST_VOID macro in library\"")
>
> It'd be nice to document "Do not use TEST() macro in library" in LTP Library API
> Writing Guidelines [1].

Yes, I will submit this in the Sparse patch set today.

>
> Kind regards,
> Petr
>
> [1] https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
