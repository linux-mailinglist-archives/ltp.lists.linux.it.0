Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE612554F2
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 09:18:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ACB683C55F5
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Aug 2020 09:18:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1BECF3C0639
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 09:18:02 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 191E8600848
 for <ltp@lists.linux.it>; Fri, 28 Aug 2020 09:18:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7637AD0B;
 Fri, 28 Aug 2020 07:18:33 +0000 (UTC)
Date: Fri, 28 Aug 2020 09:17:59 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200828071759.GA24100@dell5510>
References: <20200825064706.GA7135@x230>
 <1598339667-24948-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eS0PS=hmpiWBzkfBQ3cO4K2u2bVgcO5ZK4fz9N+xg7uQ@mail.gmail.com>
 <716a3ffc-fa20-01df-a63f-86a5a50239af@cn.fujitsu.com>
 <CAEemH2faKH1xUAx7GAS_01UYwZfya3AbJj12fqzOoZ6=OTJZrQ@mail.gmail.com>
 <CAEemH2dvu8+GOfd2EHVFuL=KNCQdQyO3xTKz3OXtLqOL_u+7kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dvu8+GOfd2EHVFuL=KNCQdQyO3xTKz3OXtLqOL_u+7kQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] travis: Use centos:7 instead of centos:6
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

Hi,

> On Fri, Aug 28, 2020 at 2:40 PM Li Wang <liwang@redhat.com> wrote:

> > Hi Xu,

> > Sorry for the delay. I guess many Developers(European or North
> > America) are busy with the LPC(Linux Plumbers Conference) recently. please
> > keep patience:).
+1 :)

> > Btw, there is a new build error on CentOS7(seems unrelated to your patch):

> >   /usr/src/ltp/lib/tst_af_alg.c:205:21: error: 'ALG_SET_AEAD_ASSOCLEN'
> > undeclared (first use in this function)
> >   2084 cmsg->cmsg_type = ALG_SET_AEAD_ASSOCLEN;


> Ah, seems you have sent a patch for that, I will help to review soon.
> http://lists.linux.it/pipermail/ltp/2020-August/018651.html
Looking into that.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
