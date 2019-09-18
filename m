Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C7DB60B9
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 11:50:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 40B173C20CB
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 11:50:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EB5C03C20BC
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 11:50:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E0484600929
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 11:50:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6E383AE2F;
 Wed, 18 Sep 2019 09:50:25 +0000 (UTC)
Date: Wed, 18 Sep 2019 11:50:23 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190918095023.GA31233@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
 <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
 <20190918082421.GA11711@x230>
 <CAEemH2duVbDqZ3UG3aHi4rQPFr-g-yxy3q-Jfw8p+2KV9ta=Tw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2duVbDqZ3UG3aHi4rQPFr-g-yxy3q-Jfw8p+2KV9ta=Tw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

> On Wed, Sep 18, 2019 at 4:24 PM Petr Vorel <pvorel@suse.cz> wrote:

> > ...

> > > So, maybe that could be as a reason to disable float support for
> > > $LTP_TIMEOUT_MUL?

> > Maybe I'm missing something, therefore explaining the intent of the code.
> > (int was handled in if tst_is_int "$LTP_TIMEOUT_MUL"; then):

> I'm not blaming the int/float judgment, there is no problem. My concern is:

> If the $LTP_TIMEOUT_MUL is float and awk command is missing, how things
> will be going?

> It will break at:
>     tst_test_cmds awk
> right?
Yes. The concern is described in the commit message (but it should also be in
wiki page I guess): you want float => you need awk. You don't have float, just
set it as int (which will affect also C).
Does it make sense? Is it useful?

> Given that break on float number handling, why not declare only support
> integer for $LTP_TIMEOUT_MUL?
Sure, we can do it. But I propose to do it for C as well otherwise setup valid
for C will be breaking shell. But that's a backward incompatibility change.
That's why I suggested IMHO the least intrusive change (but maybe I'm wrong).
Anyone else having strong opinion?

> I hope I explained clearly this time, haha ;-)
Sure, sorry to be slow :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
