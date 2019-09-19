Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FAEB7BB5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:09:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A4A23C215D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 16:09:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 869BA3C1C95
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:09:34 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 942A21401322
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 16:09:33 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEDB8AF25;
 Thu, 19 Sep 2019 14:09:32 +0000 (UTC)
Date: Thu, 19 Sep 2019 16:09:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190919140931.GA14614@x230>
References: <20190919094544.GA21345@rei>
 <1568889488-4032-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568889488-4032-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

> test_5 is a very old regresstion test and kernel code has been
> rewritten completely since 2.6. No user will use such old kernel
> code to test. So I think we can remove it.

> Also rename test10 as test5, modify TST_CNT.

Merged, with additional note, why it's safe to remove it:

    [ pvorel: test_5 is testing 839ec5452ebf ("cgroup: fix root_count when
    mount fails due to busy subsystem") from v2.6.29-rc4 which fixes
    e5f6a8609bab ("cgroups: make root_list contains active hierarchies
    only") from v2.6.24-rc1. While there are still people testing LTP on
    2.6.x, nobody should be using -rc version now. ]

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
