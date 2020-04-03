Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316619D4B2
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:12:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F5343C2FA1
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Apr 2020 12:12:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5D1023C2F7B
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:11:57 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id B5167140200E
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 12:11:56 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,339,1580745600"; d="scan'208";a="88449777"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 03 Apr 2020 18:11:54 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5701550A999D
 for <ltp@lists.linux.it>; Fri,  3 Apr 2020 18:01:34 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 3 Apr 2020 18:11:53 +0800
Message-ID: <5E870BE7.9070809@cn.fujitsu.com>
Date: Fri, 3 Apr 2020 18:11:51 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
In-Reply-To: <1584507302-23515-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5701550A999D.A8C45
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp_tpci.c: fix a null pointer
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

On 2020/3/18 12:55, Yang Xu wrote:
> ps: I want to use a dymaic domain to fix it but failed. If someone know,
> please tell me. Also, this case failed when merging this patch because
> test 13 (test_assign_resources) report no space error as below:
> [754930.757585] ltp_tpci: test-case 13
> [754930.757585] ltp_tpci: assign resources
> [754930.757585] ltp_tpci: assign resource #0
> [754930.757586] ltp_tpci: name = 0000:00:08.0, flags = 262401, start 0xc140, end 0xc17f
> [754930.757586] ltp_tpci: assign resource #1
> [754930.757587] ltp_tpci: name = 0000:00:08.0, flags = 262656, start 0xfebd7000, end 0xfebd7fff
> [754930.757587] ltp_tpci: assign resource #2
> [754930.757587] ltp_tpci: name = 0000:00:08.0, flags = 0, start 0x0, end 0x0
> [754930.757588] ltp_tpci: assign resource #3
> [754930.757588] ltp_tpci: name = 0000:00:08.0, flags = 0, start 0x0, end 0x0
> [754930.757588] ltp_tpci: assign resource #4
> [754930.757589] ltp_tpci: name = 0000:00:08.0, flags = 538190348, start 0xfe80c000, end 0xfe80ffff
> [754930.757593] virtio-pci 0000:00:08.0: BAR 4: no space for [mem size 0x00004000 64bit pref]
> [754930.757594] virtio-pci 0000:00:08.0: BAR 4: failed to assign [mem size 0x00004000 64bit pref
>
Hi Xu,

Do you mean that the fix patch results in the failure of subtest 13?
If so, we may need a better solution.

Thanks,
Xiao Yang



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
