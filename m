Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970F1D6F4D
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 05:27:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B76D23C4FA6
	for <lists+linux-ltp@lfdr.de>; Mon, 18 May 2020 05:27:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0E8423C2035
 for <ltp@lists.linux.it>; Mon, 18 May 2020 05:27:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 56EE9200B11
 for <ltp@lists.linux.it>; Mon, 18 May 2020 05:27:08 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,405,1583164800"; d="scan'208";a="92420294"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 18 May 2020 11:27:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id B935E4BCC88A
 for <ltp@lists.linux.it>; Mon, 18 May 2020 11:26:58 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 18 May 2020 11:26:58 +0800
Message-ID: <5EC20081.1000508@cn.fujitsu.com>
Date: Mon, 18 May 2020 11:26:57 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1589353614-24423-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1589353614-24423-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: B935E4BCC88A.ACD7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/2] tpci: remove useless ENABLE_BRIDGES
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

Hi,

Thanks for your work, pushed.

Best Regards,
Xiao Yang
On 2020/5/13 15:06, Yang Xu wrote:
> Since the previous commit, we have removed test_enable_bridges() because
> pci_enable_bridges() was removed in 3.12 (928bea964827). But it forgot
> to delete it in tpci.h. So remove it.
>
> Fixes: 3dd286b ("ltp_tpci.c: Update legacy code")
> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h b/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
> index f65c6fc22..f7defb29f 100644
> --- a/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
> +++ b/testcases/kernel/device-drivers/pci/tpci_kernel/tpci.h
> @@ -30,7 +30,6 @@ enum PCI_TCASES {
>   	FIND_SUBSYS,
>   	BUS_SCAN,
>   	SLOT_SCAN,
> -	ENABLE_BRIDGES,
>   	BUS_ADD_DEVICES,
>   	MATCH_DEVICE,
>   	REG_DRIVER,




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
