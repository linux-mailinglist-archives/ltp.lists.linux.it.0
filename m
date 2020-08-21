Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD7B24CE3F
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:50:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3A6853C2F9A
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 08:50:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1E70A3C136A
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:50:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ADD08600870
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 08:50:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6486AB663;
 Fri, 21 Aug 2020 06:50:53 +0000 (UTC)
Date: Fri, 21 Aug 2020 08:50:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200821065024.GA11908@dell5510>
References: <20200820181918.404758-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820181918.404758-1-ebiggers@kernel.org>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [LTP PATCH 0/2] ltp: fix af_alg02 to specify control data
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: linux-crypto@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Eric,

> It isn't clearly defined what happens if you read from an AF_ALG request
> socket without previously sending the control data to begin an
> encryption or decryption operation.  On some kernels the read will
> return 0, while on others it will block.

> Testing this corner case isn't the purpose of af_alg02; it just wants to
> try to encrypt a zero-length message.  So, change it to explicitly send
> a zero-length message with control data.

> This fixes the test failure reported at
> https://lkml.kernel.org/r/CA+G9fYtebf78TH-XpqArunHc1L6s9mHdLEbpY1EY9tSyDjp=sg@mail.gmail.com

> Fixing the test in this way was also previously suggested at
> https://lkml.kernel.org/r/20200702033221.GA19367@gondor.apana.org.au

> Note, this patch doesn't change the fact that the read() still blocks on
> pre-4.14 kernels (which is a kernel bug), and thus the timeout logic in
> the test is still needed.

Thanks for the fix, merged!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
