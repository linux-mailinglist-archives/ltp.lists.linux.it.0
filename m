Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3B6217046
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 17:17:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C61E73C54C5
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 17:17:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2B88B3C5497
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 17:17:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A943F1A01455
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 17:17:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A3C8AE47;
 Tue,  7 Jul 2020 15:17:14 +0000 (UTC)
Date: Tue, 7 Jul 2020 17:16:31 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200707151631.GA5197@rei.lan>
References: <cover.1593152309.git.viresh.kumar@linaro.org>
 <18d8603306f51f243faca04cf63bcaf2c7168d56.1593152309.git.viresh.kumar@linaro.org>
 <20200703135812.GC2308@yuki.lan>
 <20200706023941.ievw6vsdp6gvr3g7@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706023941.ievw6vsdp6gvr3g7@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V7 09/19] syscalls/sigwaitinfo: Migrate to new
 test framework
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Honestly I'm not sure what we should do about this test. Obviously this
> > is a step into right direction but it still keeps the SUCCEED_OR_DIE()
> > macro that produces many warnings.
> > 
> > I'm also not happy about the fact that we compile different test based
> > on ifdefs and that there are empty directories where binaries are
> > magically appear during the build. I would be much happier if we had a
> > real test sources there and share the large enough common bits in a
> > different way.
> 
> What about merging this patch as is (so I don't to keep sending it)
> and then I fix all the issues you want to get fixed in this test
> separately ?

Fair enough, merged.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
