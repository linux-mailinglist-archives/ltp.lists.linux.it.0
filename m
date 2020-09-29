Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5E27BFF1
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 10:48:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84A733C4C32
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 10:48:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id B95803C12A0
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 10:48:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0E7C32009A1
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 10:48:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B430ACA3;
 Tue, 29 Sep 2020 08:48:10 +0000 (UTC)
Date: Tue, 29 Sep 2020 10:48:09 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200929084809.GB7482@dell5510>
References: <20200929073501.4598-1-pvorel@suse.cz>
 <20200929083846.GA2717@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929083846.GA2717@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] io_destroy01: TCONF when unsupported
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> > to fix test on kernel built without CONFIG_AIO=y.

> > Cleanup: use return instead of else, join string.

> This is both obviously ok, but the cleanup should be in a separate
> patch.
+1, I'll do.
I suggested to use tst_syscall(), but we probably want here to use libc wrapper
I guess, thus I'll merge this (split into 2 commits).

> You can add my reviewed-by if you split the patch into two.

> Also is this the only io_* test that fails?

> Looking at the testcases we have the io_setup01 that looks like it will
> fail with TBROK if io_setup() returns -ENOSYS.
Thanks, I'll send a separate patch for this.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
