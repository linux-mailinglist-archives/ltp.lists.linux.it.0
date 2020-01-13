Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1826513893D
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 02:31:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74F8D3C2026
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Jan 2020 02:31:19 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 1DEF73C12E6
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 02:31:15 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id DC8ED1A0088B
 for <ltp@lists.linux.it>; Mon, 13 Jan 2020 02:31:14 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,427,1571673600"; d="scan'208";a="81705814"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Jan 2020 09:31:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 31B824CE1BE8;
 Mon, 13 Jan 2020 09:22:08 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 13 Jan 2020 09:31:11 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200109124101.GE31981@rei.lan>
 <1578651702-19486-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200110143053.GA23359@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <ca5cf759-6cb9-1a96-9901-b37b77e9f0ec@cn.fujitsu.com>
Date: Mon, 13 Jan 2020 09:31:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200110143053.GA23359@rei.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 31B824CE1BE8.AFDAA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] syscalls/capset02: Cleanup & convert to
 new library
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

Hi Cyril
>> +	TEST(prctl(PR_CAPBSET_DROP, CAP_KILL));
>> +	if (TST_RET == -1)
>> +		tst_res(TFAIL | TTERRNO, "drop CAP_KILL failed");
>> +	else
>> +		drop_flag = 1;
> This flag does not seem to be used anywhere. Can't we simply tst_brk()
> here if the call fails?

Since it has used needs_root flag, I think removing this flag is ok(I 
removed it in verify functions, but forgot to remove it in setup).

Best Regards
Yang Xu



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
