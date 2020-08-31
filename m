Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C8C257FEC
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 19:49:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4250B3C555D
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Aug 2020 19:49:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id F3C793C136A
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 19:49:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7A0AE1000BDA
 for <ltp@lists.linux.it>; Mon, 31 Aug 2020 19:49:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 721C0B1A9;
 Mon, 31 Aug 2020 17:49:20 +0000 (UTC)
Date: Mon, 31 Aug 2020 19:49:48 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200831174948.GA15731@yuki.lan>
References: <20200831094617.7764-1-chrubis@suse.cz>
 <CY4PR13MB11758CF355D958B797D2EA9FFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
 <CY4PR13MB1175D7238F6A05AA0A668B9AFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB1175D7238F6A05AA0A668B9AFD510@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] [RFC] runtest/quickhit: Remove.
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thinking about this a bit more....
> 
> Since this test is used (at least by me), more as a test of the testing
> infrastructure rather than the hardware/software under test,
> maybe it make sense to repurpose the test and adjust its contents
> based on this new purpose.  What would be nice is a test that
> exercises a bunch of different possible LTP behaviors or outputs,
> to test whether CI systems calling LTP can handle them all correctly.
> 
> So, there are 2 attributes of the test that are important to me:
>  - it runs quickly (more quickly than a "full" ltp)
>  - it runs a variety of individual LTP test programs
> 
> So it might be good to have this be a test that includes items that
> behave strangely (but quickly).  That would make this test more
> useful for the purpose I'm actually using it for.
> 
> It might even make sense to rename it to reflect this change of purpose
> (if it *is* a change of purpose).  For example, maybe name it
> 'smoketest' or 'weirdstuff' or 'selftest'.  But 'quickhit' at least captures
> one attribute that is important - that this test is used as a quick
> check that basic LTP functionality is working.
> 
> Just some more ideas....

I would vote for removing this one and adding either a smoketest or
selftest. The quickhit name is way too confusing.

Also if we want something as a selftest we can also throw in a few test
test library sanity tests that are not even installed at this point.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
