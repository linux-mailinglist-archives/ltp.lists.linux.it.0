Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C237BAE8
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:47:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A5DE43C1D48
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Jul 2019 09:47:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 8E7A83C194D
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:47:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6EA961A01473
 for <ltp@lists.linux.it>; Wed, 31 Jul 2019 09:47:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7971DAE5C;
 Wed, 31 Jul 2019 07:47:22 +0000 (UTC)
Date: Wed, 31 Jul 2019 09:47:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190731074720.GA3894@dell5510>
References: <5D30200B.4050306@cn.fujitsu.com>
 <1564030915-3211-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564030915-3211-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190729140043.GB31077@dell5510> <20190729141011.GA1965@dell5510>
 <5D400066.2090204@cn.fujitsu.com> <20190730133530.GA32652@dell5510>
 <5D413CD8.6040209@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D413CD8.6040209@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 2/3] syscalls/copy_file_range01: add
 cross-device test
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

Hi Xu,

> > I wonder, what I do wrong. I posted whole output of one machine below.
> Hi Petr

> You do nothing wrong.  It fails on various distros because the patchset was merged into upstream kernel since 5.2.

> I guess it was not merged into any distros stable kernel Now.
Thanks for info. I looked into commits during review, but didn't pay attention
when it was merged into mainline.


> patchurl:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=96e6e8f4a
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5dae222a5

> also add xfstests case url:
> https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/553{554,564,565}
https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/tree/tests/generic/{553,554,564,565}

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
