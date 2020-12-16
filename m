Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 278752DBB4D
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:40:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DF1093C2AE9
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Dec 2020 07:40:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1075F3C2A30
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:40:42 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id D1B33200B7F
 for <ltp@lists.linux.it>; Wed, 16 Dec 2020 07:40:39 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,423,1599494400"; d="scan'208";a="102450489"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Dec 2020 14:40:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 73A514CE6011;
 Wed, 16 Dec 2020 14:40:35 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 16 Dec 2020 14:40:35 +0800
Message-ID: <5FD9ABE4.1080508@cn.fujitsu.com>
Date: Wed, 16 Dec 2020 14:40:36 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <a23e8cb8ae3f227d4355b89347b36d6dda6160c6.1608099138.git.viresh.kumar@linaro.org>
In-Reply-To: <a23e8cb8ae3f227d4355b89347b36d6dda6160c6.1608099138.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 73A514CE6011.AB292
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls: recvmmsg: Add gitignore
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!

Pushed, thanks.

Best Regards
Yang Xu
> Add the missing gitignore file.
>
> Signed-off-by: Viresh Kumar<viresh.kumar@linaro.org>
> ---
>   testcases/kernel/syscalls/recvmmsg/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>   create mode 100644 testcases/kernel/syscalls/recvmmsg/.gitignore
>
> diff --git a/testcases/kernel/syscalls/recvmmsg/.gitignore b/testcases/kernel/syscalls/recvmmsg/.gitignore
> new file mode 100644
> index 000000000000..974ae1ef90ea
> --- /dev/null
> +++ b/testcases/kernel/syscalls/recvmmsg/.gitignore
> @@ -0,0 +1 @@
> +recvmmsg01




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
