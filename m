Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E71442F0E6F
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:45:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AE07F3C5FC7
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Jan 2021 09:45:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7F0B53C313B
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:45:09 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id A08DA60094A
 for <ltp@lists.linux.it>; Mon, 11 Jan 2021 09:45:07 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,337,1602518400"; d="scan'208";a="103358491"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 11 Jan 2021 16:45:03 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 3AC314CE602E;
 Mon, 11 Jan 2021 16:45:03 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 11 Jan 2021 16:45:04 +0800
Message-ID: <5FFC100C.5080200@cn.fujitsu.com>
Date: Mon, 11 Jan 2021 16:45:00 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20210111030704.5761-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210111030704.5761-1-lizhijian@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 3AC314CE602E.A8458
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] build.sh: Remove deprecated CROSS_COMPILE
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

Hi Petr,

I have merged it because CROSS_COMPILE seems unneeded.
Please tell me if you have any objection.

Best Regards,
Xiao Yang
On 2021/1/11 11:07, Li Zhijian wrote:
> The CROSS_COMPILE was no longer used by ltp since 400ac9bbe20.
>
> Signed-off-by: Li Zhijian<lizhijian@cn.fujitsu.com>
> ---
>   build.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/build.sh b/build.sh
> index 452cc6f4c..602ca419e 100755
> --- a/build.sh
> +++ b/build.sh
> @@ -64,7 +64,7 @@ build_cross()
>   	fi
>
>   	echo "===== cross-compile ${host} ${1}-tree build into $PREFIX ====="
> -	build $1 $2 "--host=$host" CROSS_COMPILE="${host}-"
> +	build $1 $2 "--host=$host"
>   }
>
>   build()




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
