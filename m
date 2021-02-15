Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF131B7AD
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 11:54:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3C2C3C6775
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Feb 2021 11:54:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 005A03C0304
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 11:54:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 775591000A22
 for <ltp@lists.linux.it>; Mon, 15 Feb 2021 11:54:13 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DB6A0AC32;
 Mon, 15 Feb 2021 10:54:12 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:55:24 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YCpTHC2FLaC5vzVH@yuki.lan>
References: <20210212151525.20112-1-chrubis@suse.cz>
 <853a0890-6426-5708-88a8-692885b9dd6f@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <853a0890-6426-5708-88a8-692885b9dd6f@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] mq_timedreceive_5-3: Initialize
 maxmsg properly
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > The test can be actually executed as non-root user but the maxmsg must
> > be set to a value that is less by user limit for messages and since we
> > do not send any messages we can safely initialize it to 1.
> This is applies to more than only this test. I also recognized this when 
> fixing the time issue, but decided not to change it, because it is not 
> the only affected test.

Feel free to send a patch for the rest :-).

Setting the mq_maxmsg to BUFFER which is supposed to be constant for the
mq_msgsize is quite confusing and also prevents these tests from being
executed as ordinary user so I think that it's worth fixing.

> The max message size could be up to /proc/sys/fs/mqueue/msg_max. This is 
> usually 10.

Looking at the rest of the tests I guess the original author either did
not care that much or was clueless since it does not really make sense
to set mq_maxmsg to the same number as mq_msgsize in tests that send
just one or two message.

So we should either set it to 2 in all tests, or set it to 1 or 2
depending on how many messages test sends.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
