Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B89D422623F
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:36:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6AC643C4E2E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:36:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 364443C26E2
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:36:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 55652601258
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:35:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72241B82E;
 Mon, 20 Jul 2020 14:36:28 +0000 (UTC)
Date: Mon, 20 Jul 2020 16:36:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "bfields@fieldses.org" <bfields@fieldses.org>
Message-ID: <20200720143620.GD21201@dell5510>
References: <20200720091449.19813-1-pvorel@suse.cz>
 <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
 <20200720141255.GA25707@fieldses.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720141255.GA25707@fieldses.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 Trond Myklebust <trondmy@hammerspace.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Bruce, Trond,

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

> Just for fun, I grepped through old mail to see if I could find any
> cases of these tests being used.  I found one, in which Chuck reports an
> nfslock01 failure.  Looks like it did find a real bug, which we fixed:

> 	https://lore.kernel.org/r/8DF85CB6-5FEB-4A25-9715-C9808F37A4B1@oracle.com
> 	https://lore.kernel.org/r/20160807185024.11705.10864.stgit@klimt.1015granger.net

Thanks for your explanation, this obviously justify these tests in LTP, unless
you want to move it to git.linux-nfs.org and maintain on your own.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
