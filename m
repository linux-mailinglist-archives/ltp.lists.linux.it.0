Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAC31524CF
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 03:30:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 70E8D3C250E
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Feb 2020 03:30:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 342E83C23F8
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 03:30:54 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 97CAE200754
 for <ltp@lists.linux.it>; Wed,  5 Feb 2020 03:30:45 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,404,1574092800"; d="scan'208";a="82899243"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Feb 2020 10:30:40 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5A91250A9969;
 Wed,  5 Feb 2020 10:21:14 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 5 Feb 2020 10:30:36 +0800
To: Cyril Hrubis <chrubis@suse.cz>, Petr Vorel <pvorel@suse.cz>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <e6f7f611-7c2e-04cb-afd9-e11c4423dc3f@cn.fujitsu.com>
 <20200204155703.GA16838@dell5510> <20200204160949.GA6271@rei>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <a57e81ef-4f2a-12e4-6380-ea84c688d101@cn.fujitsu.com>
Date: Wed, 5 Feb 2020 10:30:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20200204160949.GA6271@rei>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5A91250A9969.AB832
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] autotools: Move simple definitions out of
 m4/* to configure.ac
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

Hi!
> Hi!
>>> IMO, move all simple definitions to configure.ac will make this file mess
>>> likce old .gitnore file. I perfer to add function or header or macro but not
>>> include struct in configure.ac.
>> I think .gitignore files are different because it's content cannot be duplicated
>> when they're split, but m4/ repeated some checks.
>> + we already started to move configuration into configure.ac before
>> (AC_CHECK_HEADERS and AC_CHECK_FUNCS).
>> IMHO it's easier to search/work with single file than in many files with very little
>> content.
> 
> The main reason for having a separate .gitignore files are:
> 
> * To avoid patch collisions that would happen too often
> 
> * When directory is deleted the .gitignore records are removed as well
> 
> * Also the files are much easier to maintain if there are only few
>    entries, as we do not have to find stuff
> 
> 
> In that sense the configure file is different, collisions are generally
> rare and an stuffing things into m4 files is not much cleaner than
> having it directly in the configure.ac
Thanks for your explanation. I see.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
