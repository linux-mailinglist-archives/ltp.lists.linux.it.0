Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9468A1D4D8C
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:17:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34CFF3C53AB
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:17:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id A74E63C20F6
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:17:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 27BF11000CB3
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:17:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E2CAABC7;
 Fri, 15 May 2020 12:17:21 +0000 (UTC)
Date: Fri, 15 May 2020 14:17:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200515121716.GA23472@dell5510>
References: <20200512201416.8299-1-pvorel@suse.cz>
 <20200514144729.GA19276@dell5510> <20200515114507.GA3395@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515114507.GA3395@yuki.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> > > with this implementation (suggested by Alexey), we get TCONF twice. It's
> > > a bit strange, but I'll keep it, because I like that required binary is
> > > printed:
> > > rpc_test 1 TCONF: 'tirpc_rpcb_getaddr' not found
> > > rpc_test 1 TCONF: LTP compiled without TI-RPC support?
> > Please any comment for 2x TCONF. It's a bit strange, but just a tiny detail.
> > I'd like to have this fix in the release.

> I do not really care how many TCONF the test prints as long as the user
> gets a reasonable message.
Yep, it's a really tiny detail.

> With that the patch looks good, acked.
Thanks for your review, pushed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
