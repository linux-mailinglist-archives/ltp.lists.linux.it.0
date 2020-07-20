Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A66226319
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 17:17:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id EBC883C62F5
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 17:17:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 725073C13E1
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 17:17:48 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 394791401AF9
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 17:17:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RTJCQoT4n3eWjZd87cifxoVNLQME7QIUwsdXFeCJ158=; b=Oly5kqo+KwadkUB4cUygk58rbp
 MRC4xydVj5qb+0LEU7vRlfG1/kiqkmx/KptgXdtczWVZPp2A6vnQqDB252lEUtdXduN0P9qymCI5u
 v89xLosSCAPb5i1lfhjBOxW3cjkLwvZY82rXdw6YJGJdvuOe/TxkQmDavE6j7Kr9QVigFKKrGCDbu
 1jEyTbbz86Lbrx5QrTIWinJqxdU74tYW6svxP25Au+S4E/EcrrGGiK1TQGJ0xwXOL8DbYH22eUbjj
 4ONW4mtlpQqZJcaTxIX95yEjU56QPWjuZdttlm8KutyHy08cvloYC8EOET3ORMu5cM6rLkpgrw2Fs
 rRQITaXg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1jxXXy-0004fJ-Na; Mon, 20 Jul 2020 15:17:42 +0000
Date: Mon, 20 Jul 2020 16:17:42 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20200720151742.GA16973@infradead.org>
References: <20200720091449.19813-1-pvorel@suse.cz>
 <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
 "bfields@fieldses.org" <bfields@fieldses.org>,
 "chuck.lever@oracle.com" <chuck.lever@oracle.com>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Jul 20, 2020 at 01:32:09PM +0000, Trond Myklebust wrote:
> On Mon, 2020-07-20 at 11:14 +0200, Petr Vorel wrote:
> > Reasons to drop:
> > * outdated tests (from 2005)
> > * not used (NFS kernel maintainers use pynfs [1])
> > * written in Python (we support C and shell, see [2])
> > 
> > [1] http://git.linux-nfs.org/?p=bfields/pynfs.git;a=summary
> > [2] https://github.com/linux-test-project/ltp/issues/547
> > 
> 
> Unlike pynfs, these tests run on a real NFS client, and were designed
> to test client implementations, as well as the servers.
> 
> So if they get dropped from ltp, then we will have to figure out some
> other way of continuing to maintain them.

NFS tests using the kernel sound like a prime candidate for xfstests.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
