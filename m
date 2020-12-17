Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F2F2DD37C
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 16:01:29 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD35D3C57C3
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Dec 2020 16:01:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 547783C2555
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 16:01:28 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DACD01000F2F
 for <ltp@lists.linux.it>; Thu, 17 Dec 2020 16:01:27 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2166FAC90;
 Thu, 17 Dec 2020 15:01:27 +0000 (UTC)
Date: Thu, 17 Dec 2020 16:01:25 +0100
From: Petr Vorel <pvorel@suse.cz>
To: =?iso-8859-2?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>
Message-ID: <X9tyxRv4QNlD9JH7@pevik>
References: <20201217085852.26032-1-kory.maincent@bootlin.com>
 <X9tcZzYQUkkw6abP@pevik>
 <20201217152957.685200a9@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217152957.685200a9@kmaincent-XPS-13-7390>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] fastopen: add require to sch_netem driver
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
Cc: thomas.petazzoni@bootlin.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Kory,

> > > +TST_NEEDS_DRIVERS="sch_netem"  
> > On my system also veth, xfrm_algo and xfrm_user are loaded.

> > veth is added because I use network namespaces based testing (I'll add it on
> > separate patch) and xfrm_algo is used xfrm_user.

> The xfrm_user driver seems not to be needed for the fastopen test.
Thanks for info. Correct, it's loaded by ip xfrm in tst_init_iface()
(which is not required since 250438496).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
