Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 119EC2AEFF3
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 12:48:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8CA493C5281
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 12:48:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 97A473C2639
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 12:48:46 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E1B82600CFC
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 12:48:45 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FBE3AC0C;
 Wed, 11 Nov 2020 11:48:45 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:48:43 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20201111114843.GA14760@pevik>
References: <20201110120923.21759-1-pvorel@suse.cz>
 <20201111093934.GA5870@yuki.lan>
 <CAEemH2cyoSpQhTH5S=EWWoD7DaLz6WKFFadLFHMxkW8LHYM5CA@mail.gmail.com>
 <20201111095553.GA8524@pevik>
 <CAEemH2c4qTU1f99MBXTyVgvX-L=LNRneRJvmctkF9YiQ68u_-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c4qTU1f99MBXTyVgvX-L=LNRneRJvmctkF9YiQ68u_-Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] m4: Remove workaround for old pkg-config
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

> On Wed, Nov 11, 2020 at 5:56 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi,

> > > On Wed, Nov 11, 2020 at 5:38 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> > > > Hi!
> > > > Looks good to me, let's apply this unless anybody complains.


> > > Hold on, please.

> > > Seems we have to replace TIRPC_LIBS/TIRPC_CFLAGS with LIBTIRPC_* in all
> > > respective Makefiles? Otherwise, it will fail like the Travis CI job I
> > > guess.

> > Correct, currently would fail without it.
> > https://travis-ci.org/github/pevik/ltp/builds/742685737

> > I'll send v2 where I implement this.


> Thanks, I modified base on your patch, test result FYI
> https://github.com/wangli5665/ltp/commit/dad10021771101e7fdd416af894be7484fcb7a52
> https://travis-ci.org/github/wangli5665/ltp/builds/742909686
You implemented it, thank you. Please push it after Travis finishes.

Just an explanation, why I introduced TIRPC_{CFLAGS,LIBS}: there was Sun-RPC
implementation in glibc, which I wanted to test. Thus variable name without
"LIB" to say, that it could be also glibc.

But Sun-RPC is broken, was deprecated and my patchset which removes it from
glibc was accepted and released in glibc 2.32. Thus I'm going to send patch
which reverts the commit 60b20c428060b20c428 ("rpc: Enable and fix build basic
RPC tests with glibc SunRPC").

My long term goal: fix and cleanup RPC tests (some are failing also with
libtirpc), move these tests to libtirpc sources (they needs to be cleaned. And
also I'd prefer to not put there whole LTP library, but just needed subset).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
