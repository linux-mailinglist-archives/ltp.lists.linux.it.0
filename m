Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0401EB217B
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:58:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C276B3C2082
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Sep 2019 15:58:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 2DB7A3C1CFC
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:58:06 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 67D73609692
 for <ltp@lists.linux.it>; Fri, 13 Sep 2019 15:58:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22629AF26;
 Fri, 13 Sep 2019 13:58:05 +0000 (UTC)
Date: Fri, 13 Sep 2019 15:58:04 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Vladut Magas <vladut.m@l4b-software.com>
Message-ID: <20190913135803.GC7939@rei>
References: <VI1PR0101MB2557DC78E7B6994F8429AE11F0B30@VI1PR0101MB2557.eurprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR0101MB2557DC78E7B6994F8429AE11F0B30@VI1PR0101MB2557.eurprd01.prod.exchangelabs.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Kdump update required
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
> I am writing to you about the kdump. I am trying to run kdump on Debian 9 (Stretch), but the "setup.sh" has a small error as you can see below, based on the error received:
> 
>   CC      /root/Desktop/ltp/testcases/kdump/lib/lkdtm/lkdtm.mod.o
>   LD [M]  /root/Desktop/ltp/testcases/kdump/lib/lkdtm/lkdtm.ko
> make[3]: Leaving directory '/usr/src/linux-headers-4.9.0-9-amd64'
> make[2]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib/lkdtm'
> make[1]: Leaving directory '/root/Desktop/ltp/testcases/kdump/lib'
> + echo Modify Boot Loader.
> Modify Boot Loader.
> + [ x86_64 = ppc64 ]
> + [ x86_64 = i686 ]
> + [ x86_64 = ia64 ]
> + args=crashkernel=256M@128M
> + [ -x /sbin/grubby ]
> + echo Warn: please make sure the following arguments are in Boot Loader:
> Warn: please make sure the following arguments are in Boot Loader:
> + echo crashkernel=256M@128M
> crashkernel=256M@128M
> + echo Hit any key when ready.

This tells you to modify the bootloader command line by hand.

> Hit any key when ready.
> + read
> ./setup.sh: 105: read: arg count
> Makefile:2: recipe for target 'all' failed
> make: *** [all] Error 2

This is a harmless error caused by the fact that debian uses dash as a
default shell.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
