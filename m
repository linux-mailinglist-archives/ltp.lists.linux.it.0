Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2317B4E2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 04:30:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F15C53C653D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Mar 2020 04:30:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id D4AA93C6507
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 04:29:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 59A07200386
 for <ltp@lists.linux.it>; Fri,  6 Mar 2020 04:29:55 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,520,1574092800"; d="scan'208";a="85926032"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 06 Mar 2020 11:29:51 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 401F750A9981;
 Fri,  6 Mar 2020 11:19:58 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 6 Mar 2020 11:29:51 +0800
Message-ID: <5E61C3AE.402@cn.fujitsu.com>
Date: Fri, 6 Mar 2020 11:29:50 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, Petr Vorel <pvorel@suse.cz>
References: <20200305171844.24020-1-pvorel@suse.cz>
 <cd067b8a-224d-993f-8668-e8f7b70f59bc@cn.fujitsu.com>
In-Reply-To: <cd067b8a-224d-993f-8668-e8f7b70f59bc@cn.fujitsu.com>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 401F750A9981.A8143
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] hugeshmctl01: Fix reset stat_time when
 looping with -i n
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

On 2020/3/6 9:53, Yang Xu wrote:
>>     static void test_hugeshmctl(unsigned int i)
>>   {
>> +    stat_time = FIRST;
>> +
> My description may confuse you.  stat_time should not be reseted every
> time, it only needs to be reseted when next loop. This value will be +1
>   when call stat_cleanup.
> struct tcase {
>          int cmd;
>          void (*func_test) (void);
>          void (*func_setup) (void);
> } tcases[] = {
>          {IPC_STAT, func_stat, stat_setup},   //stat_time = FIRST
>          {IPC_STAT, func_stat, stat_setup},   //stat_time = SECOND
>
> As you do, the first and second case are same. it should be added into
> the "if == 0".
>
> ps: I personally think old case is more cleaner. Let's hear from others.
>
Hi Petr, Xu

For xu's comment, we can assign 'i' to stat_time and remove 
"stat_time++;" directly:
----------------------------------------
  static void test_hugeshmctl(unsigned int i)
  {
+       stat_time = i;
+
...
-       stat_time++;
----------------------------------------

Thanks,
Xiao Yang




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
