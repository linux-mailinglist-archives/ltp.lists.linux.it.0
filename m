Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFD260B7E
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:04:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B74533C53E4
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Sep 2020 09:04:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 36F503C21DD
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:04:11 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id D55AB6011AE
 for <ltp@lists.linux.it>; Tue,  8 Sep 2020 09:04:09 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,404,1592841600"; d="scan'208";a="98996755"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Sep 2020 15:04:07 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 721FE48990E8;
 Tue,  8 Sep 2020 15:04:06 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Sep 2020 15:04:04 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20200907150157.23886-1-chrubis@suse.cz>
 <20200907150157.23886-10-chrubis@suse.cz>
 <4a6a5c02-1d93-de12-cdd5-811e6a3610ce@cn.fujitsu.com>
 <20200908065816.GA2475@yuki.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <37f9867c-0eb9-99dc-abb9-2eb4ec1b3232@cn.fujitsu.com>
Date: Tue, 8 Sep 2020 15:04:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908065816.GA2475@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 721FE48990E8.AF5A0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-1.2 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 09/10] syscalls/ipc: Add shmctl IPC_SET test
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

Hi Cyril


> Hi!
>>> diff --git a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
>>> index 409203db7..39b9ad78a 100644
>>> --- a/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
>>> +++ b/testcases/kernel/syscalls/ipc/shmctl/shmctl07.c
>>> @@ -42,10 +42,12 @@ static void verify_shmlock(void)
>>>    	else
>>>    		tst_res(TPASS, "shmctl(%i, SHM_UNLOCK, NULL)", shm_id);
>>>    
>>> +	SAFE_SHMCTL(shm_id, IPC_STAT, &ds);
>>> +
>>>    	if (ds.shm_perm.mode & SHM_LOCKED)
>>> -		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
>>> -	else
>>>    		tst_res(TFAIL, "SMH_LOCKED bit is on in shm_perm.mode");
>>> +	else
>>> +		tst_res(TPASS, "SHM_LOCKED bit is off in shm_perm.mode");
>>>    }
>>>    
>> This change should belong to "syscalls/ipc: Add shmctl07 test" patch.
> 
> My bad I messed up, will fix that later on.
> 
> Anything else I missed there?
I have seen the whole patchset, only find this.
> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
