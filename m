Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56228143FF1
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 15:49:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 228A53C24C9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 15:49:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id EA78E3C24A4
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 15:49:04 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3F38314002CC
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 15:49:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 97663ACE0;
 Tue, 21 Jan 2020 14:49:00 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:48:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20200121144857.GB6337@rei>
References: <20200121140707.20583-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121140707.20583-1-rpalethorpe@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] pty03: Regression test for slip/slcan data
 race
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
> The kernel patch to fix this is still under review:
> https://lore.kernel.org/netdev/20200121134258.18013-1-rpalethorpe@suse.com/T/#u
> 
>  testcases/kernel/pty/Makefile |   2 +
>  testcases/kernel/pty/pty03.c  | 132 ++++++++++++++++++++++++++++++++++
>  2 files changed, 134 insertions(+)
>  create mode 100644 testcases/kernel/pty/pty03.c
> 
> diff --git a/testcases/kernel/pty/Makefile b/testcases/kernel/pty/Makefile
> index f9fc4f57e..52bb56c8d 100644
> --- a/testcases/kernel/pty/Makefile
> +++ b/testcases/kernel/pty/Makefile
> @@ -26,4 +26,6 @@ include $(top_srcdir)/include/mk/testcases.mk
>  
>  CPPFLAGS		+= -D_GNU_SOURCE
>  
> +pty03: LDFLAGS += -pthread

This has to be CFLAGS +=

All the manual pages say "compile & link with -pthread".


Other than that the test looks fine. Ideally we should add the linux git
tag once the upstream patch is accepted, then merge the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
