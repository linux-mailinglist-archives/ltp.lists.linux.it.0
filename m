Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C6D1F5297
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:48:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03D043C2E1E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jun 2020 12:48:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id F1A7E3C0038
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:48:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7225B600EA2
 for <ltp@lists.linux.it>; Wed, 10 Jun 2020 12:48:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 59509AC51;
 Wed, 10 Jun 2020 10:48:21 +0000 (UTC)
Date: Wed, 10 Jun 2020 12:48:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200610104816.GA12808@dell5510>
References: <57a1c19e-d8e5-4389-8565-20e49f144657@G08CNEXMBPEKD05.g08.fujitsu.local>
 <78176e41-03c4-e75b-594b-20731b2d4dfd@cn.fujitsu.com>
 <20200610080529.GA19781@dell5510> <5EE09E11.102@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5EE09E11.102@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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

Hi Yang, Xu,

> Agreed, This patch should focus on replacing LIB with INTERNAL_LIB.
+1 merged (with adjusted commit message, added realtime and keeping libdir
changes for now).

Xu, thank you!

> My question about the issue is not important, we can just keep libdir for
> now as you want because someone may add dynamic library linking in future.
Yep, let's leave it now. I guess for adding LTP into traditional linux
distribution (not just have it in QA teams repositories or in embedded distros)
LTP libraries would have to be dynamically linked.

Also traditional distros would probably install most of LTP binaries outside of
/usr/bin, into LTP library path (e.g. /usr/lib64/ltp). Thus I'm for keeping that
old comment in include/mk/generic_leaf_target.inc.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
