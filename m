Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D372119C015
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:23:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25F923C3012
	for <lists+linux-ltp@lfdr.de>; Thu,  2 Apr 2020 13:23:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 09F0C3C2FFF
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:22:58 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6427F1A0148E
 for <ltp@lists.linux.it>; Thu,  2 Apr 2020 13:22:57 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 10C19AE44;
 Thu,  2 Apr 2020 11:22:57 +0000 (UTC)
Date: Thu, 2 Apr 2020 13:23:09 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200402112309.GA5732@yuki.lan>
References: <20200327134707.4532-1-chrubis@suse.cz>
 <20200327134707.4532-3-chrubis@suse.cz>
 <CAF12kFteeJ6nerju6kwX+Ebzrzd_JPCiJ9jKW4tX9F4Y4s7FEg@mail.gmail.com>
 <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
> I am sorry that when I run the serialcheck on my laptop,
> there always has some error as follow,which mean I cannot
> verify the serialcheck on my computer for now.
> Failed to ioctl(,TIOCGICOUNT,)  -- test ttyUSB0

This one can be ignored, that just means that the counters are not
implemented and the statistics are not printed at the test end.

> tcgetattr() failed: Input/output error -- test ttyS0
> I am trying to find available machine and then run test.

That looks like there is no UART to begin with.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
