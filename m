Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A432C263F80
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 10:16:24 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A1A83C2C84
	for <lists+linux-ltp@lfdr.de>; Thu, 10 Sep 2020 10:16:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CFB383C224B
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 10:16:22 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6DBC71000BDE
 for <ltp@lists.linux.it>; Thu, 10 Sep 2020 10:16:22 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60AA7AF94;
 Thu, 10 Sep 2020 08:16:37 +0000 (UTC)
Date: Thu, 10 Sep 2020 10:16:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200910081620.GC25487@dell5510>
References: <20200909175707.10670-1-amir73il@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909175707.10670-1-amir73il@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/10] Fanotify tests for v5.9
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
Cc: Jan Kara <jack@suse.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> Hi Petr,

> Following are the tests that were used to develop the upcoming fanotify
> features in v5.9.
Thanks a lot for perfect update. There is LTP freeze soon (in 2 weeks [1]).
I'd like to merge your patches although it'll be probably v5.9 release.

Patches LGTM, but I'd like to give change the others to look into them.

I tested all fanotify tests on 5.9.0-rc3 from openSUSE and on various old
kernels from various distros.

Kind regards,
Petr

[1] http://lists.linux.it/pipermail/ltp/2020-September/018860.html

> The inotify/dnotify tests and fanotify09 test case are regression tests
> for a mid series bug that has been fixed before the merge.

> fanotify10 gets another set of test cases to catch yet another ignored
> mask logic bug. The fix commit will be too hard to backport IMO, so
> perhaps these test cases should go into a new test with .min_kver = "5.9".

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
