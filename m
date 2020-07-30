Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CD23326F
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 14:53:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 19A133C4C08
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 14:53:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 4A2143C0EAD
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 14:53:33 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B62CF14060C8
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 14:53:32 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 424F2ADE4
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 12:53:44 +0000 (UTC)
Date: Thu, 30 Jul 2020 14:53:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200730125329.GA31867@dell5510>
References: <20200730092637.487-1-pvorel@suse.cz>
 <20200730094842.GB3457@yuki.lan> <20200730101643.GA6381@dell5510>
 <20200730122226.GD3457@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730122226.GD3457@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] semctl: Fix 32 bit build
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

Hi Cyril,

> > > And I guess the safest rule would be to add the -lltp* libraries first,
> > > because naturally none of the code in LTP but the test depends on these.
> > Are you're going to fix by changing order somewhere in include/mk/?
> > Or shell I push the fix with your ack?
> > I'd prefer proper fix so commits like this or 22f510de8 ("Fix static linking
> > with musl-fts") aren't needed any more.

> I wonder what would be the easiest solution here.

> The main problem is that these flags are per-testcase defined and are
> not expanded before we enter rule to build a test. And as we are using
> implicit rules to compile C code we cannot easily change that.

> I guess that we can write down our rules and do whatever we want there
> though.
Thanks for info. Well, I'll probably merge the original fix then.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
