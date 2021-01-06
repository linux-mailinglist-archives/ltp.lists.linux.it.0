Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7C2EBC5A
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:28:57 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97A143C549D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Jan 2021 11:28:57 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3DD823C237C
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:28:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7CF2060074B
 for <ltp@lists.linux.it>; Wed,  6 Jan 2021 11:28:55 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B9218AD19;
 Wed,  6 Jan 2021 10:28:54 +0000 (UTC)
Date: Wed, 6 Jan 2021 11:29:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Luo Fenglin <luofenglin1@huawei.com>
Message-ID: <X/WRDyuFbxDnVLYS@yuki.lan>
References: <1602841876-91490-1-git-send-email-luofenglin1@huawei.com>
 <1602841876-91490-2-git-send-email-luofenglin1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602841876-91490-2-git-send-email-luofenglin1@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] sched/sched_stress:Fixed param of sched_tc
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
> Rt flag of sched_tc must like "-pfixed" or "-pvariable"
> 
> Signed-off-by: luofenglin <luofenglin1@huawei.com>
> ---
>  .../kernel/sched/sched_stress/sched_driver.c  | 51 ++++++++++---------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/testcases/kernel/sched/sched_stress/sched_driver.c b/testcases/kernel/sched/sched_stress/sched_driver.c
> index 1bee9d130..475369b46 100644
> --- a/testcases/kernel/sched/sched_stress/sched_driver.c
> +++ b/testcases/kernel/sched/sched_stress/sched_driver.c
> @@ -621,25 +621,28 @@ char *execution_time;		/* runtime hours to pass to each testcase */
>  		printf("long-term slots available:  %d\n",
>  		       long_term_slot_total);
>  
> +	char timeparam[30];
> +	sprintf(timeparam, "-t%s", execution_time);

Why do we need this? It's not explained in the commit message at all.

The other change looks obviously fine.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
