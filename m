Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6B51D36FD
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 18:52:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4992F3C2EFC
	for <lists+linux-ltp@lfdr.de>; Thu, 14 May 2020 18:52:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id A0A6B3C24E4
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:52:25 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DDD88601C41
 for <ltp@lists.linux.it>; Thu, 14 May 2020 18:52:24 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6A4BAF68;
 Thu, 14 May 2020 16:52:26 +0000 (UTC)
Date: Thu, 14 May 2020 18:52:22 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200514165222.GA2342816@x230>
References: <20200512201416.8299-1-pvorel@suse.cz>
 <20200514144729.GA19276@dell5510>
 <238e6613-dc03-5d7f-bb0b-baccfbe773f6@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <238e6613-dc03-5d7f-bb0b-baccfbe773f6@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] rpc: TCONF when tests aren't compiled +
 remove kill warning
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 5/14/20 10:47 PM, Petr Vorel wrote:
> > Hi,

> > > with this implementation (suggested by Alexey), we get TCONF twice. I=
t's
> > > a bit strange, but I'll keep it, because I like that required binary =
is
> > > printed:
> > > rpc_test 1 TCONF: 'tirpc_rpcb_getaddr' not found
> > > rpc_test 1 TCONF: LTP compiled without TI-RPC support?
> > Please any comment for 2x TCONF. It's a bit strange, but just a tiny de=
tail.
> > I'd like to have this fix in the release.

> Hi Petr,

Hi Yang,

> Why don't you use tst_cmd_available? like this:

> for i in $CLIENT $SERVER; do

> =A0=A0=A0 tst_cmd_available $i || tst_brk TCONF "$i not found.=A0 LTP com=
piled
> without TI-RPC support?"
Thanks for a review.
Yep, I suggested similar solution in v1
https://patchwork.ozlabs.org/project/ltp/patch/20200512152701.23625-1-pvore=
l@suse.cz/

I like solution from v2 (suggested by Alexey) as more elegant, just 2xTCONF=
 is a
bit confusing. But I'm hesitating too much about such a tiny detail :).

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
