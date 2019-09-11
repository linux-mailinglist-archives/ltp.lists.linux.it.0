Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B74AFDC4
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 15:33:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8FCFB3C20BC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 15:33:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 752F13C0309
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 15:33:18 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 17BE2602356
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 15:33:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 508A4B6B7;
 Wed, 11 Sep 2019 13:33:16 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:33:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190911133315.GA21378@rei.lan>
References: <1560250815-2308-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5D2D681D.1050909@cn.fujitsu.com> <5D440CAA.9080701@cn.fujitsu.com>
 <5D6CC86E.5020009@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D6CC86E.5020009@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cgroup_regression_test.sh: fix test_5 possible
 mount failure because of cgroup hierarchy
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Have somebody noticed this patch? ping.:-)

Sorry for the long delay.

I'm looking at the original reproducer at:

https://lists.openvz.org/pipermail/devel/2009-January/016345.html

And as far as I can tell the test_5() was never actually doing what it
takes to reproduce the bug, as far as I can tell the test was bogus to
begin with. The main point of the reproducer is that the cgroup is
unmounted while there is task in the group, then remounted again. As we
cannot unmount the cgroup these days I would just go for removing the
test instead of applying band aid over the code.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
