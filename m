Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEAB72CA2
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 12:52:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 228D43C1CFF
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 12:52:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9B9073C183E
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:52:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 1B18F1401A09
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 12:52:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C115AF9F;
 Wed, 24 Jul 2019 10:52:37 +0000 (UTC)
Date: Wed, 24 Jul 2019 12:52:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190724105236.GB17426@rei.lan>
References: <20190723115937.27247-1-chrubis@suse.cz>
 <CAEemH2d2+X=qOvfb-B9r-CKTvOmC=0kuDGqci0XLFc3bM9U_fA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d2+X=qOvfb-B9r-CKTvOmC=0kuDGqci0XLFc3bM9U_fA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/mbind0{2,3,4}: Add basic mbind tests
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > +#include "tst_test.h"
> > +#include "tst_numa.h"
> > +
> > +#ifdef HAVE_NUMA_H
> 
> HAVE_NUMA_V2 is needed here, to avoid hitting cross-compilation failures.
>     https://travis-ci.com/wangli5665/ltp/builds/120315507

Ah, sorry, I've forgotten about these. I will fix that.

> In case you missed some comments from Petr, plz see:
>     http://lists.linux.it/pipermail/ltp/2019-June/012226.html
>     http://lists.linux.it/pipermail/ltp/2019-June/012227.html
>
> > +
> > +       TEST(mbind(ptr, size, mode, bm->maskp, bm->size + 1, MPOL_MF_STRICT));
> > +
> 
> Maybe we also need to move the tst_numa_unmap/numa_free_nodemask to
> here, in case of the mbind02 hit fail and return early.

Sure will do.

> Besides these tiny issues, patch v3 looks good to me.

Should I send a v4 or can I push the patch with your ack with these two
issues fixed?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
