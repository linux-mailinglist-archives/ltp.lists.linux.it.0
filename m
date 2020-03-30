Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F81972BA
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 05:02:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9AF63C31E7
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 05:02:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 588833C31BD
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 05:02:49 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D16346005D1
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 05:02:47 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,322,1580745600"; d="scan'208";a="87806673"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 11:02:43 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B5B564EEE693;
 Mon, 30 Mar 2020 10:52:28 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 11:02:42 +0800
Message-ID: <5E816151.9060507@cn.fujitsu.com>
Date: Mon, 30 Mar 2020 11:02:41 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Zou Wei <zou_wei@huawei.com>
References: <1585536316-23604-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1585536316-23604-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B5B564EEE693.AC2F0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] security/dirtyc0w: Get and set umask in setup
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

On 2020/3/30 10:45, Zou Wei wrote:
> v2:
> Clear current umask by umask(0) in setup()
Hi Zou,

1) needs to update the subject as well.
2) add some commit message to describe the issue.

Thanks,
Xiao Yang
>
> Signed-off-by: Zou Wei<zou_wei@huawei.com>
> ---
>   testcases/kernel/security/dirtyc0w/dirtyc0w.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w.c b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> index a0a81b6..6455f9c 100644
> --- a/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> +++ b/testcases/kernel/security/dirtyc0w/dirtyc0w.c
> @@ -45,6 +45,8 @@ static void setup(void)
>   {
>   	struct passwd *pw;
>
> +	umask(0);
> +
>   	pw = SAFE_GETPWNAM("nobody");
>
>   	nobody_uid = pw->pw_uid;
> --
> 2.6.2
>
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
