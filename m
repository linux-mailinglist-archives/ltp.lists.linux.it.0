Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F862EBC47
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:24:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 390DF3C549D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:24:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 3D4D93C237C
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:24:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 910671400B8E
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:24:26 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08BD1ACAF;
 Wed,  6 Jan 2021 10:24:26 +0000 (UTC)
Date: Wed, 6 Jan 2021 11:25:20 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Luo Fenglin <luofenglin1@huawei.com>
Message-ID: <X/WQEEj8Kx+tvz78@yuki.lan>
References: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] sched/sched_stress:Modify sched driver param
 to run long term testcases
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
Cc: qiangqiang.wangqiang@huawei.com, claire.chenyue@huawei.com,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Add sched_driver process slots param to 10, then long term testcases can run.
> Additionally, add sched_driver run time 0.05 hour, long term testcases
> run 1/5 of total time.

This does not say why should we run the long term testcases for 1/5 of
total time. As far as I can tell the code looks like the long term tests
are supposed to run on background while we execute the short term tests
in a loop while changing their priority.

Also each logical change should be in a separate patch.

The change to to increase the slots looks good, but should really go in
as a separate patch that explains the change.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
