Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C395F193CC0
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 11:13:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64E9B3C4B02
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 11:13:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 048633C336C
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 11:13:44 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C65D214019D4
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 11:13:43 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3CD3BAD0B
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 10:13:43 +0000 (UTC)
Date: Thu, 26 Mar 2020 11:13:41 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jozef Pupava <jpupava@suse.cz>
Message-ID: <20200326101341.GA12365@dell5510>
References: <20200324143837.51d2df15@daedruan>
 <4be42fd5-51e1-3716-2646-07cd06602262@suse.cz>
 <20200326111040.0bb5eb66@daedruan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326111040.0bb5eb66@daedruan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] Update syscalls/fsync02 to new API
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Jozef, Martin,

> > >  	f_bavail = (stat_buf.f_bavail * stat_buf.f_frsize) /
> > > BLOCKSIZE;  

> > Looks like the original test has another bug here. The correct
> > calculation is:
> > f_bavail = (stat_buf.f_bavail * stat_buf.f_bsize) / BLOCKSIZE;

> > f_frsize is the fragment size, a fraction of a real block used for
> > features like tail packing (stuffing multiple small files into the
> > same physical block). But file systems which don't support tail
> > packing generally have f_frsize == f_bsize.

> > Sorry for not noticing this earlier. Could you include a fix for this
> > in the second patch?
Martin, thanks for catching this.

> No problem Martin, I will fix it.

Thanks, Jozef. Waiting for v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
