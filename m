Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E81229A764
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 10:10:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E43363C55FF
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Oct 2020 10:10:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 9B11A3C2239
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 10:10:47 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B1E3F1000B1E
 for <ltp@lists.linux.it>; Tue, 27 Oct 2020 10:10:46 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,423,1596470400"; d="scan'208";a="100551073"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 27 Oct 2020 17:10:44 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 7CDA64CE1504;
 Tue, 27 Oct 2020 17:10:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 27 Oct 2020 17:10:39 +0800
Message-ID: <5F97E40E.2060201@cn.fujitsu.com>
Date: Tue, 27 Oct 2020 17:10:38 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Martin Doucha <mdoucha@suse.cz>
References: <20201026164756.30556-1-mdoucha@suse.cz>
 <20201026164756.30556-3-mdoucha@suse.cz>
In-Reply-To: <20201026164756.30556-3-mdoucha@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 7CDA64CE1504.ADA6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.8 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 02/19] Unify error handling in
 lib/tst_safe_sysv_ipc.c
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

Hi Martin

> @@ -135,10 +163,15 @@ int safe_shmctl(const char *file, const int lineno, int shmid, int cmd,
>   	int rval;
>
>   	rval = shmctl(shmid, cmd, buf);
> +
> +	if (rval == -1) {
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"shmctl(%i, %i, %p) failed", shmid, cmd, buf);
> +	}
>   	if (ret_check(cmd, rval)) {
Here should use else,  otherwise it will print two lines error because 
tst_brk_ will not exit in cleanup.

Best Regards
Yang Xu
> -		tst_brk(TBROK | TERRNO,
> -			"%s:%d: shmctl(%i, %i, %p) = %i failed",
> -			file, lineno, shmid, cmd, buf, rval);
> +		tst_brk_(file, lineno, TBROK | TERRNO,
> +			"Invalid shmctl(%i, %i, %p) return value %d", shmid,
> +			cmd, buf, rval);
>   	}
>
>   	return rval;




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
