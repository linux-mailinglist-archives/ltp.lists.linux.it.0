Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC7716423F
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 11:35:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAFED3C25EE
	for <lists+linux-ltp@lfdr.de>; Wed, 19 Feb 2020 11:35:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 459013C1840
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 11:35:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EB0741401A9F
 for <ltp@lists.linux.it>; Wed, 19 Feb 2020 11:35:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2344CACD9;
 Wed, 19 Feb 2020 10:35:06 +0000 (UTC)
Date: Wed, 19 Feb 2020 11:35:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20200219103505.GB28580@rei>
References: <20191204103120.29440-1-rpalethorpe@suse.com>
 <CACT4Y+aMum6OJS_t-_-sXOUftPegFGrAjCvYJ-0g+5z7=aX7GQ@mail.gmail.com>
 <877e0jgewo.fsf@our.domain.is.not.set>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877e0jgewo.fsf@our.domain.is.not.set>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Wrapper for Syzkaller reproducers
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
Cc: syzkaller <syzkaller@googlegroups.com>, ltp@lists.linux.it,
 Richard Palethorpe <rpalethorpe@suse.com>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> Allows one to run the Syzkaller reproducers as part of the LTP.
> >>
> >> Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> >> ---
> >>
> >> V2:
> >>
> >> * Will now refuse to compile on anything other than x86_64, because I haven't
> >>   tested them on anything else.
> >>
> >> * Hopefully fixed problem with submodule not being found because I didn't
> >>   include a commit reference.
> >>
> >> * Added explicity 'no' value if --with-syzkaller-repros is not present
> >>
> >> * Reduced the default timeout in the test to 20 seconds. I found this allows
> >>   me to complete testing in reasonable time.
> >
> > What's the status of this? This wasn't merged yet, right?
> > I don't see this here:
> > https://github.com/linux-test-project/ltp/tree/master/testcases/kernel
> 
> Yeah, it fell to one side due to the LTP release, SUSE Hackweek and lack
> of feedback. Hopefully we can get it merged soon however.

You don't forget about FOSDEM. Unfortunatelly we have managed to
accumulate quite a backlog at the start of the year.

However I do plan to return to this once things settle down a bit.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
