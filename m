Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4044A2C79
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 03:44:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ADAF73C2019
	for <lists+linux-ltp@lfdr.de>; Fri, 30 Aug 2019 03:44:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id C78F13C1C80
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 03:44:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 2A8211A009AB
 for <ltp@lists.linux.it>; Fri, 30 Aug 2019 03:43:58 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,445,1559491200"; d="scan'208";a="74559006"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Aug 2019 09:43:55 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
 by cn.fujitsu.com (Postfix) with ESMTP id AC71B4CE088A;
 Fri, 30 Aug 2019 09:43:53 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 30 Aug 2019 09:43:56 +0800
Message-ID: <5D687F5A.80002@cn.fujitsu.com>
Date: Fri, 30 Aug 2019 09:43:54 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <1566987255-3010-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1566987255-3010-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190829204149.GB5711@dell5510>
In-Reply-To: <20190829204149.GB5711@dell5510>
X-Originating-IP: [10.167.220.69]
X-yoursite-MailScanner-ID: AC71B4CE088A.AB9BF
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] runtest/numa: add migrate_pages*
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

On 2019/08/30 4:41, Petr Vorel wrote:
> Hi Xu,
>
>> Since migrate_pages must depend on numa, add it into
>> runtest/numa.
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
> Thanks for the patch, merged.
Hi Petr,

Why don't sort numa tests alphabetically as my replied?

Best Regards,
Xiao Yang
> Kind regards,
> Petr
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
