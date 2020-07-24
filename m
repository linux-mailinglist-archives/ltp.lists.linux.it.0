Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0BE22C68D
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:35:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C79113C4CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:35:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E5DB73C2642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:35:27 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 189D71A01A62
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:35:26 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99A97AF22;
 Fri, 24 Jul 2020 13:35:34 +0000 (UTC)
Date: Fri, 24 Jul 2020 15:35:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200724133524.GA31265@dell5510>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
 <20200724123235.GA3539@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724123235.GA3539@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] libs: sigwait: Get rid of REPORT_SUCCESS()
 macro
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

...
> >  	TEST(sigwaitinfo(&sigs, &si, NULL));
> > -	REPORT_SUCCESS(-1, EINTR);
> > +	if (TST_RET == -1) {
> > +		if (TST_ERR == EINTR)
> > +			tst_res(TPASS, "%s: Test passed", __func__);
> > +		else
> > +			tst_res(TFAIL | TTERRNO, "%s: Unexpected failure", __func__);

> Can we please make the messages a bit more user friendly?

> - the tst_res() already prints line and filename the __func__ is a bit
>   redundant

> - it also prints PASS/FAIL so we can omit the "Test passed" we can print
>   something that describes the testcase instead e.g.
>   "Wait interrupted by a signal"

> - also in the "Unexpected failure" case we should print which error we
>   expected with someting as: tst_res(TFAIL | TTERRNO, "Expected to return EINTER, got");

+1, sorry for overlooking it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
