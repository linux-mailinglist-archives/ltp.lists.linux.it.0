Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A9F207004
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:29:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0AC683C58E5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:29:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id E49D13C0639
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:29:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 686F11A010FC
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:29:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64EA9B14E;
 Wed, 24 Jun 2020 09:29:20 +0000 (UTC)
Date: Wed, 24 Jun 2020 11:29:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Michal Simek <michal.simek@xilinx.com>
Message-ID: <20200624092940.GA30917@yuki.lan>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
 <20200624090523.GA29350@yuki.lan>
 <adafab63-4390-a4a3-b3aa-923b31d5ac37@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adafab63-4390-a4a3-b3aa-923b31d5ac37@xilinx.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [Automated-testing] [PATCH 1/2] tst_test: Add support for
 device discovery
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
Cc: automated-testing@yoctoproject.org, Carlos Hernandez <ceh@ti.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >> Not exactly sure how LTP handles this in general but I think it makes
> >> sense to extend your test (txt_test) parameters to pass TX/RX channel
> >> via parameters directly to test.
> >>
> >> Something like this
> >> uart01_115200 uart01 -b 115200 -t /dev/ttyXX0 -r /dev/ttyXX1
> > 
> > You can pass them in an environment variables. If UART_TX and UART_RX
> > are set the device discovery is not attempted at all and the test just
> > uses these.
> > 
> > If they are not the script is executed and the test loops over the
> > result(s). It would be more complicated if the devices were passed over
> > command line parameters since we would have to re-execute the binary.
> 
> I didn't run LTP for quite a long time myself but on xilinx devices you
> have 3 different uart instances which you can wire: cadence uart (or
> pl011), ns16550 and uartlite.
> That means with the same hw design you should be able to to test
> cadence<=>ns16550 and ns16550<=>uartlite. It means you need to exchange
> variables in the middle of testing.

The whole point of the script is that it returns one configuration per
line and the test then loops over these, which is a bit more flexible
than runtest files.

> Not sure if this is supported but I would simply generate runtest
> description based on information I got from device discovery.
> But I am far from testing at this stage.

The direction I would like to take in the long term is to slowly get rid
of runtest files and replace them with database that would be used by
the test execution framework to execute tests. There are too many
limitations that are imposed by runtest files, which in the end shape
the ways we think about tests. We should have get rid of these long time
ago...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
