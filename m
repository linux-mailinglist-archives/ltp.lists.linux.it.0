Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD5E17EF5F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 04:42:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C38F93C6194
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Mar 2020 04:42:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7888C3C03B2
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 04:41:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 4D50C600C46
 for <ltp@lists.linux.it>; Tue, 10 Mar 2020 04:41:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,535,1574092800"; d="scan'208";a="86085298"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Mar 2020 11:41:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 2B892406AB15;
 Tue, 10 Mar 2020 11:31:51 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 10 Mar 2020 11:41:45 +0800
Message-ID: <5E670C77.3050505@cn.fujitsu.com>
Date: Tue, 10 Mar 2020 11:41:43 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Ronald Monthero <rmonther@redhat.com>
References: <CAGR3Yi6r+caUYV+yZYHGsuRUPQBbpsN_PJOTTSvHwE2VARy92g@mail.gmail.com>
 <CAGR3Yi5dVfMwgBEUcOkXMNr4eX5=EumXi6PU_mqLo_MRZ0XkkQ@mail.gmail.com>
In-Reply-To: <CAGR3Yi5dVfMwgBEUcOkXMNr4eX5=EumXi6PU_mqLo_MRZ0XkkQ@mail.gmail.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2B892406AB15.A5E75
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Fwd: Fix build error because of undefined CAP_SYS_TIME
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

Hi Ronald,

Pushed with two minor changes:
1) Fix indentation.
2) Add build log to commit message.

Thanks,
Xiao Yang

On 2020/3/10 10:53, Ronald Monthero wrote:
> Details of the build log at pr#654
> https://github.com/linux-test-project/ltp/pull/654
>
> Signed-off-by: Ronald Monthero<rmonther@redhat.com>
> ---
>   include/lapi/capability.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/lapi/capability.h b/include/lapi/capability.h
> index 8833f0605..8ed68bfce 100644
> --- a/include/lapi/capability.h
> +++ b/include/lapi/capability.h
> @@ -24,6 +24,10 @@
>   # define CAP_NET_RAW          13
>   #endif
>
> +#ifndef CAP_SYS_TIME
> +#define CAP_SYS_TIME          25
> +#endif
> +
>   #ifndef CAP_SYS_ADMIN
>   # define CAP_SYS_ADMIN        21
>   #endif




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
