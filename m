Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DA6307326
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:52:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9EF023C6D5B
	for <lists+linux-ltp@lfdr.de>; Thu, 28 Jan 2021 10:52:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 433383C7904
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:52:13 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 8289A1A00F13
 for <ltp@lists.linux.it>; Thu, 28 Jan 2021 10:52:12 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="103937732"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Jan 2021 17:52:12 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id F061C48990D2;
 Thu, 28 Jan 2021 17:52:08 +0800 (CST)
Received: from [10.167.220.48] (10.167.220.48) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 28 Jan 2021 17:52:08 +0800
Message-ID: <60128944.7080501@cn.fujitsu.com>
Date: Thu, 28 Jan 2021 17:52:04 +0800
From: Zhu Feiyu <zhufy.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <1609918063-15810-1-git-send-email-zhufy.jy@cn.fujitsu.com>
 <1609918063-15810-5-git-send-email-zhufy.jy@cn.fujitsu.com>
 <YBFboS09Wgc9F7TF@yuki.lan>
In-Reply-To: <YBFboS09Wgc9F7TF@yuki.lan>
X-Originating-IP: [10.167.220.48]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F061C48990D2.AA752
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhufy.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/ipc: semctl07: Convert to new API
 and cleanup
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

Hi Cyril,

>
> This part is broken. We do issue the TPASS here even if one of the above
> statement issued TFAIL.
>
> So we either change the code to produce TPASS/TFAIL pair on each check
> e.g.
>
> 	if (status != arg.val) {
> 		tst_res(TFAIL, "semctl(GETVAL) returned %d expected %d",
> 		        arg.val, status);
> 	} else {
> 		tst_res(TPASS, "semctl(GETVAL) returned %d", arg.val);
> 	}
>
> Or we have to maintain flag that is set to non-zero on any failure and
> then we can, at the end of the test do:
>
> 	if (!flag)
> 		tst_res(TPASS, "everything is fine");
>

Thanks for your review, I have sent v2.

Best Regards
Feiyu Zhu



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
