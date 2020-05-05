Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E603F1C553E
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 14:15:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0D7B3C57E5
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 14:15:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id AF7EE3C269E
 for <ltp@lists.linux.it>; Tue,  5 May 2020 14:15:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D8591400B7D
 for <ltp@lists.linux.it>; Tue,  5 May 2020 14:15:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1C159AB3D;
 Tue,  5 May 2020 12:15:33 +0000 (UTC)
Date: Tue, 5 May 2020 14:15:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200505121529.GA6299@dell5510>
References: <20200429033511.1848449-1-raj.khem@gmail.com>
 <20200429131624.GB10236@dell5510>
 <CAMKF1srKzdh=VnoxDyumQHo25-ZWREcRPkyJ+V5tW4vZdiMuZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMKF1srKzdh=VnoxDyumQHo25-ZWREcRPkyJ+V5tW4vZdiMuZA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

sorry for a delay.
> > > RISCV glibc has decided to use 64bit time_t from get go unlike
> > > other 32bit architecture therefore aliasing __NR_futex to
> > > __NR_futex_time64 helps avoid the below errors on rv32

> > > tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'

> > Thanks for your fix.

> > BTW, out of curiosity, is Risc-v 32 bit merged into glibc master?

> Not yet but its almost finalised and should be merged before 2.32 hopefully
Nice!

> > I guess this should go to include/lapi/futex.h, so we don't repeat ourselves.
> > (and clone08.c needs to include it, others already do).


> OK makes sense, will send v2 ?
Yes please.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
