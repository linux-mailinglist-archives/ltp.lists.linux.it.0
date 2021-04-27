Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9585F36C4FE
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 13:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 664683C6578
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 13:22:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62E783C19B9
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 13:22:51 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 325F21400993
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 13:22:50 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A5CCB17E;
 Tue, 27 Apr 2021 11:22:50 +0000 (UTC)
Date: Tue, 27 Apr 2021 13:03:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YIfveS/5sIwHP7FG@yuki>
References: <20210412145506.26894-1-rpalethorpe@suse.com>
 <20210412145506.26894-3-rpalethorpe@suse.com>
 <CAEemH2ejA9kY2P4HsYEds3g9AjzFQ4mDRuWiF2176istdOMtaA@mail.gmail.com>
 <87o8e1m5zs.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o8e1m5zs.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/7] API: Add macro for the container_of trick
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
> >> ---
> >>  include/tst_common.h | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/include/tst_common.h b/include/tst_common.h
> >> index fd7a900d4..317925d1d 100644
> >> --- a/include/tst_common.h
> >> +++ b/include/tst_common.h
> >> @@ -83,4 +83,9 @@
> >>  #define TST_RES_SUPPORTS_TCONF_TFAIL_TINFO_TPASS_TWARN(condition) \
> >>         TST_BUILD_BUG_ON(condition)
> >>
> >> +#define tst_container_of(ptr, type, member) ({              \
> >> +       const typeof( ((type *)0)->member ) *__mptr = (ptr); \
> >> +       (type *)( (char *)__mptr - offsetof(type,member) );  \
> >> +})
> >>
> >
> > I'd suggest defining it as uppercase 'TST_CONTAINER_OF(...)' to respect
> > other macro's naming policy in tst_common.h.
> 
> I don't mind either way. I suspect it is lower case to match offsetof
> and maybe it is expected to become a compiler intrinsic. Perhaps we
> should remove the tst_. WDYT Cyril??

I think that it makes sense to use the same name as in the Linux kernel
since the macro is well known there. I would go just with container_of()
in this case.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
