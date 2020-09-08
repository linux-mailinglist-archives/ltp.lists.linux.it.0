Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1512C260C36
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:39:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EF5E3C2C31
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:39:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 3479C3C093E
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:39:42 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 8DB0D600B61
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:39:41 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; d="scan'208";a="98998056"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 15:39:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2025348990E4;
 Tue,  8 Sep 2020 15:39:37 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 15:39:36 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>, <ltp@lists.linux.it>
References: <728ce5d6b7e0f3eba8015c078bfc23ec144ce1c2.1599115178.git.viresh.kumar@linaro.org>
 <f7855857470b26fdbebcfe4adf1cd4779852f7ff.1599115178.git.viresh.kumar@linaro.org>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a68a049a-c362-ae0e-3cc8-19cac4cfd741@cn.fujitsu.com>
Date: Tue, 8 Sep 2020 15:39:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f7855857470b26fdbebcfe4adf1cd4779852f7ff.1599115178.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2025348990E4.AB52B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls: select: Rename select04.c to
 select02.c
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Viresh

IMO, we don't need to rename select04 to select02. The later new case 
can use select02 name. It makes select history more clean.

Best Regards
Yang Xu
> Do the rename.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   runtest/quickhit                                            | 2 +-
>   runtest/syscalls                                            | 2 +-
>   testcases/kernel/syscalls/select/.gitignore                 | 2 +-
>   testcases/kernel/syscalls/select/{select04.c => select02.c} | 0
>   4 files changed, 3 insertions(+), 3 deletions(-)
>   rename testcases/kernel/syscalls/select/{select04.c => select02.c} (100%)
> 
> diff --git a/runtest/quickhit b/runtest/quickhit
> index c01dc4f30b9f..9ada4c4c47c2 100644
> --- a/runtest/quickhit
> +++ b/runtest/quickhit
> @@ -180,7 +180,7 @@ sbrk01 sbrk01
>   # Basic test for sbrk(2)
>   select01 select01
>   # Basic select tests
> -select04 select04
> +select02 select02
>   setgid01 setgid01
>   # Basic test for setgid(2)
>   setpgid01 setpgid01
> diff --git a/runtest/syscalls b/runtest/syscalls
> index 105ca29dd29b..0c6bf0e4d0a7 100644
> --- a/runtest/syscalls
> +++ b/runtest/syscalls
> @@ -1150,7 +1150,7 @@ sched_getattr01 sched_getattr01
>   sched_getattr02 sched_getattr02
>   
>   select01 select01
> -select04 select04
> +select02 select02
>   
>   semctl01 semctl01
>   semctl02 semctl02
> diff --git a/testcases/kernel/syscalls/select/.gitignore b/testcases/kernel/syscalls/select/.gitignore
> index 243a092ac6ca..f5a43c23326a 100644
> --- a/testcases/kernel/syscalls/select/.gitignore
> +++ b/testcases/kernel/syscalls/select/.gitignore
> @@ -1,2 +1,2 @@
>   /select01
> -/select04
> +/select02
> diff --git a/testcases/kernel/syscalls/select/select04.c b/testcases/kernel/syscalls/select/select02.c
> similarity index 100%
> rename from testcases/kernel/syscalls/select/select04.c
> rename to testcases/kernel/syscalls/select/select02.c
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
