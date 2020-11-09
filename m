Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F36172AB157
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 07:37:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B41F23C2F74
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Nov 2020 07:37:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1F65B3C24E3
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 07:37:03 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 873FB1A0064B
 for <ltp@lists.linux.it>; Mon,  9 Nov 2020 07:37:03 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A97DAABCC;
 Mon,  9 Nov 2020 06:37:02 +0000 (UTC)
Date: Mon, 9 Nov 2020 07:37:00 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20201109063700.GA146434@pevik>
References: <1603691317-22811-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <5FA21AA9.9020208@cn.fujitsu.com> <20201106123604.GA30097@yuki.lan>
 <0bc685ce-1983-b900-787f-3d89e75ca48d@163.com>
 <20201106164742.GA6449@rei.lan>
 <f99d3484-f86d-dd8a-e64e-7d9d94533de4@163.com>
 <20201107165518.GB10159@pevik> <5FA8BE07.4040201@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5FA8BE07.4040201@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/4] syscalls/sync01: Remove it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Sorry, I didn't describe the doubt clearly.
> For example:
> 1) open(2) will return -1 if an error occur.
>     Is it necessary to check invalid return value(except -1) if an error
> occur?
> 2) mmap(2) will return MAP_FAILED if an error occurs.
>     Is it necessary to check invalid value(except MAP_FAILED) if an error
> occur?
> Martin's patches have added a check for invalid return value in many safe
> macros but a lot of syscall tests(e.g. after doingTEST()) don't add the
> check for now.
> I am not sure if we need to add the check for all syscall tests. :-)
> BTW: In my opinion, it is hardly to get invalid return value so the check
> seems unnecessary and redundance.
Agree it's hard to get these errors. That's why I would bother just in the
library (in these safe_*() functions).

Kind regards,
Petr Vorel

> Best Regards,
> Xiao Yang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
