Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BECC3BB1D9
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 12:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 76B373C2077
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Sep 2019 12:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3AAA13C1C7C
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 12:02:14 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D33151001571
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 12:02:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2E4DFB021;
 Mon, 23 Sep 2019 10:02:13 +0000 (UTC)
Date: Mon, 23 Sep 2019 12:02:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190923100211.GA32293@dell5510>
References: <20190919094544.GA21345@rei>
 <1568889488-4032-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190919140931.GA14614@x230>
 <02ed63c6-102d-4aeb-39db-b9ea8f561b9c@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02ed63c6-102d-4aeb-39db-b9ea8f561b9c@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] cgroup_regression_test.sh: Remove obselte
 test_5
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

> > Merged, with additional note, why it's safe to remove it:

> >      [ pvorel: test_5 is testing 839ec5452ebf ("cgroup: fix root_count when
> >      mount fails due to busy subsystem") from v2.6.29-rc4 which fixes
> >      e5f6a8609bab ("cgroups: make root_list contains active hierarchies
> >      only") from v2.6.24-rc1. While there are still people testing LTP on
> >      2.6.x, nobody should be using -rc version now. ]
> I think your wrote v2.6.24-rc1 unexpectedly. commit e5f6a8609bab fixes the
> bug since v2.6.29-rc1 not v2.6.24-rc1. In addition to this typo, this reason
> looks good to me.
Thanks for info, unfortunately too late, git already has wrong kernel version in
the commit message. Sorry for an error.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
