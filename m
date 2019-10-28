Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202BE6D7C
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 08:48:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9A2EF3C21DC
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Oct 2019 08:48:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 0E8F33C1CAE
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 08:48:07 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 5D2D01000B1A
 for <ltp@lists.linux.it>; Mon, 28 Oct 2019 08:48:05 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="77575062"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Oct 2019 15:48:02 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 1F7294CE1508;
 Mon, 28 Oct 2019 15:40:02 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 28 Oct 2019 15:48:00 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <1571968780-4810-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191025083738.GA13022@x230>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <202a3595-fd14-3a6c-ea02-8ba20aee9223@cn.fujitsu.com>
Date: Mon, 28 Oct 2019 15:47:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191025083738.GA13022@x230>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 1F7294CE1508.AB3C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/copy_file_range02: skip new error tests
 if cross-fs isn't supported
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



on 2019/10/25 16:37, Petr Vorel wrote:
> Hi Xu,
> 
>> We should not skip the whole error test if cross-fs isn't support because
>> old errors should be tested on all version. Even we use .mount_device = 1
>> and .mntpoint = MNTPOINT, the src and dest file are still in tmp directory
>> instead of mntpoint.
> 
>> ps: I doubt whether we should skip new error test because it indeed exposed this
>> unreasonable copy_file_range behavior of the user.
> 
>> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> Tested-by: Petr Vorel <pvorel@suse.cz>
> 
> LGTM, but I'd like to have Amir's review/ack.
Hi Petr

Now, I think it can be merged if you don't have other doubt.

Thanks
Yang Xu
> 
> Kind regards,
> Petr
> 
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
