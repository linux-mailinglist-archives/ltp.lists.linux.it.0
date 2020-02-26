Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEB716FA7A
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:18:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 136503C2573
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 10:18:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C75193C251E
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:18:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5917E6011D0
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 10:18:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5B34AD5E;
 Wed, 26 Feb 2020 09:18:25 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:18:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200226091824.GA2215@dell5510>
References: <20200226084249.29561-1-pvorel@suse.cz>
 <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] request_key04: Use TFAIL instead of TBROK
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > obvious fix which I'd normally merge without sending to ML.
> > But there are 19 tests which use tst_res(TBROK, and at least some of
> > them are affected by this (i.e. don't unconditionally report any result
> > before tst_res(TBROK), so we might want to fix it different way.

> +1 for this fix.
Thanks for your review.

> By the way, do you think it makes sense to add build check parameters for
> tst_res() too? Just like what we do for tst_brk() in commit 0738e3753c51.

IMHO if we agree that tst_res(TBROK) is harmful and should be avoided entirely,
I'd be for adding this check.

> Any thoughts?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
