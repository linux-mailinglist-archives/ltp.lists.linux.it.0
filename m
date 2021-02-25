Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC7B324DFD
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 11:29:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE4553C4E6B
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Feb 2021 11:29:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 16AF73C0EA5
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 11:29:05 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7BAF81A0122F
 for <ltp@lists.linux.it>; Thu, 25 Feb 2021 11:29:05 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3C66AAAE;
 Thu, 25 Feb 2021 10:29:04 +0000 (UTC)
Date: Thu, 25 Feb 2021 11:30:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: "ruansy.fnst@fujitsu.com" <ruansy.fnst@fujitsu.com>
Message-ID: <YDd8RZkgR0IdlShx@yuki.lan>
References: <20210224031227.151844-1-ruansy.fnst@cn.fujitsu.com>
 <YDYqZMYBVfh8oiYH@yuki.lan>
 <OSBPR01MB2920DF74B48CA7A680A03257F49E9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OSBPR01MB2920DF74B48CA7A680A03257F49E9@OSBPR01MB2920.jpnprd01.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] ????:  [PATCH 1/2] syscalls/getpid01: Convert to new API
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Do you mean loop 100 times to fork 100 children processes?  I tried in this
> way and found that the pid number just increased sequentially from +0 to +100
> (Because no other processes were created during the test).  So, I am not sure
> if 100 times is enough to test the range?

I'm not sure if it's reasonable to test the whole range, my intention
was to run the test a few times since fork+getpid() should fast enough,
but I guess that if it's fast enough we can fork enough times for the
pid to wrap around.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
