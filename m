Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D821905F3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 07:53:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CBA63C4D2B
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 07:53:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A349E3C4D1C
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 07:53:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 360141000A0B
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 07:53:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCAA2ABF4;
 Tue, 24 Mar 2020 06:53:44 +0000 (UTC)
Date: Tue, 24 Mar 2020 07:53:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20200324065343.GA24724@dell5510>
References: <20200323224933.2613658-1-petr.vorel@gmail.com>
 <20200323230305.GA2696136@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323230305.GA2696136@x230>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] accept4: Use tst_variant
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

Hi,

> > I guess __NR_socketcall is for x86 and other old architectures,
> > but we still want to use it, right?

> Maybe I should have kept just 2 variants (libc implementation and only one
> syscall implementation) and chose the correct syscall implementation with
> #ifdef SYS_ACCEPT4

> Or is there arch which supports both syscall variants?
OK, I can answer myself: ppc64le is example of arch which support both
__NR_accept4 and __NR_socketcall SYS_ACCEPT4.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
