Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD1119AC6E
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 15:12:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 721293C3075
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Apr 2020 15:12:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 11F273C04FD
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 15:12:11 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D2C09600F19
 for <ltp@lists.linux.it>; Wed,  1 Apr 2020 15:12:10 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F18DAE52;
 Wed,  1 Apr 2020 13:12:10 +0000 (UTC)
Date: Wed, 1 Apr 2020 15:12:21 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200401131220.GA3627@yuki.lan>
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
> >If I understand this properly if we set a bit in the modem control
> >register we will test mostly the circuits between CPU and UART
> >controller which is better than nothing, but we are not really testing
> >if the port speed was set correctly since the data are just being copied
> >between registers in the UART controller, so it does not make sense to
> >change the speed in this mode. Or am I mistaken?
> 
> >Also it does not seem to work for me and I've tried with both serial
> >ports on my desktop PC as well as with USB-to-Serial dongle. I can set
> >the bit just fine but loopback does not work.
> 
> In the loopback mode , the data will be transferred in buffer ,and back to
> CPU
> by FIFO way.
> I understand the test flow is CPU->uart Tx-> buffer file->uart Rx->CPU,
> so it does make sense to the uart driver .

Indeed but it does not make sense tu run it with a different baud rates,
since the data are not transmitted at all.

>  BTW??? I found the latest seriacheck git is
> https://github.com/nsekhar/serialcheck.git
> and I test on my arm64 machine of sprdtream. and it does works.
> the test log I had send in another patch
> https://patchwork.ozlabs.org/patch/1264553/

Unfortunately it does not seem to work on my AMD based desktop at all,
my guess is that the loopback bit is silently ignored by the hardware.

Which means that we cannot enable the test by default in loopback mode
after all.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
