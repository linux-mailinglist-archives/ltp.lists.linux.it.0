Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3A52A7EE9
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:47:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3603C540A
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Nov 2020 13:47:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 0B4FE3C08DA
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:47:25 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A5D9B140133D
 for <ltp@lists.linux.it>; Thu,  5 Nov 2020 13:47:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE1ECABAE;
 Thu,  5 Nov 2020 12:47:24 +0000 (UTC)
Date: Thu, 5 Nov 2020 13:48:10 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Radoslav Kolev <radoslav.kolev@suse.com>
Message-ID: <20201105124810.GC10395@yuki.lan>
References: <20201103191327.11081-1-pvorel@suse.cz>
 <20201103191327.11081-6-pvorel@suse.cz>
 <d0e937e67108585af4423e9f688941cb194476ba.camel@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0e937e67108585af4423e9f688941cb194476ba.camel@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
Cc: "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>, "metan@ucw.cz" <metan@ucw.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > + * [DESCRIPTION]
> > + *  Checks that process which called abort() gets killed by SIGIOT
> > and dumps core.
> 
> ...
> 
> > +/*\
> > + * [DOCUMENTATION]
> > + *  Verify that acct() returns proper errno on failure.
> > +\*/
> > +
> 
> I noticed that in some places the DESCRIPTION tag is used and in
> another DOCUMENTATION. What is the difference between the two and which
> should be used when?

This is one of the open points at the moment. The exact format of the
test description needs to be decided on and written down.

However I wanted to get the code reviewed and included in upstream even
though there are a few loose ends since it's complex enough as it is and
the detail can be worked on later. Especially since I want to make use
of the metadata for parallel test execution and the documentation part
is not that important there.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
