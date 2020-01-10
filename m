Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E91373DF
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 17:42:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1D033C256A
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 17:42:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 9E8203C2468
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 17:42:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8751E601D44
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 17:42:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DF7ACB22F;
 Fri, 10 Jan 2020 16:42:26 +0000 (UTC)
Date: Fri, 10 Jan 2020 17:42:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200110164224.GA305583@x230>
References: <1578554765-30025-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200110130029.GB25704@x230>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110130029.GB25704@x230>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/capget02: remove useless getpid()
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

> > Since pid=0 returns the capabilities for the calling thread,
> > we can remove getpid. Also we can cover this test point.

> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > -----------------
> > v1-v2:
> > remove pid = 0 assignment, because it has been initialized as 0.
> > add comment
> Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Note, waiting for merge before current git get's fixed.
> (v2 of https://patchwork.ozlabs.org/patch/1220180/).

Thanks for your patch, merged.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
