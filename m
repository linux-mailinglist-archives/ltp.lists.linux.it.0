Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9E6661D
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 07:25:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B29DB3C1CF3
	for <lists+linux-ltp@lfdr.de>; Fri, 12 Jul 2019 07:25:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 6A7C83C1C86
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 07:25:22 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 265AC1402FBE
 for <ltp@lists.linux.it>; Fri, 12 Jul 2019 07:25:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,481,1557158400"; d="scan'208";a="71238725"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 12 Jul 2019 13:25:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 1C96A4CDE867;
 Fri, 12 Jul 2019 13:25:11 +0800 (CST)
Received: from [10.167.215.46] (10.167.215.46) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 12 Jul 2019 13:25:14 +0800
Message-ID: <5D2819B8.8050401@cn.fujitsu.com>
Date: Fri, 12 Jul 2019 13:25:12 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <5D25B05A.8000600@cn.fujitsu.com>
 <1562755997-5626-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190710135710.GC5628@rei.lan> <5D26B44D.4010208@cn.fujitsu.com>
 <20190711125108.GB8709@rei>
In-Reply-To: <20190711125108.GB8709@rei>
X-Originating-IP: [10.167.215.46]
X-yoursite-MailScanner-ID: 1C96A4CDE867.AD3E4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: alter find_free_loopdev()
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


> Hi!
>>> This needs more changes than this.
>>>
>>> The problem here is that the function modifies dev_path which is
>>> returned by tst_acquire_device() so if you call this function after
>>> tst_acquire_device() it will rewrite the dev_path which means that the
>>> test would end up with wrong device path in tst_device->dev.
>>>
>>> I guess that the easiest solution would be changing the function to get
>>> buffer parameter which, when non-NULL, is filled with the path.
>>>
>>> I.e. the function prototype would became:
>>>
>>> int tst_find_free_loopdev(char *path, size_t path_len);
>>>
>>> And we would pass the dev_path inside of the tst_device.c and NULL from
>>> the copy_file_range() tests.
>> Hi Cyril
>>
>> This is a good comment. But I doubt why we don't use a set_devpath_flag todistinguish it.
>> Or you have a future plan(in different directory ,/dev,/dev/loop/,/dev/block)?
> Well you can add a flag to the function but that would be a bad design
> as far as I can tell. It would still allowed for a user to modify the
> library internal state by calling the tst_find_free_loopdev() with the
> flag set.
>
Hi  Cyril

Even we use int tst_find_free_loopdev(char *path, size_t path_len), user aslo can modify the internal state.
I don't know how to limit it. Can you give some example code? If we set LTP_DEV in *tst_acquire_device__,
we can pass dev and len to tst_find_free_loopdev(), but if we not set LTP_DEV, what can pass to tst_free_loopdev()?


Thanks
Yang Xu




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
