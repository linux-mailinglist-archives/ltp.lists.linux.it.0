Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BECF1BFB
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 18:02:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8251D3C23FC
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 18:02:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 134FF3C1CB2
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 18:01:57 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 26CA31A017C8
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 18:01:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 73889B224;
 Wed,  6 Nov 2019 17:01:55 +0000 (UTC)
Date: Wed, 6 Nov 2019 18:01:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20191106170152.GA17047@dell5510>
References: <20191011090737.17997-1-lkml@jv-coder.de>
 <20191011100604.GA11441@dell5510>
 <1570799029.4238.15.camel@suse.de> <20191011131041.GA18363@rei>
 <20191011140015.GA27627@dell5510> <20191024122814.GC27782@rei.lan>
 <20191024124837.GA11934@dell5510> <20191106162605.GB7509@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106162605.GB7509@rei.lan>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: cfamullaconrad@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> > > I would like to end the bikeshedding now and also get the tests fixed so
> > > here is the proposal. If anyone wants to send a patch that unifies the
> > > API on tst_needs_* please do so. If no one starts at least working on
> > > that in a week or two, let's merge this patchset. Does that sound
> > > reasonable to everyone?

> Gentle reminder, this timeouts tomorrow when I will apply the original
> patches, unless someone steps in.
OK, if nobody objects, tomorrow I'll modify Joerg's patchset to be
"Rename tst_test_* to tst_needs_*" and push it on his behalf.

I like *require* more, but it's better to have the same name for variables
and functions.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
