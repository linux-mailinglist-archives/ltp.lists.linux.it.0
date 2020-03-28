Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E58519635F
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 04:42:58 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DCB063C3344
	for <lists+linux-ltp@lfdr.de>; Sat, 28 Mar 2020 04:42:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 174243C3304
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 04:42:56 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9BDCA10009E5
 for <ltp@lists.linux.it>; Sat, 28 Mar 2020 04:42:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA8D6AF79;
 Sat, 28 Mar 2020 03:42:54 +0000 (UTC)
Date: Sat, 28 Mar 2020 04:42:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <20200328034253.GA2720439@x230>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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

Hi Xiao,

> On 3/28/20 5:39 AM, Petr Vorel wrote:
> > + There is a double check (first in
> > .needs_cmds, then in SAFE_RUN_CMD()), maybe that's not needed.

> Hi Petr,

> Why do you need the duplicate .needs_cmds flag?(it introduces the double
> check as you said)

> Usually, all tests run commands by tst_run_cmd()/SAFE_RUN_CMD() and they can
> report TCONF

> by passing TST_RUN_CMD_CHECK_CMD so it is fair to be a part of
> tst_run_cmd()/SAFE_RUN_CMD().

Thanks for your review.
I guess Cyril will prefer .needs_cmds, as it can be parsed - metadata project:
https://people.kernel.org/metan/towards-parallel-kernel-test-runs
https://github.com/metan-ucw/ltp/tree/master/docparse

I put it there because some command might be run just under some condition (not
always), thus not suitable for .needs_cmds, but still nice to have reliable
check. But maybe I'm wrong.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
