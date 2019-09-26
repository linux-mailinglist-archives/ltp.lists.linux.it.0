Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674FBF83E
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 19:57:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 20BBE3C22DA
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Sep 2019 19:57:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 99C223C22CB
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 19:57:04 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5F04E6002E4
 for <ltp@lists.linux.it>; Thu, 26 Sep 2019 19:57:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 708F6AD2C;
 Thu, 26 Sep 2019 17:57:02 +0000 (UTC)
Date: Thu, 26 Sep 2019 19:57:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190926175700.GA12619@x230>
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
 <20190926161906.GD23296@dell5510>
 <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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
Cc: "Darrick J. Wong" <darrick.wong@oracle.com>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 "Michael Kerrisk \(man-pages\)" <mtk.manpages@gmail.com>,
 Dave Chinner <dchinner@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> > > > * 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices") started to return -EXDEV.

> Started to return EXDEV?? quite the opposite.
> But LTP tests where already adapted to that behavior AFAICT:
> 15cac7b46 syscalls/copy_file_range01: add cross-device test
I'm talking about copy_file_range02 (15cac7b46 changes copy_file_range01).

Anyway, the problem which I want to fix is a backward compatibility for v5.2 and
older to fix errors like this:

copy_file_range02.c:102: INFO: Test #7: overlaping range
copy_file_range02.c:134: FAIL: copy_file_range returned wrong value: 16
copy_file_range02.c:102: INFO: Test #8: block device
copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EINVAL, but got: EXDEV (18)
copy_file_range02.c:102: INFO: Test #9: char device
copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EINVAL, but got: EXDEV (18)
...
copy_file_range02.c:102: INFO: Test #11: max length lenght
copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EOVERFLOW, but got: EINVAL (22)
copy_file_range02.c:102: INFO: Test #12: max file size
copy_file_range02.c:128: FAIL: copy_file_range failed unexpectedly; expected EFBIG, but got: EINVAL (22)

LTP hasn't defined yet any policy about changing errnos,
as it's probably best to check whether change was intentional
(like your obvious fixes) or not.

> > > > * 96e6e8f4a68d ("vfs: add missing checks to copy_file_range") started to return -EPERM, -ETXTBSY, -EOVERFLOW.

> > > I'm not Amir, but by my recollection, yes, those are intentional. :)
> > Thanks for a quick confirmation.


> Which reminds me - I forgot to send the man pages patch out to maintainer:
> https://lore.kernel.org/linux-fsdevel/20190529174318.22424-15-amir73il@gmail.com/

> At least according to man page -EACCES is also possible.
Thanks for fixing man :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
