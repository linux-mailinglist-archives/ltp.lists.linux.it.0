Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5046F229AE9
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:01:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E56BD3C7705
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jul 2020 17:01:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 3335A3C265E
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:01:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 797031401626
 for <ltp@lists.linux.it>; Wed, 22 Jul 2020 17:01:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A7B9AEDA;
 Wed, 22 Jul 2020 15:01:13 +0000 (UTC)
Date: Wed, 22 Jul 2020 17:01:24 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200722150124.GA2714@yuki.lan>
References: <20200618094139.24579-1-xuyang_jy_0410@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618094139.24579-1-xuyang_jy_0410@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] libs/libltpnewipc: Add libnewmsgctl.c
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Add libnewmsgctl.c into ltp new ipc libs, so the upcoming msgstress cleanup cases
> can use doreader/dowirter functions such as old libmsgctl.c does.
> 
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  include/libnewmsgctl.h           |  22 +++++++
>  libs/libltpnewipc/libnewmsgctl.c | 102 +++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>  create mode 100644 include/libnewmsgctl.h
>  create mode 100644 libs/libltpnewipc/libnewmsgctl.c

As far as I can tell this is only used in msgstress testcases right?

So unless we plan to use it from different tests it does not make much
sense to export it to the top level include and libs.

Or alternatively we do have libltpnewipc we can pust put the
libnewmsgctl.c to that directory and with that we will have a single
System V IPC helper library.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
