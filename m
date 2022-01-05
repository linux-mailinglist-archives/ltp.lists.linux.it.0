Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D36484E06
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jan 2022 07:10:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 454883C90A7
	for <lists+linux-ltp@lfdr.de>; Wed,  5 Jan 2022 07:10:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4349B3C1D3C
 for <ltp@lists.linux.it>; Wed,  5 Jan 2022 07:10:39 +0100 (CET)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id AF8FF6008D5
 for <ltp@lists.linux.it>; Wed,  5 Jan 2022 07:10:35 +0100 (CET)
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2056AN3t086119;
 Wed, 5 Jan 2022 15:10:23 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Wed, 05 Jan 2022 15:10:23 +0900 (JST)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2056ANLa086116
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 5 Jan 2022 15:10:23 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Message-ID: <2b29ac47-ed8f-3b50-f47c-c080fb83cbd5@i-love.sakura.ne.jp>
Date: Wed, 5 Jan 2022 15:10:23 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jan Stancek <jstancek@redhat.com>
References: <03f43407-c34b-b7b2-68cd-d4ca93a993b8@i-love.sakura.ne.jp>
 <20211229172902.GC27693@lst.de>
 <4e7b711f-744b-3a78-39be-c9432a3cecd2@i-love.sakura.ne.jp>
 <20220105060201.GA2261405@janakin.usersys.redhat.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
In-Reply-To: <20220105060201.GA2261405@janakin.usersys.redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.1 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] make autoclear operation synchronous again
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 linux-block <linux-block@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 ltp@lists.linux.it, Dan Schatzberg <schatzberg.dan@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2022/01/05 15:02, Jan Stancek wrote:
> On Thu, Dec 30, 2021 at 07:52:34PM +0900, Tetsuo Handa wrote:
>> OK. Two patches shown below. Are these look reasonable?
>>
>>
>>
>>> From 1409a49181efcc474fbae2cf4e60cbc37adf34aa Mon Sep 17 00:00:00 2001
>> From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> Date: Thu, 30 Dec 2021 18:41:05 +0900
>> Subject: [PATCH 1/2] loop: Revert "loop: make autoclear operation asynchronous"
>>
> 
> Thanks, the revert fixes failures we saw recently in LTP tests,
> which do mount/umount in close succession:
> 
> # for i in `seq 1 2`;do mount -t iso9660 -o loop /root/isofs.iso /mnt/isofs; umount /mnt/isofs/; done
> mount: /mnt/isofs: WARNING: source write-protected, mounted read-only.
> mount: /mnt/isofs: wrong fs type, bad option, bad superblock on /dev/loop0, missing codepage or helper program, or other error.
> umount: /mnt/isofs/: not mounted.
> 

I'm waiting for Jens to come back to
https://lkml.kernel.org/r/c205dcd2-db55-a35c-e2ef-20193b5ac0da@i-love.sakura.ne.jp .

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
