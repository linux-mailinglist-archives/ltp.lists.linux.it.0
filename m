Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5511BDDB6
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:34:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB6B23C5ECE
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 15:34:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1F0403C2820
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:34:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 130DE6007B9
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 15:33:55 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2374FAE87;
 Wed, 29 Apr 2020 13:34:02 +0000 (UTC)
Date: Wed, 29 Apr 2020 15:34:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200429133401.GA3854@dell5510>
References: <20200429033511.1848449-1-raj.khem@gmail.com>
 <20200429131624.GB10236@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429131624.GB10236@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Define __NR_futex to be __NR_futex_time64 on
 riscv32
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

Hi Khem,

> > +#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
> > +# define __NR_futex __NR_futex_time64
> > +#endif

> I guess this should go to include/lapi/futex.h, so we don't repeat ourselves.
> (and clone08.c needs to include it, others already do).

I've noticed that we still don't have risc-v support in include/lapi/syscalls/.
IMHO adding it would be better, than fixing just one missing __NR numbers.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
