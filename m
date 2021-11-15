Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F26450288
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:27:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5DE093C821D
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Nov 2021 11:27:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E98FB3C7FC2
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:26:59 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 453781400F4F
 for <ltp@lists.linux.it>; Mon, 15 Nov 2021 11:26:57 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 78CD421923;
 Mon, 15 Nov 2021 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636972017;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZQFR/YqQEa5i1HI+2ocMAtRdPhQdNFKVvuSTWjn5CYI=;
 b=E/vKvjwIJDlO5oPVH7ddOywqPMJyo/OE1KN7e7ilDNSsnb67VaPrc28ktfRqGAQMRar/Hq
 /xpP2pkzYYKRDvbwqwVgtzPy2RqbXIfMGLP7b1YOSLQ+SyhzBujICUHEnHwDK9HNQ8mpcF
 SXxBw246xYM83VbNlVPt43uS4Qwg6Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636972017;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZQFR/YqQEa5i1HI+2ocMAtRdPhQdNFKVvuSTWjn5CYI=;
 b=sJxYdHt2pZrqBifeIbqZVcefECDKPxP0fOj+YgzM+Io+tit2llKBcKGRBqC0IYjt0IK09/
 Dot2bJHBHZj7C3Dw==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 37BB4A3B87;
 Mon, 15 Nov 2021 10:26:57 +0000 (UTC)
References: <1636619544-2369-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <87a6i9ejdy.fsf@suse.de> <YZI0aEoJt5c9bqTz@yuki>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Mon, 15 Nov 2021 10:21:30 +0000
In-reply-to: <YZI0aEoJt5c9bqTz@yuki>
Message-ID: <87bl2ld89b.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] syscalls/statx04: use stx_attributes_mask
 before test
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
>> Note that even if you move setting the flags to the top. This will still
>> result in all unset flags becoming TCONF instead of TFAIL.
>> 
>> IMO statx is broken on older kernels except for ext4. It can be fixed by
>> backporting patches. One of the main use cases for LTP is to find
>> missing backports.
>
> That was my point as well.
>
> I guess that the last time I've proposed to create a separate test that
> just tests that these flags are set as expected for a all filesystems
> and that test would have the patches that fixed that as a tags set. That
> would make it clearer what is wrong and what should be backported.
>
> Once we have that test implemented we can change this test as this patch
> does.

Or perhaps we could pass a flag to this test to ignore kernel versions
which are known not to work?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
