Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E3226E22
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 20:17:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0161D3C4E13
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 20:17:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C39973C072E
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 20:17:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 637691000BC2
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 20:17:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0122AACFE;
 Mon, 20 Jul 2020 18:17:06 +0000 (UTC)
Date: Mon, 20 Jul 2020 20:16:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200720181658.GA32123@dell5510>
References: <20200720091449.19813-1-pvorel@suse.cz>
 <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
 <20200720151742.GA16973@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720151742.GA16973@infradead.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@hammerspace.com>, Yong Sun <yosun@suse.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Christoph,

> On Mon, Jul 20, 2020 at 01:32:09PM +0000, Trond Myklebust wrote:
> > On Mon, 2020-07-20 at 11:14 +0200, Petr Vorel wrote:
> > > Reasons to drop:
> > > * outdated tests (from 2005)
> > > * not used (NFS kernel maintainers use pynfs [1])
> > > * written in Python (we support C and shell, see [2])

> > > [1] http://git.linux-nfs.org/?p=bfields/pynfs.git;a=summary
> > > [2] https://github.com/linux-test-project/ltp/issues/547


> > Unlike pynfs, these tests run on a real NFS client, and were designed
> > to test client implementations, as well as the servers.

> > So if they get dropped from ltp, then we will have to figure out some
> > other way of continuing to maintain them.

> NFS tests using the kernel sound like a prime candidate for xfstests.
In the past Yong Sun moved some ext4 related tests from LTP to xfstests.
LTP has various NFS related tests. IMHO more important than where these tests
should be is if anybody has a deeper look into them an cleanup them / rewrite
them from scratch.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
