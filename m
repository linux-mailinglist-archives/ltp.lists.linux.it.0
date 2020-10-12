Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 360C328AEF9
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 09:22:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A44893C2878
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Oct 2020 09:22:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 70BE83C24AF
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 09:22:02 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 0D170200975
 for <ltp@lists.linux.it>; Mon, 12 Oct 2020 09:22:00 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,366,1596470400"; d="scan'208";a="100069915"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Oct 2020 15:21:58 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6F4F848990D7;
 Mon, 12 Oct 2020 15:21:57 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 12 Oct 2020 15:21:58 +0800
Message-ID: <5F84042B.9000505@cn.fujitsu.com>
Date: Mon, 12 Oct 2020 15:22:19 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200828151747.21445-1-mdoucha@suse.cz>
 <20200903155030.GA23664@dell5510>
In-Reply-To: <20200903155030.GA23664@dell5510>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6F4F848990D7.ACC68
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for send(MSG_MORE)
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

Hi Martin, Peter
> Hi Martin,
>
>> The setsockopt05 test will not work properly if kernel handles the MSG_MORE
>> flag incorrectly. Add a new test to detect broken test environment.
>
> Thanks for your patch, merged.
I test this case on centos8.2, it failed, but it passed on centos7.8 and 
fedora31. On upstream kernel (5.9-rc7+,commit 6f2f486d57c4,using kvm,4G 
memory,2 cpus), it also failed. I don't know whether it has some kernel 
parameters or kconfig to affect this. It seems not a kernel bug and like 
a environment bug(I guess).

tst_test.c:1250: TINFO: Timeout per run is 0h 05m 00s
send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
send02.c:86: TFAIL: recv() error: EAGAIN/EWOULDBLOCK (11)


Best Regards
Yang  Xu
>
> Kind regards,
> Petr
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
