Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B84492E19DF
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 09:20:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5AD493C2CDA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Dec 2020 09:20:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 05CD83C2963
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 09:20:03 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2CCBA201094
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 09:20:02 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,441,1599494400"; d="scan'208";a="102859917"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 23 Dec 2020 16:20:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 817E44CE601B
 for <ltp@lists.linux.it>; Wed, 23 Dec 2020 16:19:59 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 23 Dec 2020 16:19:59 +0800
Message-ID: <5FE2FDB1.9090402@cn.fujitsu.com>
Date: Wed, 23 Dec 2020 16:20:01 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Feiyu Zhu <zhufy.jy@cn.fujitsu.com>
References: <1608626908-8117-1-git-send-email-zhufy.jy@cn.fujitsu.com>
In-Reply-To: <1608626908-8117-1-git-send-email-zhufy.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 817E44CE601B.AD26F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-2.1 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] Add SAFE_SEMCTL() and SAFE_SEMGET() macro
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Feiyu
> +int safe_semctl(const char *file, const int lineno, int semid, int semnum,
> +		int cmd, ...)
> +{
> +	int rval;
> +	va_list va;
> +	union semun un;
> +
> +	va_start(va, cmd);
> +
> +	un = va_arg(va, union semun);
> +
> +	va_end(va);
> +
> +	rval = semctl(semid, semnum, cmd, un);
> +
> +	if (rval == -1) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +		"semctl(%i, %i, %i,...) failed", semid, semnum, cmd);
> +	} else if (ret_check(cmd, rval)) {
It looks good to me,
Reviewed-by:Yang Xu <xuyang2018.jy@cn.fujitsucom.com>


BTW, we can add some cmds in ret_check function in separate patch.
 From semctl man-pages, it looks like  SETALL/SETVAL  also return 0 on 
success. Also for shmctl man-pages, SHM_LOCK/SHM_UNLOCK also return 0 on 
success. When we write these new cases in future, these cmds should be 
added into ret_check function.

Best Regards
Yang Xu
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"Invalid semctl(%i, %i, %i,...) return value %d", semid,
> +			semnum, cmd, rval);
> +	}
> +
> +	return rval;
> +}
> --




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
