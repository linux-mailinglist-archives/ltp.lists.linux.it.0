Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5DABF68D
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:19:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A6633C22D8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 18:19:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0B9853C14F6
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:19:09 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1BF8D10009BD
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 18:19:00 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63CB4B173;
 Thu, 26 Sep 2019 16:19:08 +0000 (UTC)
Date: Thu, 26 Sep 2019 18:19:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190926161906.GD23296@dell5510>
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190926160432.GC9916@magnolia>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] copy_file_range() errno changes introduced in v5.3-rc1
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
Cc: linux-xfs@vger.kernel.org, Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Darrick,

> On Thu, Sep 26, 2019 at 05:56:08PM +0200, Petr Vorel wrote:
> > Hi Amir,

> > I'm going to fix LTP test copy_file_range02 before upcoming LTP release.
> > There are some returning errno changes introduced in v5.3-rc1, part of commit 40f06c799539
> > ("Merge tag 'copy-file-range-fixes-1' of git://git.kernel.org/pub/scm/fs/xfs/xfs-linux").
> > These changes looks pretty obvious as wanted, but can you please confirm it they were intentional?

> > * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.
> > * 96e6e8f4a68d ("vfs: add missing checks to copy_file_range") started to return -EPERM, -ETXTBSY, -EOVERFLOW.

> I'm not Amir, but by my recollection, yes, those are intentional. :)
Thanks for a quick confirmation.

> --D

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
