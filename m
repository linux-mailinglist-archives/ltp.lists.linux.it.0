Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 065591CD566
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 11:37:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 759D33C5614
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 11:37:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 83A013C268D
 for <ltp@lists.linux.it>; Mon, 11 May 2020 11:37:05 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2BE4F200B2D
 for <ltp@lists.linux.it>; Mon, 11 May 2020 11:37:04 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2DBA3AE71;
 Mon, 11 May 2020 09:37:07 +0000 (UTC)
Date: Mon, 11 May 2020 11:37:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200511093730.GD3070@yuki.lan>
References: <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
 <20200402112309.GA5732@yuki.lan>
 <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
 <CAF12kFvV=a5HJgDOAOGgdr2CMJhtVsYJ199T=SM1kyQSp-Js=w@mail.gmail.com>
 <20200408141853.GB10178@yuki.lan>
 <CAF12kFuJ=bC2ByRN7ihk=CZnA48zVW9KeAoDJO3+VcOJ13C=ug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFuJ=bC2ByRN7ihk=CZnA48zVW9KeAoDJO3+VcOJ13C=ug@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I had study the ltp execution framework and found that the LTP
> detection device is
> not suitable for device driver test at present.
> Like the UART test, I want have a auto-detect way to find the device
> needed to test
>  in the current running LtP machines.
> Now I have test the uart case in several sprdtream Soc
> these board  have different /dev/tty* device???and I nedd run in CI
> manual export device puzzled me to do the auto-test-job.
> moreover I wil  porting other device driver testcases in the future.
> So can We expand the LTP detection ?

Sorry I haven't managed to work on this before it was time for LTP
release. I will resume my work on this once LTP is released.

My generall idea is that the LTP framework will get a path to a
directory with scripts that would be evaluated at test runtime and will
return list of devices to test. These scripts will have to be supplied
by the user as managing lab hardware is out of scope of the LTP
framework.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
