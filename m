Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E08199DB9
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 20:08:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9C503C30D2
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 20:08:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 1313D3C1CAB
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 20:08:09 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 80A51601034
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 20:08:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D6A7DAC52;
 Tue, 31 Mar 2020 18:08:06 +0000 (UTC)
Date: Tue, 31 Mar 2020 20:08:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200331180816.GE2900@yuki.lan>
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330152122.GA2699@yuki.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it,
 Carlos Hernandez <ceh@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Thank you porting the serialcheck.c into LTP
> > I am sorry to find the serialcheck have not LOOPBACK mode support
> > the LOOPBACK mode is a better test than HW flow , because most machine's
> > uart have not connect the Rx & TX
> > in LOOPBACK mode. we test the uart port directly, So we can test one uart
> > port Rx and Tx functions at the same time .
> > here is the diff  serialcheck with loopback patch
> > So I'd prefer use loopback mode test the uart in case.
> > $ diff serialcheck.c serialcheck-with-loopback.c
> 
> Thanks for the hint, I had no idea that subset serial port hardware has
> a loopback test that could be enabled in modem control register which is
> meant for testing. I will have a closer look tomorrow.

If I understand this properly if we set a bit in the modem control
register we will test mostly the circuits between CPU and UART
controller which is better than nothing, but we are not really testing
if the port speed was set correctly since the data are just being copied
between registers in the UART controller, so it does not make sense to
change the speed in this mode. Or am I mistaken?

Also it does not seem to work for me and I've tried with both serial
ports on my desktop PC as well as with USB-to-Serial dongle. I can set
the bit just fine but loopback does not work.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
