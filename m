Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4C17DA25
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 09:01:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0C15B3C610D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 09:01:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id A53853C176D
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 09:01:37 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 95DED20100C
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 09:01:36 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3CCDAE0D;
 Mon,  9 Mar 2020 08:01:35 +0000 (UTC)
Date: Mon, 9 Mar 2020 09:01:34 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200309080134.GB299736@x230>
References: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583311467-2379-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] syscalls/settimeofday01: convert to new
 library
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

Hi Xu,
> Also, since glibc 2.31[1], when tz and tv are both null, it will get
> SIGSEGV sig. So, remove this EFAULT error test to adopt glibc 2.31.
+1, thanks for testing on new glibc.

> Moreover, musl 1.2.0 is now available and changes time_t for 32-bit
> archs to a 64-bit type. It is updated to slove y2038 problem and get
=> typo solve.
> time function no longer used for 32bit arch but not affecting set time
> function and 64 bit arch, more info see[2]. So for gettimeofday(), we
> use tst_syscall instead of calling libc to avoid this problem.
Hm, it'd be nice to test both raw syscall and libc implementations (via
tst_variant), but IMHO there is no way to detect musl change. Or am I missing
something?

+ one would prefer this change to be in a separate commit, but we can live with that :).

I guess there is no need to setup SAFE_{G,S}ETTIMEOFDAY(), because only these 2
tests and stime_var.h are using it (or at least no now).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
