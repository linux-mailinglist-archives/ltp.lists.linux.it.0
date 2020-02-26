Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 034841700B1
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 15:03:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AB5433C25CB
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Feb 2020 15:03:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 195613C1ABA
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 15:03:02 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9B870201449
 for <ltp@lists.linux.it>; Wed, 26 Feb 2020 15:03:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9584B125;
 Wed, 26 Feb 2020 14:03:01 +0000 (UTC)
Date: Wed, 26 Feb 2020 15:02:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200226140255.GA831512@x230>
References: <20200226084249.29561-1-pvorel@suse.cz>
 <CAEemH2cMBtVV-1_RZb_UHN9rQF3sD2w-H2gS11BD2WHPTPzvgQ@mail.gmail.com>
 <20200226091824.GA2215@dell5510>
 <CAEemH2cXGOh=MX28kYvhFaHspHGXiVdGuNZeyN97+O3+bt1jGg@mail.gmail.com>
 <20200226113757.GA24342@dell5510> <20200226124826.GA24080@rei>
 <1576675558.9115231.1582723422538.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576675558.9115231.1582723422538.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

Hi,

> > > > In personally, I'd let tst_res() only accept 'TPASS, TFAIL, TINFO, TCONF,
> > > > TWARN'.
> > > +1. Cyril, Jan?

> > I guess that it does not make much sense to report TBROK and then
> > continue the test. But that all depends on how exactly are these states
> > defined. Have we ever wrote them down?

> > I guess that TPASS and TFAIL are obvious.

> > TINFO is just additional information.

> > TCONF is test skipped.

> > TWARN something went wrong but we decided to continue?
+1

> This appears to be mostly used in cleanup() when something goes wrong.
> So a failure that's not critical, not related to goal of test,
> but still something we want to draw attention to.


> > TBROK something went wrong and we decided to exit?

> We do have following in style-guide.txt:

> Use +TBROK+ when an unexpected failure unrelated to the goal of the testcase
> occurred, and use +TFAIL+ when an unexpected failure related to the goal of
> the testcase occurred.

> I agree that tst_res with TBROK doesn't make much sense. I see TBROK as
> something we can't recover from and need to end the test. Otherwise
> if we want to skip part of test, then TCONF looks more fitting.

Thanks all for their input.
I'll merge this test with your ack and create macro + fix remaining tests
(sent patchset to ML).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
