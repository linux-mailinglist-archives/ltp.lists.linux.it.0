Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 05037BEFB0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70FFC3C2318
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 000A73C234C
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:53 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 32D4510016F5
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 10:33:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77EA6ACE3;
 Thu, 26 Sep 2019 08:33:47 +0000 (UTC)
Date: Thu, 26 Sep 2019 10:33:46 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20190926083346.GA13769@rei.lan>
References: <20190906130707.GA7515@rei.lan> <20190925112236.GA17496@rei.lan>
 <748796853.2255246.1569486581084.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <748796853.2255246.1569486581084.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] LTP Release
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I did a few testruns and so far it looks good.
> > 
> > I've send one patch for acct02, which is mostly cosmetic, that I would
> > like to get merged.
> > 
> > I would still consider merging the eBPF regression test, does anybody
> > have a strong opinion on this?
> > 
> > Apart from this preadv203 sometimes fails to trigger EAGAIN on virtual
> > machines, but I doubt we can fix this before the release, I will try to
> > do so later on.
> > 
> > The rest seems to be good, i.e. failures does not seem to be bugs in
> > tests.
> > 
> > What is the status from rest of you? Is there anything that should be
> > considered for the release? Is something failing unexpectedly?
> 
> I'm thinking if we should patch BPF tests to increase max lock memory
> to +1MB. On Fedora30 default limit is '64', and I found couple
> systems which by default come very close to that limit right after boot.
> So even one iteration of BPF tests will hit a failure.

I've seen them fail on ppc64le, because of 64k pages as well. Maybe we
shouldn't workaround the failure but rather print a TINFO message that
the limit is too low and the test is likely to fail. Then I will write
the email to kernel developers once the release is done and we will do
something about them later on.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
