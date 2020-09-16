Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6D26BDB3
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 09:11:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 567493C2B0D
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Sep 2020 09:11:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9F30B3C149D
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 09:11:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E069B1000A9B
 for <ltp@lists.linux.it>; Wed, 16 Sep 2020 09:11:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65197B204;
 Wed, 16 Sep 2020 07:11:23 +0000 (UTC)
Date: Wed, 16 Sep 2020 09:11:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200916071106.GB1433@dell5510>
References: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB117565A7BA2A8371A3B94ED9FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] TPASS in new test lib
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tim,

> > -----Original Message-----
> > From: Petr Vorel <pvorel@suse.cz>

> ...
> > > P.P.S How come some tests produce TPASS and some produce just PASS?
> > Legacy C API and shell API (both legacy and new) add T (i.e. TPASS), new C API
> > don't add it (i.e. PASS). It's a minor detail we could fix that.

> Well, Fuego's parser only checks for PASS (probably due to the inconsistency),
> but personally I'd prefer if it was consistent. The string "TPASS" is much less
> likely to appear in unrelated output than "PASS" is.

> It looks like it comes from print_result() in ltp/lib/tst_test.c.

> Here's a patch, in case there's interest in changing it:
Please next time use git format-patch and add comments which are not supposed to
be part of the commit message below ---.

> From 151168bf384135d7c79b0c09bb95267ba1293205 Mon Sep 17 00:00:00 2001
> From: Tim Bird <tim.bird@sony.com>
> Date: Tue, 15 Sep 2020 14:18:37 -0600
> Subject: [PATCH] tst_test: Change result strings to use T prefix

> Change PASS to TPASS in the new C library.
> Change other results strings to also include the "T" prefix.
> This makes the new library consistent with previous LTP
> output, and with the shell output.


Reviewed-by: Petr Vorel <pvorel@suse.cz>

Although leaving this to Cyril (although having T prefix or not is quite
cosmetic, he had a reason to omit it).  Also there is ongoing rewrite of tests
still using legacy API to use new API, thus the inconsistency will disappear in
the long term.

IMHO: don't care that much about legacy API, but synchronize new C and shell
API.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
