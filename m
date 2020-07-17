Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA78223699
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 10:08:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656CA3C2911
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jul 2020 10:08:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 116F03C14B3
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 10:08:42 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9AB871000AE2
 for <ltp@lists.linux.it>; Fri, 17 Jul 2020 10:08:42 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34407AFF1;
 Fri, 17 Jul 2020 08:08:46 +0000 (UTC)
Date: Fri, 17 Jul 2020 10:08:40 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200717080840.GB32407@dell5510>
References: <1594959191-25155-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200717073842.GA31254@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717073842.GA31254@dell5510>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/io_uring.h: Add declaration of __kernel_rwf_t
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
Cc: Vikas Kumar <vikas.kumar2@arm.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> > Since kernel commit ddef7ed2b5cb ("annotate RWF_... flags"), fs.h introduced
> >  __kernel_rwf_t data type in 4.14-rc1.
> >
> > Fix build error on old kernel.

> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Thanks for the fix.
> Going to merge it, just wait for travis verification.
BTW the regression was caused by my changes to the lapi header in 95399bc87
("lapi/io_uring: Preparation for io_uring tests") - I updated the header.

We might consider not including <linux/types.h>, it's needed just for
__kernel_rwf_t. I'm against these optimisations (as the definition can change),
but I remember Jan asked me to avoid including kernel header just for single use
[1], but maybe this is a different case.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20191016211501.3777-1-petr.vorel@gmail.com/#2281586

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
