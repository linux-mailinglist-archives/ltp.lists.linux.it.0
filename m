Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E200374EDF
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 07:30:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA6F63C5687
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 07:30:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9ADC53C19D6
 for <ltp@lists.linux.it>; Thu,  6 May 2021 07:30:15 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 04496140126F
 for <ltp@lists.linux.it>; Thu,  6 May 2021 07:30:14 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1EB4FB113;
 Thu,  6 May 2021 05:30:14 +0000 (UTC)
Date: Thu, 6 May 2021 07:30:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: zhaogongyi <zhaogongyi@huawei.com>
Message-ID: <YJN+5P2lUWi0gX5K@pevik>
References: <ebf341b8fdd0424aae31204b4376d559@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebf341b8fdd0424aae31204b4376d559@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/unlinkat01: Bugfix and update to new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Gongyi,

> Hi Petr,

> Thanks for your review!
yw :)

> > > -char *TCID = "unlinkat01";
> > > -int TST_TOTAL = TEST_CASES;
> > > -
> > >  static const char pathname[] = "unlinkattestdir",
> > >  		  subpathname[] = "unlinkatsubtestdir",
> > >  		  subpathdir[] = "unlinkattestdir/unlinkatsubtestdir",
> > > @@ -65,82 +41,79 @@ static const int flags[] = { 0, 0, 0, 0, 9999, 0,
> > > AT_REMOVEDIR };

> > Could you please use static struct for testcases data which is the usual way
> > in LTP instead of using arrays? (e.g. in
> > testcases/kernel/syscalls/access/access02.c).
> > It helps to the readability of the code as we'll be able to remove lines like:
> > 	fds[1] = fds[4] = fds[6] = fds[0];

> > and most of the setup.

> > Than you can then drop also TEST_CASES.

> It is more clearer that using arrays, but in this case, fds and filenames can not be complete initialized at first, so it seems there are some trouble to cleanup,

> Chould you give me some suggestions for it?
How about adding functions to setup things and have pointer to the functions?
See examples in testcases/kernel/syscalls/chmod/chmod06.c
or testcases/kernel/syscalls/clone/clone08.c

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
