Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB119995E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 17:14:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8543A3C30B5
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Mar 2020 17:14:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F0CE93C30A6
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 17:14:36 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 75EFC600647
 for <ltp@lists.linux.it>; Tue, 31 Mar 2020 17:14:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 87578AC22;
 Tue, 31 Mar 2020 15:14:35 +0000 (UTC)
Date: Tue, 31 Mar 2020 17:14:44 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Cixi Geng <gengcixi@gmail.com>
Message-ID: <20200331151444.GC2900@yuki.lan>
References: <20200331065442.28591-1-gengcixi@gmail.com>
 <20200331074154.GA23091@dell5510>
 <CAF12kFv9+Bu5q9XxbeUUBuSCWKgSt6dYEwmaepsCUP9qX8OxaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF12kFv9+Bu5q9XxbeUUBuSCWKgSt6dYEwmaepsCUP9qX8OxaQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] uart: add uart testcase in kernel
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
Cc: Carlos Hernandez <ceh@ti.com>, ltp@lists.linux.it,
 Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I hope the ltp test devices have a more convenient way???
> like auto detect if the machine have these devices
> and can run the device test.
> Now we only test the uart device,we can export PORTxx for the test.
> but if we have to test dozens or even hundreds devices,
> the way to set device environment variable needed test is very trouble and
> time consuming
> So I don't think add need_devices is the best desirable way

I think that the right way is that the detection is in the test
execution framework, not it the test, where it does not belong.

So either the execution framework has to be able to re-run the test for
each UART pair, or we have to be able to pass more structured data to
the test. I will think a bit more about this.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
