Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5C222C6C4
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:37:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F27F93C4CFF
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 15:37:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id DCFC33C2642
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:37:28 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7C14E1A01A53
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 15:37:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 006C3AD0B;
 Fri, 24 Jul 2020 13:37:35 +0000 (UTC)
Date: Fri, 24 Jul 2020 15:37:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200724133726.GB31265@dell5510>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
 <20200724055826.GE32086@dell5510>
 <20200724103454.ttaqxq3hzmth7gpr@vireshk-mac-ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724103454.ttaqxq3hzmth7gpr@vireshk-mac-ubuntu>
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh,

> > Although these errors are still here:

> I went to libs/ directory and I don't get any warnings with

> $ make clean; make

> How can I generate these easily ?
Use new gcc. I was able to generate this even with gcc 9:

$ gcc --version
gcc (SUSE Linux) 9.3.1 20200406 [revision 6db837a5288ee3ca5ec504fbd5a765817e556ac2]
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
