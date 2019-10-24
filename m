Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0FE3255
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:28:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EF923C2389
	for <lists+linux-ltp@lfdr.de>; Thu, 24 Oct 2019 14:28:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8B06A3C235A
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:28:17 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 02FF32011C7
 for <ltp@lists.linux.it>; Thu, 24 Oct 2019 14:28:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 48D3DB2FD;
 Thu, 24 Oct 2019 12:28:16 +0000 (UTC)
Date: Thu, 24 Oct 2019 14:28:14 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191024122814.GC27782@rei.lan>
References: <20191011090737.17997-1-lkml@jv-coder.de>
 <20191011100604.GA11441@dell5510>
 <1570799029.4238.15.camel@suse.de> <20191011131041.GA18363@rei>
 <20191011140015.GA27627@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011140015.GA27627@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Rename tst_test_* to tst_require_*
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
Cc: cfamullaconrad@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > > If we use needs or require ? Hard question - when I search for synonyms
> > > from one or the other, I don't see a big different. Without looking on
> > > the impact, require sounds also more descriptive.
> 
> > There is about thousand of uses of *NEEDS_FOO and *needs_foo in the new
> > library tests, so renaming to tst_needs_foo would be the least painful.
> +1.
> 
> Sorry for starting such a big discussion just about API naming.
> I care about these things, because good docs and consistent API are less
> important than good quality code, but helps new users.
> 
> Thank you for all your input, I agree with points other raised, but getting it
> right would be to intrusive change (touching every test is a bit too much).

I would like to end the bikeshedding now and also get the tests fixed so
here is the proposal. If anyone wants to send a patch that unifies the
API on tst_needs_* please do so. If no one starts at least working on
that in a week or two, let's merge this patchset. Does that sound
reasonable to everyone?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
