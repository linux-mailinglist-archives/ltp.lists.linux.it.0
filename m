Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EF5193925
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 08:06:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 22F133C4AD8
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Mar 2020 08:06:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 83A783C137B
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:05:58 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C9FED1001569
 for <ltp@lists.linux.it>; Thu, 26 Mar 2020 08:05:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11C65AE87;
 Thu, 26 Mar 2020 07:05:57 +0000 (UTC)
Date: Thu, 26 Mar 2020 08:05:55 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200326070555.GA17560@dell5510>
References: <20200324121742.7130-1-gengcixi@gmail.com>
 <20200325102852.GD5404@yuki.lan> <20200325152821.GA21800@dell5510>
 <CAF12kFv0P4yTVVf-pfXOai8+3urEiWug_dbnTfAXpyfOvzi2ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFv0P4yTVVf-pfXOai8+3urEiWug_dbnTfAXpyfOvzi2ug@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] uart: add uart testcase in kernel
 device-drivers
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cixi,

> >We both Cyril and me mentioned that you don't need to use mktemp (+ it'd be
> >unnecessary dependency).
> Now I knew  TST_NEEDS_TMPDIR  is make a temp direct and cd in it ,
> but I need a file contains random data, this file is to used to test the
> PORT,
> Do you meaning I should creat a normal file use dd ,and named by myself?
Yes. We do not care about test concurrency of the same test (i.e. the same test
run more times simultaneously). And even if we care it could be solved by adding $$ -
PID, i.e.: foo.$$ (but you don't need to).
BTW I wrote it in https://lists.linux.it/pipermail/ltp/2020-March/016107.html

> >> This is problematic as well, it expects that all ports that are not
> >> in-use are loopback connected. This is not true in general case, which
> >> means that we cannot add the test to the kernel_misc runtest file as it
> >> is because it will fail on most of the systems out there.
> >Oh, I didn't realize this obvious thing.
> >> We will have to figure out how to pass which ports are interconnected to
> >> the test somehow, because that is something that only the user who set
> >> up the machine knows.
> >Maybe expect user sets it in some variable before running the test? e.g.:
> we can decide  which PORT can be test,  But just like Cyril said, we don't
> know the machines is run int loopback mode or  HW flow control  mode,
> So can I put the testcase tags into two file in the runtest, one is used to
> test
> loopback mode, and the other is test for   HW flow control  ?
> runtest/uart-loopback
> runtest/uart-HWflow

Wouldn't it help this below?
> > Maybe expect user sets it in some variable before running the test? e.g.:

> > if [ -n "$UART_INTERCONNECTED_PORTS" ]; then
> >     tst_brk TCONF "set space separated interconnected ports in
> > \$UART_INTERCONNECTED_PORTS"
> > fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
