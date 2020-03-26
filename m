Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A8194937
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 21:32:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 694E13C4B51
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 21:32:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 23BC33C0716
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 21:32:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8D8C260198E
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 21:32:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6BBF7AC53
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 20:32:23 +0000 (UTC)
Date: Thu, 26 Mar 2020 21:32:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200326203222.GA19445@dell5510>
References: <20200324143839.3647c485@daedruan>
 <20200326084504.GB29830@dell5510> <20200326134603.GA5185@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326134603.GA5185@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Avoid zero or negative int results in
 calculations
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
Cc: Jozef Pupava <jpupava@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > Define BUF_SIZE smaller than BLOCKSIZE for possitive offset result

> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > BTW it significantly prolongs the run, but IMHO ok.

> Longer testruns should be avoided unless there is a good reason for it.
+1. Although the commit message does not describe what it fixes, it obviously
fixes something. It'd be nice to explain it a bit.

Before:
real	0m0,013s
user	0m0,004s
sys	0m0,009s

After (slowed by second commit, not by the rewrite):
real	0m0,402s
user	0m0,042s
sys	0m0,360s

Looks like the smaller buffer the faster it is.
I haven't tested other Martin's fix reported later.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
