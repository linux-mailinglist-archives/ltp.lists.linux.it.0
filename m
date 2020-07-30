Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A8C232AAA
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 06:02:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6B7BF3C268F
	for <lists+linux-ltp@lfdr.de>; Thu, 30 Jul 2020 06:02:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id CA11F3C14A2
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 06:02:01 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 8DBDF1401FA2
 for <ltp@lists.linux.it>; Thu, 30 Jul 2020 06:02:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="97090439"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Jul 2020 12:01:58 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 367864CE5440;
 Thu, 30 Jul 2020 12:01:54 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 30 Jul 2020 12:01:55 +0800
Message-ID: <5F224630.7090600@cn.fujitsu.com>
Date: Thu, 30 Jul 2020 12:01:52 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yuan Gao <aiden.gaoyuan@gmail.com>
References: <20200729185344.3318703-1-aiden.gaoyuan@gmail.com>
In-Reply-To: <20200729185344.3318703-1-aiden.gaoyuan@gmail.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 367864CE5440.A704C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.6 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hotplug/memory_hotplug: Remove unused goto
 label
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

I have pushed with this change, so you don't need to send the v2 path.

Thanks,
Xiao Yang
On 2020/7/30 2:53, Yuan Gao wrote:
> Remove unused goto label in parse_command_line_args function
>
> Change from v1
> 1. Remove a redundant blank line
>
> Signed-off-by: Yuan Gao<aiden.gaoyuan@gmail.com>
> ---
>   testcases/kernel/hotplug/memory_hotplug/memtoy.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/testcases/kernel/hotplug/memory_hotplug/memtoy.c b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> index 8ac9600de..e647f86b6 100644
> --- a/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> +++ b/testcases/kernel/hotplug/memory_hotplug/memtoy.c
> @@ -447,7 +447,6 @@ int parse_command_line_args(int argc, char *argv[])
>   			break;
>   		}
>   	}
> -done:
>
>   	return (error);
>   }




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
