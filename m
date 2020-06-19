Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB320055C
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 11:39:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9191B3C5F09
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Jun 2020 11:39:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 878253C23CD
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 11:38:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id CCF221000A0D
 for <ltp@lists.linux.it>; Fri, 19 Jun 2020 11:38:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C7E6AD71;
 Fri, 19 Jun 2020 09:38:56 +0000 (UTC)
Date: Fri, 19 Jun 2020 11:38:55 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200619093855.GD10932@dell5510>
References: <8b9a7e8ea27894090f1e31e178d7328f118163d0.1591270889.git.viresh.kumar@linaro.org>
 <CA+G9fYuHsezzit3pzHiz-6ad4AfbgRsdbuqfUKvLif7_Jk5WkA@mail.gmail.com>
 <20200618134205.GB19072@dell5510>
 <20200619033225.vhqu7a7ej33wjcbf@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200619033225.vhqu7a7ej33wjcbf@vireshk-i7>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] clock_gettime03: Fix issues with negative offset
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi, Viresh,

> > > Test ran for 100 iterations on x86 device and confirmed test getting pass.
> > FYI with very high number of the tests it still can fail, but it's
> > much less likely:

> > ./clock_gettime03 -i 100000
> > Summary:
> > passed   3599972
> > failed   28
> > skipped  0
> > warnings 0

> I am wondering why delta will be over 10 ms in any case.
No idea, I hoped you'd know :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
