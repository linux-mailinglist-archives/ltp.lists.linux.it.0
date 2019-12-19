Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 36033126064
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 12:03:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B0C533C2395
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 12:03:31 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 3A1653C013A
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 12:03:26 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 36C2B1A013C2
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 12:03:24 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,331,1571673600"; d="scan'208";a="80517309"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Dec 2019 19:03:19 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id D1D844CE1C91;
 Thu, 19 Dec 2019 18:54:36 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Thu, 19 Dec 2019 19:03:18 +0800
To: Pengfei Xu <pengfei.xu@intel.com>
References: <20191218122504.9985-1-pengfei.xu@intel.com>
 <c97da094-a320-e4b4-dee9-423a3e306ecf@cn.fujitsu.com>
 <b19e2cd0-964f-2fe3-860f-039d63088d52@cn.fujitsu.com>
 <20191219100602.mpyelysyizonfrit@xpf-desktop>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <cfa113f3-56b8-f93f-b3ed-50e9bd9f849a@cn.fujitsu.com>
Date: Thu, 19 Dec 2019 19:03:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191219100602.mpyelysyizonfrit@xpf-desktop>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: D1D844CE1C91.AF85E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
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
> Hi Xu,
>    Thanks for your advice!
>    My concern is that:
>    If some one need any CONFIG_A, CONFIG_B, CONFIG_C ... set to y.
>    We need rewrite again.
>    Also, thanks for advice, I will used newlib_tests to double check.:)
>
I see. Also, you should add example to lib/newlib_tests/test_kconfig.c 
so we can know the kconfig feature is ok when maintainer merges your 
patch. Usually, if we modify or add lib feature, we will document it in 
doc/test-writing-guidelines.txt. So if you do it , it will be better.
as below:
diff --git a/lib/newlib_tests/test_kconfig.c 
b/lib/newlib_tests/test_kconfig.c
index d9c662fc5..9515b60e2 100644
--- a/lib/newlib_tests/test_kconfig.c
+++ b/lib/newlib_tests/test_kconfig.c
@@ -14,6 +14,7 @@ static const char *kconfigs[] = {
         "CONFIG_MMU",
         "CONFIG_EXT4_FS=m",
         "CONFIG_PGTABLE_LEVELS=4",
+       "CONFIG_X86_INTEL_UMIP|CONFIG_X86_UMIP=y",
         NULL
  };

Kind Regards
Yang Xu
>    Thanks!
>    BR.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
