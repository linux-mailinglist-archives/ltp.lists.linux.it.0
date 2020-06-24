Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E8206FA5
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:05:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4D1A3C2B9E
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jun 2020 11:05:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id D455B3C0639
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:05:06 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3E92C1401112
 for <ltp@lists.linux.it>; Wed, 24 Jun 2020 11:05:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92A20ACAA;
 Wed, 24 Jun 2020 09:05:04 +0000 (UTC)
Date: Wed, 24 Jun 2020 11:05:23 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Michal Simek <michals@xilinx.com>
Message-ID: <20200624090523.GA29350@yuki.lan>
References: <20200623112827.10744-1-chrubis@suse.cz>
 <20200623112827.10744-2-chrubis@suse.cz>
 <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <574e52f4-8988-a562-57c5-274a86e6e8cb@xilinx.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
> > +++ b/device-discovery.sh
> > @@ -0,0 +1,5 @@
> > +#!/bin/sh
> > +
> > +if [ "$1" = "UART_RX-UART_TX" ]; then
> 
> I am not getting this condition and what exactly you want to tell by that.
> > +	echo "UART_RX=/dev/ttyUSB0 UART_TX=/dev/ttyUSB0"
> 
> In fpga world you can connect two uart inside chip and test different
> device drivers that's why at the end of day only user knows which uarts
> are connected to each other and none will be able to come up with
> universal device-deiscovery.sh script to cover all these cases.

That's the whole point of the patchset.

This is a script I've used for testing with a hardware loopback on the
USB-to-serial bridge, it's not supposed to be included in the end
result. I've kept it there so that people will get the idea how it
should look like.

Also script is passed which devices the test requests, so for i2c eeprom
the parameters would be different and the script would output, for each
present eeprom, a line with an address, bus, etc.

The whole point of the script is to do plug into a Lab CI so that the
information about test device, in this case UART loops, is exposed to
the test. In a real world situation it would either do a call to a
whatever is maintaining a lab hardware inventory, or be written down by
a user before these tests are executed.

> Not exactly sure how LTP handles this in general but I think it makes
> sense to extend your test (txt_test) parameters to pass TX/RX channel
> via parameters directly to test.
> 
> Something like this
> uart01_115200 uart01 -b 115200 -t /dev/ttyXX0 -r /dev/ttyXX1

You can pass them in an environment variables. If UART_TX and UART_RX
are set the device discovery is not attempted at all and the test just
uses these.

If they are not the script is executed and the test loops over the
result(s). It would be more complicated if the devices were passed over
command line parameters since we would have to re-execute the binary.

> IIRC RX and TX device could be the same which can mean that you want to
> use internal or external loopbacks.

The test works fine with external loopback. We will have to add a way
how to pass "enable loopback in MCR" to the test if we want to use that,
but that falls under the "Missing pieces" in the patch description.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
