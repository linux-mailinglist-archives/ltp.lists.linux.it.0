Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B673325AB
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:46:23 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6E063C6A8F
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 13:46:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3F85C3C4C02
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:46:19 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E8DCA600BFA
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 13:46:18 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C3AEAC17;
 Tue,  9 Mar 2021 12:46:18 +0000 (UTC)
Date: Tue, 9 Mar 2021 13:46:16 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YEduGMNAv1V+sQVs@pevik>
References: <20210309120914.711-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309120914.711-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] max_map_count: Add judgment of abnormal situation
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

Hi,

> When CommitLimit - Committed_AS < 128, there is no post processing,
> and the test will report "TBROK: Test haven't reported results".

> Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
> ---
>  testcases/kernel/mem/tunable/max_map_count.c | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/testcases/kernel/mem/tunable/max_map_count.c b/testcases/kernel/mem/tunable/max_map_count.c
> index aa70fde59..ffc53cbb5 100644
> --- a/testcases/kernel/mem/tunable/max_map_count.c
> +++ b/testcases/kernel/mem/tunable/max_map_count.c
> @@ -162,6 +162,8 @@ static void max_map_count_test(void)
>  	max_iters = memfree / sysconf(_SC_PAGESIZE) * 1024 - 64;
>  	if (max_iters > MAX_MAP_COUNT)
>  		max_iters = MAX_MAP_COUNT;
> +	if (max_iters < 0)
> +		tst_brk(TCONF, "Test nees max_iters > 0, test skipped");
typo: nees => needs (no need to repost, can be changed during merge).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

You seems to exploring limits. Out of curiosity, which system / hw do you test?

Kind regards,
Petr

>  	max_maps = MAP_COUNT_DEFAULT;
>  	while (max_maps <= max_iters) {

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
