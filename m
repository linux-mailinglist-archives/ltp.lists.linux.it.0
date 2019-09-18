Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED68B6523
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 15:53:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 27B9E3C0428
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 15:53:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 2C06D3C0428
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 15:53:32 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BC4661A009AE
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 15:53:30 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B327BB9DF;
 Wed, 18 Sep 2019 13:53:29 +0000 (UTC)
Date: Wed, 18 Sep 2019 15:53:27 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190918135327.GA20793@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
 <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
 <20190918082421.GA11711@x230>
 <CAEemH2duVbDqZ3UG3aHi4rQPFr-g-yxy3q-Jfw8p+2KV9ta=Tw@mail.gmail.com>
 <20190918095023.GA31233@x230>
 <CAEemH2d5imKVecBv_jB7VifdXbf9HZPFX=NAvT7Hgtjjq6VQdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2d5imKVecBv_jB7VifdXbf9HZPFX=NAvT7Hgtjjq6VQdA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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

Hi Li,

> > > If the $LTP_TIMEOUT_MUL is float and awk command is missing, how things
> > > will be going?

> > > It will break at:
> > >     tst_test_cmds awk
> > > right?
> > Yes. The concern is described in the commit message (but it should also be
> > in
> > wiki page I guess): you want float => you need awk. You don't have float,
> > just
> > set it as int (which will affect also C).
> > Does it make sense? Is it useful?


> It's working, but not elegant. Not sure how many people will go through the
> documents for such tiny issues.

> Is there any possibility to handle float by default, and if no awk
> supporting, just round up the float to integer and use it do testing
> automatically?
Yep, that's better idea, thanks!
I'll print some info in case of forcing to round to int in v3.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
