Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A28917AD9C
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:53:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00B143C6546
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 18:53:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6564A3C64F2
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:53:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C39371A0154E
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 18:53:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 14CC1AE1C
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 17:53:28 +0000 (UTC)
Date: Thu, 5 Mar 2020 18:53:25 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200305175325.GA16171@rei>
References: <20200305151459.30341-1-mdoucha@suse.cz>
 <20200305174205.GA29517@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305174205.GA29517@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Add TST_ASSERT_SYSCALL*() macros
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
> What I like on these macros (besides DRY) is that it really shows the test, not
> the library, see
> before:
> tst_safe_timerfd.c:21: BROK: timerfd01.c:89 timerfd_create(CLOCK_MONOTONIC) failed: EINVAL (22)
> after:
> timerfd01.c:89: BROK: timerfd_create(CLOCK_MONOTONIC) failed: EINVAL (22)

That's because it calls tst_brk_() correctly instead of tst_brk(). I
should have caught that during the review.

Also given the way it's structured now we can pass these parameters to a
shell script as well and generate the end result easily. With a bit more
work we can generate both header and C source as well and would still
prefer that over these macros.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
