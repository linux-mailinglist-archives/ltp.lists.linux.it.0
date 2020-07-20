Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71819226CB2
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 19:01:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 09A743C62F6
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 19:01:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 611153C2834
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:01:21 +0200 (CEST)
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5A8021A01489
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 19:01:19 +0200 (CEST)
Received: by fieldses.org (Postfix, from userid 2815)
 id 656C4876B; Mon, 20 Jul 2020 13:01:17 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 656C4876B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
 s=default; t=1595264477;
 bh=FLsy/zKNE3XfUWBna3ZW1VaGtM9nrPHT9Sx9XJtZDxM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FUw2qXIiw4Bv1cJPX3u9DqGQnKd6PqqiMHk3nI1GltOxIjUdQrXqPp2FA7185pV6C
 6o5iAsu+ut42sxW+V91Z7dzh7zImym3cvHm86YcokdM/UpedpzaXslPiChxHblWQJE
 pZXNxhOxhnaaj1WVHvKSneWI2QLLq16T7FzvDX24=
Date: Mon, 20 Jul 2020 13:01:17 -0400
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200720170117.GB25707@fieldses.org>
References: <20200720091449.19813-1-pvorel@suse.cz>
 <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
 <20200720141255.GA25707@fieldses.org>
 <20200720143620.GD21201@dell5510> <20200720151508.GA13786@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720151508.GA13786@dell5510>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] Remove nfsv4
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 20, 2020 at 05:15:08PM +0200, Petr Vorel wrote:
> Hi Bruce, Trond,
> 
> > > On Mon, Jul 20, 2020 at 01:32:09PM +0000, Trond Myklebust wrote:
> > > > On Mon, 2020-07-20 at 11:14 +0200, Petr Vorel wrote:
> > > > > Reasons to drop:
> > > > > * outdated tests (from 2005)
> > > > > * not used (NFS kernel maintainers use pynfs [1])
> > > > > * written in Python (we support C and shell, see [2])
> 
> > > > > [1] http://git.linux-nfs.org/?p=bfields/pynfs.git;a=summary
> > > > > [2] https://github.com/linux-test-project/ltp/issues/547
> 
> 
> > > > Unlike pynfs, these tests run on a real NFS client, and were designed
> > > > to test client implementations, as well as the servers.
> 
> > > > So if they get dropped from ltp, then we will have to figure out some
> > > > other way of continuing to maintain them.
> 
> > > Just for fun, I grepped through old mail to see if I could find any
> > > cases of these tests being used.  I found one, in which Chuck reports an
> > > nfslock01 failure.  Looks like it did find a real bug, which we fixed:
> 
> > > 	https://lore.kernel.org/r/8DF85CB6-5FEB-4A25-9715-C9808F37A4B1@oracle.com
> > > 	https://lore.kernel.org/r/20160807185024.11705.10864.stgit@klimt.1015granger.net
> 
> > Thanks for your explanation, this obviously justify these tests in LTP, unless
> > you want to move it to git.linux-nfs.org and maintain on your own.
> Actually, that fix 42691398be08 ("nfsd: Fix race between FREE_STATEID and LOCK")
> from v4.8-rc2 reported by Alexey Kodanev (LTP network maintainer) was found by
> nfslock01 test [1], which is integrated into other LTP NFS tests [2]. I'd
> definitely keep these in LTP.

Whoops, I don't know why I thought I saw nfslock01 in your patch.
Apologies.

> nfsv4 I proposed to remove as outdated and not being used are testing ACL [3]
> and fcntl locking [4]. ACL tests use rsh and aren't integrated into LTP
> framework (use their custom [5] runtest file thus I doubt anyone is using it).
> fcntl locktests are at least integrated into LTP (use fcntl-locktests runtest
> file[6], I forget to remove it in this patch).
> Both tests are written in 2005. I don't want to push for removal, if you see any
> use in it.

Looks like they may test some things (ACL enforcement, multi-client
locking), that our other test suites don't.

On the other hand, if nobody's actually running them then maybe it's on
us to adopt them if we want them.  (Not volunteering for now.)

--b.

> 
> Kind regards,
> Petr
> 
> [1] https://github.com/linux-test-project/ltp/tree/master/testcases/network/nfs/nfslock01/
> [2] https://github.com/linux-test-project/ltp/blob/master/runtest/net.nfs
> [3] https://github.com/linux-test-project/ltp/tree/master/testcases/network/nfsv4/acl
> [4] https://github.com/linux-test-project/ltp/tree/master/testcases/network/nfsv4/locks
> [5] https://github.com/linux-test-project/ltp/blob/master/testcases/network/nfsv4/acl/runtest
> [6] https://github.com/linux-test-project/ltp/blob/master/runtest/fcntl-locktests

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
