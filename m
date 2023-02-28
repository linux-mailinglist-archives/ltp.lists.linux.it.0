Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93A6A559E
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 10:24:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCEDF3CCE23
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Feb 2023 10:24:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A11C43C01AA
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 10:24:51 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B0A831000520
 for <ltp@lists.linux.it>; Tue, 28 Feb 2023 10:24:50 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id AB8251FDC2;
 Tue, 28 Feb 2023 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677576289;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cm7UKaE9CiKGTrPen+uFlwEdt/Cfi6/M/ssPWdI5a9U=;
 b=rsqTjFlh1CCKie5sf+GO8kN96QmTIvE54siXlkK9S9vBJ5yJo4lfhcxQJRUTMQsnfz6XvQ
 igjAwZiw0Kuxkx0HJHm5EYCgatni4jk1kZqrLSCJqt6mgqZ5deL06tuv7Fbd6805l4ChBX
 tShKMkfxykNBpSlbTpUlydkZP16HoFY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677576289;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cm7UKaE9CiKGTrPen+uFlwEdt/Cfi6/M/ssPWdI5a9U=;
 b=+Oi5SpM2qYRchlGpbosHYm+NEJoTmNB4hBrCCz7aRwDdbWg02feebavuaCrHp5BWW52DRd
 uKVAGQMH3FV8lXCw==
Received: from g78 (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 7E2572C141;
 Tue, 28 Feb 2023 09:24:49 +0000 (UTC)
References: <20230119132536.23209-1-wegao@suse.com>
 <20230120010533.11202-1-wegao@suse.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Wei Gao <wegao@suse.com>
Date: Tue, 28 Feb 2023 09:15:19 +0000
Organization: Linux Private Site
In-reply-to: <20230120010533.11202-1-wegao@suse.com>
Message-ID: <87mt4yuopq.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Move semaphore/ tests to semop/
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

Wei Gao via ltp <ltp@lists.linux.it> writes:

> There is no point in having two different directories with semop()
> testcaes so it would make sense to move these two tests into the
> syscalls/ipc/semop/ directory as semop04 and semop05.
> So we move ipc/semaphore/ tests to syscalls/ipc/semop/.
> Also update runtest files accordingly.

Yes, true. However these tests are using the old API. It makes sense to
move them and update to the new API at the same time. Maybe they even
test the same things as the other tests, so they could be deduplicated.

I like breaking things into small tasks, but this is actually too
small. I think it would be better to convert and move one test at a time
as well (in separate commits, but in the same patch series).

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
