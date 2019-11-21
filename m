Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73C1049E5
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 06:10:34 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F008A3C1D76
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 06:10:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 83BA73C14F6
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 06:10:28 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0F3A920097C
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 06:10:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98078AD14;
 Thu, 21 Nov 2019 05:10:25 +0000 (UTC)
Date: Thu, 21 Nov 2019 06:10:22 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191121051022.GA59487@x230>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510> <20191120151610.GB28197@dell5510>
 <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efb495a4-1071-68fd-d5a2-7597646228e1@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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

> > + general question: do we want always test against kernel headers or libc
> > headers? Libc is often outdated, so mostly it'd be our fallback to be tested.
> > Ideally both kernel and libc header should be tested, but that's not easily
> > achievable.

> IMHO, We often test libc and it usually includes kernel headers ie.
> <sys/quota.h> <sys/prctl.h>. I perfet to check one except that glibc and
> kernel they have themselves implementation . If the struct or variable is
> not defined, we can define it in ltp lapi headers. Then we can avoid build
> error and increase coverage(because kernel may implement it).

Yep. I'm ok with using libc headers (increased coverage), but we need good
checks anyway for other libc (at least for musl; bionic also like glibc uses
internally kernel headers, uclibc-ng usually embeds kernel header parts and
strives to be glibc compatible anyway).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
