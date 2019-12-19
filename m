Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 11671125A32
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 05:02:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8A873C22C8
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 05:02:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 75DA53C0302
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 05:02:48 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id A24A41000C01
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 05:02:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,330,1571673600"; d="scan'208";a="80498572"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Dec 2019 12:02:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F36224CE1C91;
 Thu, 19 Dec 2019 11:53:55 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 19 Dec 2019 12:02:36 +0800
To: Pengfei Xu <pengfei.xu@intel.com>
References: <20191218122504.9985-1-pengfei.xu@intel.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
Date: Thu, 19 Dec 2019 12:02:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191218122504.9985-1-pengfei.xu@intel.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F36224CE1C91.AF55B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_kconfig.c: add or select kconfig
 function
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
 ltp <ltp@lists.linux.it>, Kasten Robert <robert.a.kasten@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Pengfei

on 2019/12/18 20:25, Pengfei Xu wrote:
> Add "or" select kconfig function:
>    For example, umip kconfig changed from "CONFIG_X86_INTEL_UMIP=y"
> to "CONFIG_X86_UMIP=y": as before v5.4 mainline kernel used
> kconfig "CONFIG_X86_INTEL_UMIP=y", after v5.5 mainline kernel would use
> "CONFIG_X86_UMIP=y".
>    We could fill "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y" in needs_kconfigs
> to check umip kconfig item, which actually is the same item.
> 
> Signed-off-by: Pengfei Xu <pengfei.xu@intel.com>
> ---
>   lib/tst_kconfig.c | 43 +++++++++++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/tst_kconfig.c b/lib/tst_kconfig.c
> index 4b51413e5..91c0a821b 100644
> --- a/lib/tst_kconfig.c
> +++ b/lib/tst_kconfig.c
> @@ -167,7 +167,12 @@ void tst_kconfig_read(const char *const *kconfigs,
>   	struct match matches[cnt];
>   	FILE *fp;
>   	unsigned int i, j;
> -	char buf[1024];
> +	char buf[1024], kconfig_multi[100];
> +	char *kconfig_token = NULL, *p_left = NULL;
> +
> +	fp = open_kconfig();
> +	if (!fp)
> +		tst_brk(TBROK, "Cannot parse kernel .config");
>   
>   	for (i = 0; i < cnt; i++) {
>   		const char *val = strchr(kconfigs[i], '=');
> @@ -178,32 +183,38 @@ void tst_kconfig_read(const char *const *kconfigs,
>   		matches[i].match = 0;
>   		matches[i].len = strlen(kconfigs[i]);
>   
> -		if (val) {
> +		if (val)
>   			matches[i].val = val + 1;
> -			matches[i].len -= strlen(val);
> -		}
>   
>   		results[i].match = 0;
>   		results[i].value = NULL;
> -	}
>   
> -	fp = open_kconfig();
> -	if (!fp)
> -		tst_brk(TBROK, "Cannot parse kernel .config");
> +		while (fgets(buf, sizeof(buf), fp)) {
>   
> -	while (fgets(buf, sizeof(buf), fp)) {
> -		for (i = 0; i < cnt; i++) {
> -			if (match(&matches[i], kconfigs[i], &results[i], buf)) {
> -				for (j = 0; j < cnt; j++) {
> -					if (matches[j].match)
> -						break;
> -				}
> +			memset(kconfig_multi, 0, sizeof(kconfig_multi));
> +			/* strtok_r will split kconfigs[i] to multi string, so copy it */
> +			memcpy(kconfig_multi, kconfigs[i], strlen(kconfigs[i]));
> +
> +			kconfig_token = strtok_r(kconfig_multi, "|=", &p_left)
Here has a problem, if we use CONFIG_X86_INTEL_UMIP, it will report 
"miss this config" because it uses "=" or "|" to delim string.
And I think you should use lib/newlib_tests/test_kconfig.c to test your
introduced feature.

Also, it has another two problems even we use "|" or "=" in kconfigs

1.If  use "CONFIG_X86_INTEL_UMIP=y|CONFIG_X86_UMIP=y" ,it will report y 
is invalid because we use "="or "|" to delim string.
2. If  use "CONFIG_X86_INTEL_UMIP|X86_INTEL_UMIP=y", it will doesn't 
check second config whether invalid if the first is ok.

Kind Regards
Yang Xu
> +			while (kconfig_token != NULL) {
> +				if (strncmp("CONFIG_", kconfig_token, 7))
> +					tst_brk(TBROK, "Invalid config string '%s'", kconfig_token);
> +				matches[i].len = strlen(kconfig_token);
> +				if (match(&matches[i], kconfig_token, &results[i], buf)) {
> +					for (j = 0; j < cnt; j++) {
> +						if (matches[j].match)
> +							break;
> +					}
>   
>   				if (j == cnt)
>   					goto exit;
> +				}
> +				kconfig_token = strtok_r(NULL, "|=", &p_left);
> +				/* avoid to use after "=" string */
> +				if (strlen(p_left) == 0)
> +					break;
>   			}
>   		}
> -
>   	}
>   
>   exit:
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
