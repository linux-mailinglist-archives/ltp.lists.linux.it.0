Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAD1BB61B
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:55:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7567C3C2842
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 07:55:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9FC333C0358
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:55:51 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 24AAD1A00929
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 07:55:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,326,1583164800"; d="scan'208";a="90609812"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Apr 2020 13:55:42 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 4AB2550A996F;
 Tue, 28 Apr 2020 13:55:41 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 28 Apr 2020 13:55:41 +0800
Message-ID: <5EA7C55B.5010902@cn.fujitsu.com>
Date: Tue, 28 Apr 2020 13:55:39 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <c3cbc45d1758c6eaf1957c7e75d920b7990e24eb.1588051498.git.viresh.kumar@linaro.org>
In-Reply-To: <c3cbc45d1758c6eaf1957c7e75d920b7990e24eb.1588051498.git.viresh.kumar@linaro.org>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 4AB2550A996F.A8FB1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2] syscalls/pipe2: Add pipe2_02_child in
 .gitignore
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

Hi Viresh,

It is simple and fine and I will push it directly.

Thanks,
Xiao Yang
On 2020/4/28 13:25, Viresh Kumar wrote:
> Signed-off-by: Viresh Kumar<viresh.kumar@linaro.org>
> ---
> V2: Move it a line up to keep ordering intact.
>
>   testcases/kernel/syscalls/pipe2/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/testcases/kernel/syscalls/pipe2/.gitignore b/testcases/kernel/syscalls/pipe2/.gitignore
> index 773450a484af..50f7023b8dd4 100644
> --- a/testcases/kernel/syscalls/pipe2/.gitignore
> +++ b/testcases/kernel/syscalls/pipe2/.gitignore
> @@ -1,3 +1,4 @@
>   /pipe2_01
>   /pipe2_02
> +/pipe2_02_child
>   /pipe2_04




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
