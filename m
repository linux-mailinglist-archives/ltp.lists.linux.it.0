Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF63836B342
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:39:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A40E3C674F
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Apr 2021 14:39:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BCC793C1A7E
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:39:11 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id A88FD600803
 for <ltp@lists.linux.it>; Mon, 26 Apr 2021 14:39:05 +0200 (CEST)
Received: from localhost (unknown [192.168.167.16])
 by vipregular1.263.net (Postfix) with ESMTP id C0E40847;
 Mon, 26 Apr 2021 20:39:01 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.4.23.9] (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P31919T139684105664256S1619440742194218_; 
 Mon, 26 Apr 2021 20:39:02 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1c258fb3e32cae0289ebb875b55b605e>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210330104613.1059-1-zhanglianjie@uniontech.com>
 <YHRcJOUer87SUn6v@yuki> <cded02a5-6668-8524-d588-b965ed1a7086@uniontech.com>
 <YHgd/NDLJzz68uDl@yuki> <e3eabee4-6616-84dc-cc8d-bc4f23228637@uniontech.com>
 <YH1H4qZwqSNom4RO@yuki>
Message-ID: <f73913c8-f6ca-d8ea-60c8-e4002ac16dba@uniontech.com>
Date: Mon, 26 Apr 2021 20:39:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <YH1H4qZwqSNom4RO@yuki>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Modify the test logic of mincore.
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

> Hi!
>>>> Using the CVE patch on mips, the test will fail because the child
>>>> process mlocks all pages, but the parent process cannot obtain these
>>>> pages through mincore and is locked.
>>>
>>> Sounds like a kernel bug.
>>>
>> CVE list has provided repair patches, The patch I submitted this time is
>> to modify the logic of the test results, do you plan to incorporate it?
> 
> Let me try to explain it once again.
> 
> As far as I can tell the CVE kernel patch you pointed out has NO effect
> on the testcase and there is NO need to modify the test at all. The test
> works fine both before and after the kernel patch.
> 
> If the test fails for you YOUR kernel is broken.
> 
> That is unless you prove that the test is actually wrong, which you
> haven't and I do not think that you actually can.
> 

The test was passed before the cve patch was applied, and the test
failed after the patch was applied, and the test results were the same
on both the x86 and mips architectures.
This cve patch changes mincore() to count "mapped" pages instead of 
"cached" pages.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
