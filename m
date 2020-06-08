Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E18531F1672
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:10:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 73FEE3C2E80
	for <lists+linux-ltp@lfdr.de>; Mon,  8 Jun 2020 12:10:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 5E13A3C2029
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:10:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B31331A00FC8
 for <ltp@lists.linux.it>; Mon,  8 Jun 2020 12:10:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9597BAC49;
 Mon,  8 Jun 2020 10:10:37 +0000 (UTC)
Date: Mon, 8 Jun 2020 12:10:32 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200608101032.GA9222@dell5510>
References: <1591083478-5342-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591083478-5342-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] LIB: Use INTERNAL_LIB for ltp lib
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Cyril concerned 3rd party use of lib/libltp.a, but nobody complained.
Given Jan acked v1, I'd be also for merge.

> Use INTERNAL_LIB for ltp lib because installing these ltp static
> library in any situation is meaningless.

> all static library as below:
> ./libs/libltpuinput/libltpuinput.a
> ./libs/libltpnewipc/libltpnewipc.a
> ./libs/libltpnuma/libltpnuma.a
> ./libs/libltpipc/libltpipc.a
> ./libs/libltpipc/libltpmsgctl.a
> ./utils/sctp/lib/libsctp.a
> ./utils/sctp/testlib/libsctputil.a
> ./lib/libltp.a
> ./testcases/network/rpc/basic_tests/rpc01/lib/librpc01.a
> ./testcases/network/rpc/rpc-tirpc/tests_pack/lib/librpc-tirpc.a
> ./testcases/kernel/containers/libclone/libclone.a
> ./testcases/kernel/mem/hugetlb/lib/libhugetlb.a
> ./testcases/kernel/mem/lib/libmem.a
> ./testcases/kernel/controllers/libcontrollers/libcontrollers.a
> ./testcases/kernel/controllers/cpuset/cpuset_lib/libcpu_set.a
> ./testcases/kernel/lib/libkerntest.a
nit: I'd remove './' from commit message.

Kind regards,
Petr

> Also include Android_libpthread and android_librt and remove useless
> libdir variable.

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
> v1->v2:
> 1.remove ./testcases/commands/nm/datafiles/lib.a from commit message
> 2.add two anroid Makefiles
> 3.remove useless libdir
FYI I'm still having in my mind trying dynamic library linking.
But if I ever do it I'll just re-add this variable.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
