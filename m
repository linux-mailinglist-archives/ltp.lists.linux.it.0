Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F12C5C053E
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 14:34:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 273493C1D02
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 14:34:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9977B3C0595
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 14:34:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2B218600469
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 14:34:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF3A6B15E;
 Fri, 27 Sep 2019 12:34:45 +0000 (UTC)
Date: Fri, 27 Sep 2019 14:34:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190927123444.GA28245@dell5510>
References: <20190814121328.22999-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190814121328.22999-1-chrubis@suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/shmat03: Remove it from runtest/cve
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> The original POC[1] and CVE-2017-5669 are not tested by this test
> anymore as it turned out that the CVE was bogus.
Could you put the link, please? Is it this one?
https://marc.info/?l=linux-mm&m=152510978123755&w=2

> And the test became regression test for:

> commit 8f89c007b6dec16a1793cb88de88fcc02117bbbc
> Author: Davidlohr Bueso <dave@stgolabs.net>
> Date:   Fri May 25 14:47:30 2018 -0700

>     ipc/shm: fix shmat() nil address after round-down when remapping

> Hence we will keep the test but remove it from the CVE runtest file and adjust
> the top level comment in the test code.

> [1] https://bugzilla.kernel.org/attachment.cgi?id=252511
>     from https://bugzilla.kernel.org/show_bug.cgi?id=192931

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> CC: Davidlohr Bueso <dave@stgolabs.net>
Acked-by: Petr Vorel <pvorel@suse.cz>
(based on https://marc.info/?l=linux-mm&m=152510978123755&w=2)

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
