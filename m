Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0297782CE3
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 09:36:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C5503C1D3C
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Aug 2019 09:36:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 532923C195E
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 09:36:39 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 126271A0112A
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 09:36:37 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98495B03A
 for <ltp@lists.linux.it>; Tue,  6 Aug 2019 07:36:36 +0000 (UTC)
References: <20190801092616.30553-1-chrubis@suse.cz>
 <20190801092616.30553-2-chrubis@suse.cz>
 <CAEemH2dBj6Re=+booW5Lc77P1yumEbqP_4g6NMRPji-CtUG-aw@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: ltp@lists.linux.it
In-reply-to: <CAEemH2dBj6Re=+booW5Lc77P1yumEbqP_4g6NMRPji-CtUG-aw@mail.gmail.com>
Date: Tue, 06 Aug 2019 09:36:35 +0200
Message-ID: <8736ied9to.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/9] lib: Add support for guarded buffers
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
Reply-To: rpalethorpe@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:
>
> I tend to agree with Richard for this. Looks like adding such a new
> field in tst_test struct is a little bit complicated. Maybe we can
> define a series macro for doing that, which something likes:
>
> TST_INIT_GUARD_BUFFER(ptr, size)

I think tst_alloc() is OK (although maybe it should be
tst_guarded_alloc()), but the API is missing its inverse; tst_free().

> TST_INIT_IOVEC_GUARD_BUFFER(ptr, iov_sizes)

Or I guess, tst_alloc() could take tst_buffer(s) as its argument and
return the right type of buffer based on that.

>
> then, testcase just calling it in setup() if needed.

I don't think allocating the buffers in tst_test is a bad idea in
some/most cases. I think the problem is that some primitive, low level
functions are missing, which will make edge cases difficult to deal
with.

--
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
