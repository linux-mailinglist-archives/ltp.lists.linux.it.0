Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F02261AC
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:13:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 10EDA3C4E2C
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jul 2020 16:13:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 17DE13C2123
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:12:59 +0200 (CEST)
Received: from fieldses.org (fieldses.org [IPv6:2600:3c00:e000:2f7::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C0531001991
 for <ltp@lists.linux.it>; Mon, 20 Jul 2020 16:12:58 +0200 (CEST)
Received: by fieldses.org (Postfix, from userid 2815)
 id 714038768; Mon, 20 Jul 2020 10:12:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 fieldses.org 714038768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fieldses.org;
 s=default; t=1595254375;
 bh=tOp2GC5dEnoPiXY4E7v82/PQH5kc63mmSarJkbNcd5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CCihwot2g7u4xdSoa8Kr2NddsKGWtGCyXKu/epoNjgeV7kPEFrt/P/LqqjTJC1Bkp
 2somJGmCB5IlE2BI/BecqFXghfLWR75xYKkexwJGcqZ0xVqtpsix0QmlAwIaCc15m/
 KzaWWFkQOQYNL4SJFSC6rkVUTr73Ti1pmYP3U6ic=
Date: Mon, 20 Jul 2020 10:12:55 -0400
From: "bfields@fieldses.org" <bfields@fieldses.org>
To: Trond Myklebust <trondmy@hammerspace.com>
Message-ID: <20200720141255.GA25707@fieldses.org>
References: <20200720091449.19813-1-pvorel@suse.cz>
 <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ffb5cd64d5d65b762bdc85b6044b7fdc526d27cb.camel@hammerspace.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
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
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
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

Just for fun, I grepped through old mail to see if I could find any
cases of these tests being used.  I found one, in which Chuck reports an
nfslock01 failure.  Looks like it did find a real bug, which we fixed:

	https://lore.kernel.org/r/8DF85CB6-5FEB-4A25-9715-C9808F37A4B1@oracle.com
	https://lore.kernel.org/r/20160807185024.11705.10864.stgit@klimt.1015granger.net

--b.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
