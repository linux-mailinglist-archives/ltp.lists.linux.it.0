Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A039042E
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:42:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E5063C77C1
	for <lists+linux-ltp@lfdr.de>; Tue, 25 May 2021 16:42:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1896B3C21EB
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:42:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 909BB20076A
 for <ltp@lists.linux.it>; Tue, 25 May 2021 16:42:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1621953731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QbCeHLgxTj1/jabWqB8z0HQV48JxImSyboI/FcPZTMU=;
 b=P0+vOS0BvF0qcYYsC0HhvLn7HzG/hc9/afZkDCp1vKIn6pSaEg4PYjSDRI8+bD9nKjOXJ5
 TNfKCq9yZHzcNijE18Wsb1IOs+HeXWeCb3q5EoaYf1vlK0bcmrfutWxFLCOYgldCe7SJqR
 ervPh8T9MTValh1YDx+ZZBsgXW8nq34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1621953731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QbCeHLgxTj1/jabWqB8z0HQV48JxImSyboI/FcPZTMU=;
 b=AXHjXh0HSQZr9ACb+33Xr1J+por8hcYlCbY8RX60JUhkLHxpvyJCWi5vwGwdGTyPu094na
 th1r6/uI88PMWiDw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8D1CAB71;
 Tue, 25 May 2021 14:42:10 +0000 (UTC)
Date: Tue, 25 May 2021 16:16:08 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YK0GqLg9AUrOxPdx@yuki>
References: <20190911124714.GA21670@rei.lan>
 <1571975625-6322-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dxhzBk+fbR8YnxAKqQSYhsb=HW2B2rov18yOjk9a+5Uw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx04: use stx_attributes_mask before
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
Cc: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > stx_attributes_mask shows what's supported in stx_attributes.
> > Set supp_{append,compr,immutable,nodump} attributes only on filesystems
> > which actually support it.
> >
> > Also merge duplicate code.
> >
> > ---------------
> > v2->v3:
> > 1.add kernel version check for stx_attributes_mask
> > 2. use test_flag(int) instead of test_flagged and test_unflagged
> > ---------------
> >
> > Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> Reviewed-by: Li Wang <liwang@redhat.com>
> 
> This patch makes sense to me, I'm not sure if any blocker issue for
> holding the apply process. If _no_ I would help to merge it:).

See:

https://github.com/linux-test-project/ltp/issues/557

Basically this change hides a kernel bug. I've proposed to create a
separate test for kernel that makes sure that all flags that are
supposed to be enabled are enabled for new enough kernels, then we can
apply this patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
