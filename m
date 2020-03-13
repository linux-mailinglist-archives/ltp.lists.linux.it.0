Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4E81842D9
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:42:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 89A623C58FC
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Mar 2020 09:42:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 654853C58ED
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:42:51 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 9E9A01002865
 for <ltp@lists.linux.it>; Fri, 13 Mar 2020 09:42:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,547,1574092800"; d="scan'208";a="86270485"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 13 Mar 2020 16:42:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 13D1850A9990;
 Fri, 13 Mar 2020 16:32:45 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 13 Mar 2020 16:42:43 +0800
To: Martin Doucha <mdoucha@suse.cz>, Cyril Hrubis <chrubis@suse.cz>
References: <20200224100932.10349-1-mdoucha@suse.cz>
 <20200226135748.GD24080@rei> <0d875613-07a4-b9fe-9c83-76c2e403d6dc@suse.cz>
 <20200227141356.GA29089@rei>
 <f3cbdd28-e89c-02e1-7f4b-0b62278b6edb@cn.fujitsu.com>
 <0c8d0d4a-8eca-bd42-4c88-5cb7b87ba861@suse.cz>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <233e1d29-b433-ce77-f361-a5f94bb7493b@cn.fujitsu.com>
Date: Fri, 13 Mar 2020 16:42:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <0c8d0d4a-8eca-bd42-4c88-5cb7b87ba861@suse.cz>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 13D1850A9990.AD9FB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add test for misaligned fallocate()
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

Hi Martin


> On 13. 03. 20 5:31, Yang Xu wrote:
>> Hi Cyril, Martin
>>
>> When I test this case by using btrfs, this case failed as below:
>>
>> ...
>>
>> It failed when we fill fs and not using cow. Is it a known issue(I see
>> the previous eamils, but found nothing)?
>> I also used 5.6-rc3 kernel to test, it still failed.
> 
> Yes, this is a known issue. Upstream kernel fix is currently being reviewed:
> https://patchwork.kernel.org/patch/11357415/
Thanks for a quick response.

Best Regards
Yang Xu
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
