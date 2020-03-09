Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDCF17DDB1
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 11:34:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D7E1E3C610D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 11:34:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 693C33C1450
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 11:34:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id AB47A1000DA0
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 11:34:01 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3DA6B28F
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 10:34:00 +0000 (UTC)
Date: Mon, 9 Mar 2020 11:34:00 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200309103359.GA29747@rei.lan>
References: <20200305134834.16736-1-chrubis@suse.cz>
 <20200305134834.16736-3-chrubis@suse.cz>
 <20200309101533.GA355713@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309101533.GA355713@x230>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/8] lapi: Add a configure check and fallback for
 setns
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
> There is an error for old glibc on centos 06:
> 
> https://api.travis-ci.org/v3/job/659994070/log.txt
> 
> In file included from /usr/src/ltp/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c:21:
> 
> /usr/src/ltp/include/lapi/setns.h: In function 'setns':
> 
> /usr/src/ltp/include/lapi/setns.h:16: error: implicit declaration of function 'syscall'

Hmm, I guess that we can include unistd.h in the lapi/syscalls.h so that
the syscall() function has a prototype.

> /usr/src/ltp/include/lapi/setns.h:16: error: implicit declaration of function 'tst_brk'
> 
> /usr/src/ltp/include/lapi/setns.h:16: error: 'TCONF' undeclared (first use in this function)
> 
> /usr/src/ltp/include/lapi/setns.h:16: error: (Each undeclared identifier is reported only once
> 
> /usr/src/ltp/include/lapi/setns.h:16: error: for each function it appears in.)
> 
> In file included from /usr/src/ltp/include/tst_test.h:14,
> 
>                  from /usr/src/ltp/include/tst_safe_clocks.h:13,
> 
>                  from /usr/src/ltp/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c:22:

Okay, I guess that both errors could be fixed by moving the lapi/setns.h
include after the tst_test.h in the test, because tst_test.h both
includes unistd.h as well as defines the tst_brk() and TCONF.

Thanks for spotting this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
