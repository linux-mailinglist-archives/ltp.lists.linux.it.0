Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E69329955
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:20:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9AB13C56E7
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Mar 2021 11:20:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 431F73C56C0
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:20:29 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0392C1400F8F
 for <ltp@lists.linux.it>; Tue,  2 Mar 2021 11:20:28 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3AA59B090;
 Tue,  2 Mar 2021 10:20:28 +0000 (UTC)
Date: Tue, 2 Mar 2021 11:20:26 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YD4RairzgAuyBn7S@pevik>
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-7-pvorel@suse.cz>
 <CAEemH2c2Bma-xXTcf+1M4CFVjM7ZQS36rV_6i9kJ6Es-19kghA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2c2Bma-xXTcf+1M4CFVjM7ZQS36rV_6i9kJ6Es-19kghA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 6/7] tst_test.sh: Run cleanup also after test
 timeout
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

...
> >  _tst_cleanup_timer()
> >  {
> > @@ -442,6 +442,14 @@ _tst_multiply_timeout()
> >         return 0
> >  }

> > +_tst_run_timer()


> Hmm, this name is not good than before, or rename to _tst_kill_timer_pid(),
> _tst_stop_timer()?

Good point. I slightly prefer _tst_stop_timer, but no hard feeling about it.


Kind regards,
Petr

> > +{
> > +       tst_res TBROK "test killed, timeout! If you are running on slow
> > machine, try exporting LTP_TIMEOUT_MUL > 1"
> > +       kill -INT -$pid
> > +       sleep 5
> > +       kill -KILL -$pid
> > +}
> > +

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
