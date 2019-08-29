Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A5A2733
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:21:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 625D43C2017
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Aug 2019 21:21:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 671BE3C1CFD
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:21:25 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id C2216201450
 for <ltp@lists.linux.it>; Thu, 29 Aug 2019 21:21:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE41EAE74;
 Thu, 29 Aug 2019 19:21:23 +0000 (UTC)
Date: Thu, 29 Aug 2019 21:21:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20190829192120.GA14614@dell5510>
References: <20190826141101.10144-1-pvorel@suse.cz>
 <888e8f74-278c-ae3f-c8c5-3b8790f634d3@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <888e8f74-278c-ae3f-c8c5-3b8790f634d3@oracle.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_net.sh: Fix root detection on netns on new
 shell API
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

Hi Alexey,

> >  init_ltp_netspace()
> >  {
> >  	tst_test_cmds ip
> > -	tst_require_root_
> > +	[ -z "$TST_USE_LEGACY_API" ] && _tst_require_root || tst_require_root

> Can we fix tst_require_root_() instead?
I'll do.
I wanted to use API variable than call internal function. It's not a big issue
and this function is called in _tst_require_root anyway.

NOTE: I've posted a patch which move variable and link setup to separate
function, but I'm going to reject it myself. It's not an improvement and does
not solve this solution. Sorry for the noise.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
