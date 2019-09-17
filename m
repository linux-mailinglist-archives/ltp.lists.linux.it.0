Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B70B5373
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 18:55:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 99BD53C20A7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Sep 2019 18:55:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4321E3C208C
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 18:55:23 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 93F8220023E
 for <ltp@lists.linux.it>; Tue, 17 Sep 2019 18:55:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB9AEADEC;
 Tue, 17 Sep 2019 16:55:21 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:55:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190917165520.GA30320@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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

> Hi Petr,

> Thanks for your working.
Thanks for a review!

...
> > +++ b/testcases/lib/tst_test.sh
> > @@ -379,9 +379,41 @@ _tst_rescmp()

> >  _tst_setup_timer()
> >  {
> > +       TST_TIMEOUT=${TST_TIMEOUT:-300}
> >         LTP_TIMEOUT_MUL=${LTP_TIMEOUT_MUL:-1}

> > -       local sec=$((300 * LTP_TIMEOUT_MUL))
> > +       if [ "$TST_TIMEOUT" = -1 ]; then
> > +               tst_res TINFO "Timeout per run is disabled"
> > +               return
> > +       fi
> > +
> > +       local err is_float
> > +       if tst_is_num "$LTP_TIMEOUT_MUL"; then
> > +               if tst_is_int "$LTP_TIMEOUT_MUL"; then
> > +                       [ "$LTP_TIMEOUT_MUL" -ge 1 ] || err=1
> > +               else
> > +                       tst_test_cmds awk
This is the reason: awk dependency.

> > +                       echo | awk '{if ('"$LTP_TIMEOUT_MUL"' < 1) {exit
> > 1}}' || err=1
> > +                       is_float=1
> > +               fi
> > +       else
> > +               err=1
> > +       fi


> I'm OK to allow $LTP_TIMEOUT_MUL being float. But here I don't see what's
> enough reason to add the is_float variable. Because we could use the float
> expression for both types comparing, isn't it?


> > +       if [ "$err" ]; then
> > +               tst_brk TCONF "LTP_TIMEOUT_MUL must be number >= 1!
> > ($LTP_TIMEOUT_MUL)"
> > +       fi
> > +
> > +       if ! tst_is_int "$TST_TIMEOUT" || [ "$TST_TIMEOUT" -lt 1 ]; then
> > +               tst_brk TBROK "TST_TIMEOUT must be int >= 1!
> > ($TST_TIMEOUT)"
> > +       fi
> > +
> > +       local sec
> > +       if [ "$is_float" ]; then
> > +               sec=`echo |awk '{printf("%d\n", '$TST_TIMEOUT' *
> > '$LTP_TIMEOUT_MUL')}'`
> > +       else
> > +               sec=$((TST_TIMEOUT * LTP_TIMEOUT_MUL))
> > +       fi


> Here as well, why we need to distinguish the float and int, is the float
> expression does not work for integer?
Because it brings awk dependency on whole library, which I'm not sure if we
want (awk is a must on linux distros, it's in busybox; it's missing on android
toolsbox, but android project concentrates on syscalls, probably nobody uses
shell tests on android). Also I'm not sure about containers, JeOS etc. (it
sometimes miss a basic dependency).
If awk dependency is ok, it'd simplify test a bit.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
