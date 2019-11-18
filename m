Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C623FFFFEC
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 08:59:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4F513C237B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 08:59:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4593C3C149D
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 08:59:35 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 1EF681A017B9
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 08:59:33 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,319,1569254400"; d="scan'208";a="78660279"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 Nov 2019 15:59:29 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id AB7694CE1BE7;
 Mon, 18 Nov 2019 15:51:14 +0800 (CST)
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 18 Nov 2019 15:59:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local ([fe80::c04f:a92d:e25c:5f44])
 by G08CNEXMBPEKD04.g08.fujitsu.local
 ([fe80::c04f:a92d:e25c:5f44%14]) with
 mapi id 15.00.1395.000; Mon, 18 Nov 2019 15:59:33 +0800
From: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
To: Petr Vorel <pvorel@suse.cz>
Thread-Topic: [PATCH v3 2/5] syscalls/quotactl02.c: Add Q_XGETQSTATV test
Thread-Index: AQHVkLOriL+AMLKpH0WR/ekHagHSyaeMEDgAgASMHOA=
Date: Mon, 18 Nov 2019 07:59:33 +0000
Message-ID: <791f40c927114eb8b9ce5320d8c33447@G08CNEXMBPEKD04.g08.fujitsu.local>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115174110.GB22234@x230>
In-Reply-To: <20191115174110.GB22234@x230>
Accept-Language: en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.167.220.84]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: AB7694CE1BE7.AF7BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/5] syscalls/quotactl02.c: Add Q_XGETQSTATV
 test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


>Hi Xu,
> >Q_XGETQSTATV returns XFS filesystem-specific quota information in the 
> >fs_quota_statv pointed to by addr. The qs_version field of the 
> >structure should be filled with the version of the structure supported 
> >by the caller (for now, only FS_QSTAT_VERSION1 is supported).
>nit: one would think you add 1 test case. But you added 8 test cases, all of them are XFS related, but only 4 related to Q_XGETQSTATV.
For user quota, I add 2 test cases to use Q_XGETQSTATV to get status for Q_XQUOTAOFF and Q_XQUOTAOFF . 
Also, I add group quota for this case as quotactl01.c.  so I add 8 (2+6) test cases.  I will update group coverage in commit info. 

Ps: I want to use Q_XGETQSTAT to test  Q_XQUOTAOFF, Q_XGETQSTATV to test Q_XQUOTAON. So it can be only 8 test cases. But Q_XGETQSTATV
is introduced since v3.12-rc1 commit[1]. We should use a pair (on,off )to test Q_XGETQSTATV.

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d5e3d57605e77708685e8d20a40fe86891db299

>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
>Reviewed-by: Petr Vorel <pvorel@suse.cz> Nice work, thanks!
Thanks for your review.

>>Nit: I'd just extract quotactl02.h later in the commit, where the code needs to be reused (i.e. in 0cc1dc512 ("syscalls/quotactl05: add project quota test for xfs filesystem")) or at least mention why you do it now.
I will mention it in commit info.
>> +++ b/testcases/kernel/syscalls/quotactl/quotactl02.c
>...
>> +#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
>> +	{QCMD(Q_XQUOTAOFF, GRPQUOTA), &qflagg, check_qoffv,
>> +	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
> >+	"turn off xfs quota and get xfs quota off statv for group"},
>
>> -	tst_res(TPASS, "quoactl() succeeded to set and use %s to get xfs disk quota limits",
> >-			desp);
> >-}
> >+	{QCMD(Q_XQUOTAON, GRPQUOTA), &qflagg, check_qonv,
> >+	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
> >+	"turn on xfs quota and get xfs quota on statv for group"}, #endif };
>Hm, we don't report some TCONF: Q_XGETQSTATV not supported.
>But that's probably not important
This cmd was introduced since 2013,  I think we should check it. Also,  if we 
Use a new kernel but boot with a older kernel header, HAVE_STRUCT_FS_QUOTA_STATV may be undefined.
But in kernel, it is implemented. So I think we may define a fs_quota_statv struct in ltp, so we can detect whether Q_XGETQSTAT is implemented. 
What do you think about it?

>...
>Kind regards,
>Petr





-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
