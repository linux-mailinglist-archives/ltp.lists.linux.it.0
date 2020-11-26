Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FC2C5217
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 11:33:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C5AE3C5E0B
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Nov 2020 11:33:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id CC0403C2246
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 11:33:33 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id E89BC200D2B
 for <ltp@lists.linux.it>; Thu, 26 Nov 2020 11:33:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,371,1599494400"; d="scan'208";a="101778751"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 26 Nov 2020 18:33:30 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 895F24CE4BCB;
 Thu, 26 Nov 2020 18:33:29 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 26 Nov 2020 18:33:27 +0800
Message-ID: <5FBF8478.9080306@cn.fujitsu.com>
Date: Thu, 26 Nov 2020 18:33:28 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20201126012838.531070-1-yangx.jy@cn.fujitsu.com>
 <CAEemH2eQNTy9V+NSn+kwV8zZ0BTr+PEHuD_RPhx3Ns1v=+iPNw@mail.gmail.com>
 <5FBF3A16.6090101@cn.fujitsu.com>
 <CAEemH2c3U7DY70QiVKZoUhdtLdr0QBc+VqAkFt9GzoUp-kmbyA@mail.gmail.com>
 <20201126091953.GA4646@yuki.lan> <20201126092355.GB15771@pevik>
In-Reply-To: <20201126092355.GB15771@pevik>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 895F24CE4BCB.ACF3D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/name_to_handle_at.h: Fix compiler error on
 centos6
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/11/26 17:23, Petr Vorel wrote:
> Hi,
>
>>> As discussed in the previous mail, it should be accomplished in the current
>>> release 20200930.
>>> @Petr Vorel<pvorel@suse.cz>   @Cyril Hrubis<chrubis@suse.cz>  what do you
>>> think?
>> Unless anybody objects I would go for it. I guess that first step would
>> be removign CentOS6 from travis.
> ack from my side as well.
> Feel free to remove it from Travis.
Hi,

OK, I will send a patch to remove it now.

Thanks,
Xiao Yang
> Kind regards,
> Petr
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
