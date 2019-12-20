Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D012755C
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:37:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D99103C2078
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Dec 2019 06:37:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 8AF903C1414
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:37:30 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id A52401400778
 for <ltp@lists.linux.it>; Fri, 20 Dec 2019 06:37:27 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,334,1571673600"; d="scan'208";a="80556888"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Dec 2019 13:37:25 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2C076406AB15;
 Fri, 20 Dec 2019 13:28:41 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 20 Dec 2019 13:37:24 +0800
To: Pengfei Xu <pengfei.xu@intel.com>
References: <20191219131855.28799-1-pengfei.xu@intel.com>
 <20191219131855.28799-4-pengfei.xu@intel.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <9ac02979-d8ec-4a11-7705-bb484dd79a20@cn.fujitsu.com>
Date: Fri, 20 Dec 2019 13:37:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191219131855.28799-4-pengfei.xu@intel.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2C076406AB15.AC531
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 4/4] lib: add any kconfig to match the expected
 value function document
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
Cc: Su Heng <heng.su@intel.com>, Neri Ricardo <ricardo.neri@intel.com>,
 ltp <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Hi Pengfei

on 2019/12/19 21:18, Pengfei Xu wrote:
> Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>   doc/test-writing-guidelines.txt | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/doc/test-writing-guidelines.txt b/doc/test-writing-guidelines.txt
> index 79d857fea..e64ff8716 100644
> --- a/doc/test-writing-guidelines.txt
> +++ b/doc/test-writing-guidelines.txt
> @@ -1590,7 +1590,9 @@ aborted with 'TCONF' if any of the required options were not set.
Before your patch, I know we can use the following two formats kconfigs
CONFIG_A
CONFIG_A=y/m/v
after your patch set, we can use the following three formats kconfigs
CONFIG_A
CONFIG_A=y/m/v
CONFIG_A|CONFIGB=y/m/v
As the usual extend logic,  we think  CONFIGA|CONFIGB is also ok. But in 
fact, we use "|" or "=" to delim string. So  we can't parse 
CONFIGA|CONFIGB correctly. So, if we can tell user or developer about 
this in here, it will be better.

ps: we can add configA| config B test in your third patch.

Kind Regards
Yang Xu
>   #include "tst_test.h"
>   
>   static const char *kconfigs[] = {
> -	"CONFIG_X86_INTEL_UMIP",
> +	"CONFIG_EXT4_FS=y",
> +	"CONFIG_MMU",
> +	"CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
>   	NULL
>   };
>   
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
