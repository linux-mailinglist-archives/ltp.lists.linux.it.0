Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3823037D6
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 09:26:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 987E43C5EA5
	for <lists+linux-ltp@lfdr.de>; Tue, 26 Jan 2021 09:26:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C2BAD3C0752
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 09:26:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6A9BA1000A6E
 for <ltp@lists.linux.it>; Tue, 26 Jan 2021 09:26:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73799ACF4;
 Tue, 26 Jan 2021 08:26:32 +0000 (UTC)
Date: Tue, 26 Jan 2021 09:26:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YA/SNjjU5ob6S4KR@pevik>
References: <1611625298-2425-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2cHD43cw0nRNHDYF3R5sr0PQYAhtPHz+oxbDMSqsyEJ+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cHD43cw0nRNHDYF3R5sr0PQYAhtPHz+oxbDMSqsyEJ+g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/msync: Assgin value for page_sz
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

Hi Xu, Li,

> On Tue, Jan 26, 2021 at 9:42 AM Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> wrote:

> > Since the previous patch, it removes useless getpagesize()
> > check because this function never fail. But it also remove
> > the page_size assignment and it lead case fail as below:

> > msync02     1  TBROK  :  msync02.c:133: mmap failed: errno=EINVAL(22):
> > Invalid argument
> > msync02     2  TBROK  :  msync02.c:133: Remaining cases broken
> > msync02     3  TBROK  :  msync02.c:147: munmap failed: errno=EINVAL(22):
> > Invalid argument

> > Fix this and also fix compiler warning by using size_t data type instead
> > of int.


> Pushed, thanks for the fix.
I'm sorry for a regression and thanks for fixing it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
