Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5A7302372
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:02:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11B5F3C5F36
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Jan 2021 11:02:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 05BAA3C06E2
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:02:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 25AA2600351
 for <ltp@lists.linux.it>; Mon, 25 Jan 2021 11:02:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 70C3FAF0F;
 Mon, 25 Jan 2021 10:02:54 +0000 (UTC)
Date: Mon, 25 Jan 2021 11:02:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YA6XTdOpqlXg2ybX@pevik>
References: <20210106181735.1588-1-pvorel@suse.cz>
 <CAEemH2dVgwHREFGrOe1tNUgZXZn5OAo5PJ-nne_yoj2nRHt=pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dVgwHREFGrOe1tNUgZXZn5OAo5PJ-nne_yoj2nRHt=pw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] syscalls/get_mempolicy01: Rewrite to new
 API
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> > +               struct bitmask *exp_mask = *(tc->exp_nodemask);
> > +
> > +               if (!numa_bitmask_equal(exp_mask, getnodemask)) {
> > +                       tst_res(TFAIL, "masks are not equal");
> > +                       tst_res_hexd(TINFO, exp_mask->maskp,
> > +                               exp_mask->size / 8, "expected:");
> > +                       tst_res_hexd(TINFO, getnodemask->maskp,
> > +                               getnodemask->size / 8, "returned:");
> > +               }


> These few lines have a code indent issue, otherwise looks good.

> Reviewed-by: Li Wang <liwang@redhat.com>

Thanks for your review, merged with fixed indent.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
