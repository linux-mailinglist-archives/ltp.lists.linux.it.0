Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A91D46F3
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:22:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914DB3C53A7
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 09:22:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id E72AC3C0331
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:21:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7DF441401AE9
 for <ltp@lists.linux.it>; Fri, 15 May 2020 09:21:58 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 724FCAF30;
 Fri, 15 May 2020 07:22:00 +0000 (UTC)
Date: Fri, 15 May 2020 09:21:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200515072156.GA17488@dell5510>
References: <20200514190906.27130-1-pvorel@suse.cz>
 <CAEemH2e5G53VPLp4bOe_i-2_4eRSF9dbTC378rqN-AwGanUTEw@mail.gmail.com>
 <20200515062221.GB5117@dell5510>
 <CAEemH2fQ3yfDfNqNeUfLAAWY6hUDcEybbU+dK=hwrwg2rFj60A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fQ3yfDfNqNeUfLAAWY6hUDcEybbU+dK=hwrwg2rFj60A@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/4] INSTALL: Update requirements
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

> > I'd prefer it in simple form (single line) + I thought bison is more
> > common than
> > byacc (but maybe I'm wrong). I'm not a big fan of sudo (but can add it
> > there).


> Sure, I have no preference here :). I added the 'sudo' just because I
> noticed that the INSTALL use many $ before commands which means in non-root
> user.
I added '#' in v3, but if anybody requires I can change it to sudo.


> > + Added headers and gcc. But on the other hand I wanted to have package
> > reference in
> > travis/*.sh (where are missing some packages which are installed by
> > default with
> > gcc, e.g. , but it does not harm to have it offline.

> +1
In the end in v3 I mentioned glibc and kernel headers, but also mentioned travis/*.sh.


> > Should I remove links to the tools? And we obviously don't list a compiler.


> Personally I think links are useless, people opened this INSTALL could also
> have the ability to use google for finding the package link:).
Agree, thus removed in v3.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
