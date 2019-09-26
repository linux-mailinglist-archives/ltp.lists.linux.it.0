Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B2DBEFAF
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5B8593C23BE
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 12:34:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 52FCF3C0B87
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 12:33:49 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 0CFE81A01466
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 10:54:15 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE2CE30ADBA6;
 Thu, 26 Sep 2019 08:54:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FAD60318;
 Thu, 26 Sep 2019 08:54:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD11C4E589;
 Thu, 26 Sep 2019 08:54:13 +0000 (UTC)
Date: Thu, 26 Sep 2019 04:54:13 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1811360181.2258162.1569488053513.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190926083346.GA13769@rei.lan>
References: <20190906130707.GA7515@rei.lan> <20190925112236.GA17496@rei.lan>
 <748796853.2255246.1569486581084.JavaMail.zimbra@redhat.com>
 <20190926083346.GA13769@rei.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.28]
Thread-Topic: LTP Release
Thread-Index: SCTkEaWWgreEdttxq2r+mitD8/NpEg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 26 Sep 2019 08:54:13 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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



----- Original Message -----
> Hi!
> > > I did a few testruns and so far it looks good.
> > > 
> > > I've send one patch for acct02, which is mostly cosmetic, that I would
> > > like to get merged.
> > > 
> > > I would still consider merging the eBPF regression test, does anybody
> > > have a strong opinion on this?
> > > 
> > > Apart from this preadv203 sometimes fails to trigger EAGAIN on virtual
> > > machines, but I doubt we can fix this before the release, I will try to
> > > do so later on.
> > > 
> > > The rest seems to be good, i.e. failures does not seem to be bugs in
> > > tests.
> > > 
> > > What is the status from rest of you? Is there anything that should be
> > > considered for the release? Is something failing unexpectedly?
> > 
> > I'm thinking if we should patch BPF tests to increase max lock memory
> > to +1MB. On Fedora30 default limit is '64', and I found couple
> > systems which by default come very close to that limit right after boot.
> > So even one iteration of BPF tests will hit a failure.
> 
> I've seen them fail on ppc64le, because of 64k pages as well. Maybe we
> shouldn't workaround the failure but rather print a TINFO message that
> the limit is too low and the test is likely to fail. Then I will write
> the email to kernel developers once the release is done and we will do
> something about them later on.

This appears to be known, and some tools like perf started auto-bumping limit:
  https://lkml.org/lkml/2019/7/17/714

I'd prefer LTP does that too, we can always revert later when it's
fixed/changed on kernel side.

> 
> --
> Cyril Hrubis
> chrubis@suse.cz
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
