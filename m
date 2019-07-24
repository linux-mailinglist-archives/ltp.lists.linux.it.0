Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8E72A45
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:38:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 052C43C1CF9
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 10:38:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1315D3C182E
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:38:35 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C62A56009C6
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 10:38:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0CA20AEC8;
 Wed, 24 Jul 2019 08:38:34 +0000 (UTC)
Date: Wed, 24 Jul 2019 10:38:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20190724083838.GA17437@dell5510>
References: <20190723102826.9679-1-liwang@redhat.com>
 <5D36E6F1.7090008@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D36E6F1.7090008@cn.fujitsu.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setdomainname: use strlen() to get length of
 string
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

Hi Li,

> On 2019/07/23 18:28, Li Wang wrote:
> > The sizeof(new) is only to get the size of char *, and it's not corret to pass
> > it as 'len' in setdomainname(). Here replace by strlen() to get the correct number
> > of characters for string.
> Hi Li,

> As setdomainname(2) manpage mentions, name does not require a terminating
> null byte.
> It looks good to me. :-)

> Best Regards,
> Xiao Yang
> > On x86_64, we get this failures if the LTP compilied in 32bit.

> >    -----Error Log-----
> >    setdomainname.h:24: INFO: Testing libc setdomainname()
> >    setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
> >    setdomainname.h:27: INFO: Testing __NR_setdomainname syscall
> >    setdomainname01.c:24: FAIL: getdomainname() returned wrong domainname: 'test'
> >    -------------------

Thanks for fixing it and sorry for introducing obvious error.
Merged into master.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
