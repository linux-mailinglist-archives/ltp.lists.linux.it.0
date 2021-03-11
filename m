Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6237C33744A
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 14:47:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2AA7A3C69C9
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Mar 2021 14:47:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 5F8883C5620
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 14:47:18 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D07BC200FE7
 for <ltp@lists.linux.it>; Thu, 11 Mar 2021 14:47:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30FC6AC16;
 Thu, 11 Mar 2021 13:47:17 +0000 (UTC)
Date: Thu, 11 Mar 2021 14:49:02 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YEofzk8nrVepc78j@yuki.lan>
References: <20210301220222.22705-1-pvorel@suse.cz>
 <20210301220222.22705-7-pvorel@suse.cz>
 <CAEemH2c2Bma-xXTcf+1M4CFVjM7ZQS36rV_6i9kJ6Es-19kghA@mail.gmail.com>
 <YD4RairzgAuyBn7S@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YD4RairzgAuyBn7S@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > >  _tst_cleanup_timer()
> > >  {
> > > @@ -442,6 +442,14 @@ _tst_multiply_timeout()
> > >         return 0
> > >  }
> 
> > > +_tst_run_timer()
> 
> 
> > Hmm, this name is not good than before, or rename to _tst_kill_timer_pid(),
> > _tst_stop_timer()?
> 
> Good point. I slightly prefer _tst_stop_timer, but no hard feeling about it.

Or _tst_kill_test()?

> > > +{
> > > +       tst_res TBROK "test killed, timeout! If you are running on slow
> > > machine, try exporting LTP_TIMEOUT_MUL > 1"
> > > +       kill -INT -$pid
> > > +       sleep 5
> > > +       kill -KILL -$pid

Maybe we should change the messages to reflect what is happening and
maybe we should check if the test is still running before sending
SIGKILL with kill -0 $pid?

	tst_res TBROK "Test timeouted, sending SIGINT, ...."
	kill -INT -$pid

	sleep 5

	if kill -0 $pid 2>&1 > /dev/null; then
		tst_res TBROK "Test still running, sending SIGKILL"
		kill -KILL -$pid
	fi

We can also bussy loop wait for the process to terminate, e.g. loop 10
times with sleep 1 in the body and break the loop if kill -0 $pid
returns failure.

> > > +}
> > > +

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
