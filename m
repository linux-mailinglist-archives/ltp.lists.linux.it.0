Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21C18C6B7
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 06:15:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D48A3C549D
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Mar 2020 06:15:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 040B83C5449
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 06:15:38 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 885DD60086B
 for <ltp@lists.linux.it>; Fri, 20 Mar 2020 06:15:34 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.72,283,1580745600"; d="scan'208";a="86649926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Mar 2020 13:15:32 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D58F650A998E;
 Fri, 20 Mar 2020 13:05:24 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Mar 2020 13:15:31 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20200317123203.GA21921@dell5510>
 <1584527574-28177-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200319112332.GB440@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c65a46ee-3355-d9b8-dd27-905962384af9@cn.fujitsu.com>
Date: Fri, 20 Mar 2020 13:15:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200319112332.GB440@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D58F650A998E.ADD6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/add_key05: add maxbytes/maxkeys test
 under unprivileged user
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

Hi Petr

> Hi Xu,
> 
>> This case is designed to test whether we can reach maxbytes/maxkeys
>> quota exactly under unprivileged users. It is a regression test for
>> commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly").
>> But this kenrel commit is a incomplete fix, it still fails on lastest
> nit: typos: kenrel, lastest (will be fixed during merge).
>> upstream kernel. Fix patch[1] is on linux-next branch.
> 
>> [1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e356101e72a
> I guess this commit get's preserved when merged in mainline, so we don't have to
> wait for it.
This morning, I got email about this patch[1](change subject"keys: Fix 
the keys quotas limit check"). I'm not sure whether they will recycle 
and modify this.

[1]https://patchwork.kernel.org/patch/11411507/
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> LGTM except one concern about ltpuser setup.
> 
>> +++ b/testcases/kernel/syscalls/add_key/add_key05.c
> ...
>> + * Test unprivileged user can support the number of keys and the
>> + * number of bytes consumed in payloads of the keys. The defalut
>> + * value is 200 and 20000.
>> + * This is also a regresstion test for
> nit: typos: defalut, regresstion (will be fixed during merge).
Sorry for these typos.
> 
>> + * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
>> + * commit 2e356101e72a ("KEYS: reaching the keys quotas correctly")
>> + */
> 
>> +struct passwd *ltpuser;
> ...
>> +static void add_user(void)
>> +{
>> +	if (user_added)
>> +		return;
>> +
>> +	const char *const cmd_useradd[] = {"useradd", username, NULL};
>> +	int rc;
>> +
>> +	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
>> +	case 0:
>> +		user_added = 1;
>> +		ltpuser = SAFE_GETPWNAM(username);
>> +		break;
>> +	case 1:
>> +	case 255:
>> +		break;
>> +	default:
>> +		tst_brk(TBROK, "Useradd failed (%d)", rc);
>> +	}
>> +	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
>> +}
> ltpuser is undefined for 1 and 255, therefore it gets SIGSEGV. It should either
> require tst_run_cmd to exit 0 or use 0 as UID (root UID).
Oh, sorry for this obvious mistake, thanks for pointing out it.
Yes, I prefer to exit when running into 0 or 255.

Best Regards
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
