Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F06322A688A
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 16:55:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 827173C5462
	for <lists+linux-ltp@lfdr.de>; Wed,  4 Nov 2020 16:55:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1C50D3C245E
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 16:55:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8FBA86008D5
 for <ltp@lists.linux.it>; Wed,  4 Nov 2020 16:55:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B3A1ADD9;
 Wed,  4 Nov 2020 15:54:59 +0000 (UTC)
Date: Wed, 4 Nov 2020 16:54:58 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201104155458.GB12971@pevik>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-6-pvorel@suse.cz>
 <d0e937e67108585af4423e9f688941cb194476ba.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0e937e67108585af4423e9f688941cb194476ba.camel@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 05/11] syscalls: Add a few documentation
 comments
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
Cc: "metan@ucw.cz" <metan@ucw.cz>,
 "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Rado, all,

> Hello Petr,

> On Tue, 2020-11-03 at 20:13 +0100, Petr Vorel wrote:

> > + * [DESCRIPTION]
> > + *  Checks that process which called abort() gets killed by SIGIOT
> > and dumps core.

> ...

> > +/*\
> > + * [DOCUMENTATION]
> > + *  Verify that acct() returns proper errno on failure.
> > +\*/
> > +

> I noticed that in some places the DESCRIPTION tag is used and in
> another DOCUMENTATION. What is the difference between the two and which
> should be used when?
I'd suggest to use [DESCRIPTION] and drop [DOCUMENTATION] (whole metadata are
documentation).

It'd be good to document that in README.md

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
