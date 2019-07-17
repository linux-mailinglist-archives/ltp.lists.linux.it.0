Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D26B9DE
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:15:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87CEB3C1D4D
	for <lists+linux-ltp@lfdr.de>; Wed, 17 Jul 2019 12:15:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 489B83C1D0F
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:15:13 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 168AE1001192
 for <ltp@lists.linux.it>; Wed, 17 Jul 2019 12:15:05 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,274,1559491200"; d="scan'208";a="71630560"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 17 Jul 2019 18:15:07 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id CE7424CDE64B;
 Wed, 17 Jul 2019 18:15:07 +0800 (CST)
Received: from [10.167.215.39] (10.167.215.39) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Wed, 17 Jul 2019 18:15:10 +0800
Message-ID: <5D2EF52A.5030803@cn.fujitsu.com>
Date: Wed, 17 Jul 2019 18:15:06 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1562843429-4633-1-git-send-email-ice_yangxiao@163.com>
 <f6d4dfd5-7f84-8587-049b-2cf2e61fdba7@163.com> <20190716141944.GB17060@rei>
In-Reply-To: <20190716141944.GB17060@rei>
X-Originating-IP: [10.167.215.39]
X-yoursite-MailScanner-ID: CE7424CDE64B.AB335
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4] rcu/rcu_torture.sh: Rewrite test
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

On 2019/07/16 22:19, Cyril Hrubis wrote:
> Hi!
>> I will push it tomorrow if nobody has objection. :-)
> The code looks good to me, Acked.
>
Hi Cyril,

Pushed, thanks for your confirmation.

Best Regards,
Xiao Yang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
