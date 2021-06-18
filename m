Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE363AC16A
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 05:38:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0BDB3C88EA
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Jun 2021 05:38:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B55C03C2CEF
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 05:38:06 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B96E51000A10
 for <ltp@lists.linux.it>; Fri, 18 Jun 2021 05:38:04 +0200 (CEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G5kyb03C5z1BN8P;
 Fri, 18 Jun 2021 11:32:55 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 11:37:58 +0800
Received: from [10.67.109.194] (10.67.109.194) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 11:37:58 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-3-xieziyao@huawei.com> <YMurRVXwyvKXnkjj@pevik>
From: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <81961ede-0a43-36d5-ce50-996e81daf867@huawei.com>
Date: Fri, 18 Jun 2021 11:37:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YMurRVXwyvKXnkjj@pevik>
X-Originating-IP: [10.67.109.194]
X-ClientProxiedBy: dggeme708-chm.china.huawei.com (10.1.199.104) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.3 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/sendfile: Convert sendfile06 to the
 new API
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

Hi, Petr,

> 
>> 1. Convert sendfile06 to the new API with file descriptors instead
>> of socket descriptors.
> I wonder if this is ok, suppose yes, but better if other check.
I noticed that it is described in `man 2 sendfile` as follows:

In Linux kernels before 2.6.33, out_fd must refer to a socket.  Since 
Linux 2.6.33 it can be any file.

And if we need to cover the case where out_fd is a socket, I suggest 
adding it to sendfile02.c, which tests the basic functionality of the 
sendfile(), just like sendfile07.c:

in_fd = SAFE_OPEN("in_file", O_RDONLY);

SAFE_SOCKETPAIR(PF_UNIX, SOCK_DGRAM | SOCK_NONBLOCK, 0, p);
out_fd = p[1];

> 
>> 2. Remove the support for UCLINUX.
> 
> LGTM.
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> 
> ...
>> +	TEST(sendfile(out_fd, in_fd, NULL, sb.st_size));
>> +	after_pos = SAFE_LSEEK(in_fd, 0, SEEK_CUR);
>> +
>> +	if (TST_RET != sb.st_size)
> nit: checkpatch.pl complains, it should be if (sb.st_size != TST_RET)
> (can be fixed during merge)
Oh yes, sometimes forgot to use checkpatch.pl to check my code files. 
Thanks for your tips, Petr.

Kind Regards,
Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
