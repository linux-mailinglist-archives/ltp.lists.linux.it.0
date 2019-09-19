Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 28501B7C81
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:26:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C13063C217E
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:26:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A65CA3C20DB
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:26:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D9ADC600BE0
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:26:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9D736B7CE;
 Thu, 19 Sep 2019 14:26:46 +0000 (UTC)
Date: Thu, 19 Sep 2019 16:26:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christian Lanig <clanig@suse.com>
Message-ID: <20190919142644.GA20853@x230>
References: <20181003113215.GB21139@dell5510>
 <cover.1566500817.git.clanig@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1566500817.git.clanig@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 0/1] Add automated tests for shell lib
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

Hi Christian,

> Hi,

> I am sorry that my reply took so long. Thank you very much for your comments
> which helped me to improve the code.
> I have made an overhaul of the code based on your suggestions but an option to
> pass parameters to the tests is still not implemented. 
> I'm sending you what I have so far because it would help me when you could
> provide me more information regarding this.

> I agree that it is difficult to find a way to process text the way needed here
> without disregarding the Linux Kernel Coding Style that asks for code which is
> transparent and easy to read when we only consider Shell commands. To address
> this issue I have drafted a Python script that might go in the tools folder and
> may perhaps be helpful in other cases as well. Since there are already Python
> files in the project it might be a valid option.

> Thank you very much for your patience.
No problem, thanks continue for it.

I'm also not sure if we should put them into separate testcases/ directory.
I'd put them into shell/ directory and rename test_sh_newlib.sh to run.sh or
something simple.

BTW (nit, no hard feeling :) as lib/newlib_tests/test.*.sh are based on my
previous work, you could might mention it in the change log. You updated them to
have timeout output, so it's your work, (if not, it'd be better to send them as
mine separate

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
