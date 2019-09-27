Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049AC0113
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 10:25:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFEF73C1447
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Sep 2019 10:25:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 60A9A3C0796
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 10:25:15 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5915A100170C
 for <ltp@lists.linux.it>; Fri, 27 Sep 2019 10:25:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4486AECB;
 Fri, 27 Sep 2019 08:25:12 +0000 (UTC)
Date: Fri, 27 Sep 2019 10:25:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20190927082510.GA12604@dell5510>
References: <20190926155608.GC23296@dell5510> <20190926160432.GC9916@magnolia>
 <20190926161906.GD23296@dell5510>
 <CAOQ4uxixSy7Wp7yWYOMpp8R5tFXD2SWR9t3koYO4jBE-Wnt8sQ@mail.gmail.com>
 <20190926175700.GA12619@x230>
 <CAOQ4uxisQx1C7DXrcmq0gma4-bxbaPS5UNwpwnoDOtjYVypXwA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxisQx1C7DXrcmq0gma4-bxbaPS5UNwpwnoDOtjYVypXwA@mail.gmail.com>
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

> > LTP hasn't defined yet any policy about changing errnos,
> > as it's probably best to check whether change was intentional
> > (like your obvious fixes) or not.


> IIUC, copy_file_range02 was written after v5.3 changes to verify that
> copy_file_range
> stays unbroken.
> As such, I would suggest that you check if kernel supports cross-fs copy, like
> copy_file_range01 does and if it doesn't, skip the test entirely.
> If some one ever backports cross-fs copy to any distro stable kernel, then one
> would better also backkport all of those API fixes, otherwise test will fail.
Thanks for a tip, I'll send a patch today.

> Thanks,
> Amir.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
