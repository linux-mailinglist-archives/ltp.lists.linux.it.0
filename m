Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DC6CC4F
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 11:50:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C79123C1D3E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jul 2019 11:50:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 060AE3C1A4E
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 11:49:58 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7B0321A00F57
 for <ltp@lists.linux.it>; Thu, 18 Jul 2019 11:49:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 997D3AE91;
 Thu, 18 Jul 2019 09:49:56 +0000 (UTC)
Date: Thu, 18 Jul 2019 11:50:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190718095000.GA15944@dell5510>
References: <20190718092037.13594-1-pvorel@suse.cz>
 <20190718092910.GA25241@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190718092910.GA25241@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] doc: Mention network tests in variables
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

Hi,

> > I'd prefer using hyperlinks in docs (as it's supposed to be viewed
> > mainly in a browser) but these are the only variants (which looks too
> > ugly to me):

> > NOTE: link:../../blob/master/testcases/network/README.md[Network tests] use additional variables
> > in 'tst_net.sh'.
> > (this one at least keeps links to forks)

> > NOTE: https://github.com/linux-test-project/ltp/blob/master/testcases/network/README.md[Network tests] use additional variables
> > in 'tst_net.sh'.

> > => I'd be for giving up links.

> Given that test-writing-guidelines text is also on the LTP wiki the first one would not work anyways...
It works when using '../../blob/master/testcases/network/README.md' works, see [1] :).

> So yes I do agree that pointing out people to the relative location of
> the README.md is probably the best we can do, acked.
But unless Alexey objects, I'd be also for plain text version.

Kind regards,
Petr

[1] https://github.com/pevik/ltp/wiki/TEST

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
