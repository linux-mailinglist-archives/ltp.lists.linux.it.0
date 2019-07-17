Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 708286B98B
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:46:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 448793C1D1B
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 11:46:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id C6BFD3C1CA0
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:46:16 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 33FA8600E27
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 11:46:17 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9B51AD78;
 Wed, 17 Jul 2019 09:46:14 +0000 (UTC)
Date: Wed, 17 Jul 2019 11:46:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <20190717094614.GA9539@rei>
References: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56f854e2-9cc6-4725-3182-ff83e106ee23@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Question about kernel/syscall/signal/signal06.c
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
> I find signal06 fails on qemux86-64 when qemu has a small number cores, 
> e.g. "qemu -smp 1/2/4/6".
> 
> ERROR INFO:
> 
> signal06?????? 0?? TINFO?? :?? loop = 23
> signal06?????? 1?? TFAIL?? :?? signal06.c:87: Bug Reproduced!
> 
> But if boot qemu with "-smp 16", the case has great chance to pass.
> 
> 
> I have two questions about this case:
> 
> 1. I don't know why multi-core will affect the case.

Have you looked into the code? The test is trying to reproduce a race
condition between two threads of course the number of cores does affect
the reproducibility.

> 2. On failure situation, what does break the "while loop" shown in below 
> code.

Bug in a kernel that fails to restore fpu state.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
