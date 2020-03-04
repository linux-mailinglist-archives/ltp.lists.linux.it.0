Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A38B178F7D
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 12:22:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A00AE3C65FB
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Mar 2020 12:22:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 58A0B3C65F0
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 12:22:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E9C331002022
 for <ltp@lists.linux.it>; Wed,  4 Mar 2020 12:22:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 569C2AD85;
 Wed,  4 Mar 2020 11:22:12 +0000 (UTC)
Date: Wed, 4 Mar 2020 12:22:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200304112210.GB16978@dell5510>
References: <fb581273-449f-5b24-0ad3-0fe224a2ab36@arm.com>
 <20200304111718.ikysbdor72e4innh@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304111718.ikysbdor72e4innh@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP configure Error in ARM64 Platform
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, vincent.guittot@linaro.org,
 Anshuman.Khandual@arm.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> You should have sent this mail to ltp@lists.linux.it instead. Owner
> list has a different purpose.
Yes, please don't use ltp-owner@lists.linux.it :)

> Broken by this commit, reset HEAD before it and apply your patches.

> commit c7d2a7458ee571fc89910602fdd84d85e8a6c008
> Author: Petr Vorel <pvorel@suse.cz>
> Date:   Tue Jan 7 14:20:32 2020 +0100

>     rpc-tirpc: Detect libtirpc with pkg-config

>     Using pkg-config is more reliable way than detecting presence of
>     libtirpc shared library with headers. As it does not require use $SYSROOT,
>     which is not defined everywhere (at least SDKs built in YOCTO as they
>     use nonstandard $SDKTARGETSYSROOT, see [1]).
>     Also use CFLAGS instead of CPPFLAGS in build system (we have C sources).
>     Fixes: a86d71fe5 ("Implemented autoconf check for libtirpc")

>     Use only <rpc/*.h> includes, <tirpc/rpc/*.h> removed as not needed
>     (pkg-config detects -I/usr/include/tirpc when needed). Therefore rpc.h
>     moved out of lapi.
>     Fixes: 7fe1a8bf8 ("rpc: Use libtirpc for all RPC tests + detect headers location")

>     Also removed <netconfig.h> (resp. <tirpc/netconfig.h>) as it's not needed.
>     Fixes: c0caf8f23 (initial commit of TI-RPC tests)

>     Implementation expects that RPC headers (<rpc/rpc.h> etc) are available,
>     because AC_CHECK_HEADERS() doesn't support passing header location and
>     libtirpc has them anyway.

>     [1] https://github.com/linux-test-project/ltp/pull/628

>     Closes: #628

>     Acked-by: Cyril Hrubis <chrubis@suse.cz>
>     Signed-off-by: Petr Vorel <pvorel@suse.cz>
As I noted in my private reply, you need pkg-config package. I'll document
travis/*.sh scripts as a source of required packages.
Commit c7d2a7458 ("rpc-tirpc: Detect libtirpc with pkg-config") changed quite a
lot files, that's probably why people (you're not alone) didn't notice added
dependencies in travis scripts.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
