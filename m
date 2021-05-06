Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B693756DC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:27:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C5C093C7347
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 17:27:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 491483C1866
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:27:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C3F1C600453
 for <ltp@lists.linux.it>; Thu,  6 May 2021 17:27:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15C75AE38
 for <ltp@lists.linux.it>; Thu,  6 May 2021 15:27:29 +0000 (UTC)
To: Jan Kara <jack@suse.cz>
References: <20210505153847.6106-1-mdoucha@suse.cz>
 <20210505153847.6106-2-mdoucha@suse.cz>
 <20210505164757.GC9615@quack2.suse.cz>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <32425668-9713-c216-38b1-46b57fce2197@suse.cz>
Date: Thu, 6 May 2021 17:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210505164757.GC9615@quack2.suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/inotify06: Raise inotify instance
 limit in /proc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 05. 05. 21 18:47, Jan Kara wrote:
> On Wed 05-05-21 17:38:47, Martin Doucha wrote:
>> inotify_init() sometimes fails with EMFILE because there are too many
>> partially closed instances waiting for garbage collection. Bump the limit
>> in /proc/sys/fs/inotify/max_user_instances for the duration of the test.
>>
>> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>> ---
>>
>> I thought about only reading the procfile and calling yield() after every
>> proc_limit/2 iterations to wait for garbage collection but I'm afraid that
>> it might reduce the likelihood of triggering the bug. Since I currently have
>> no system where I could reproduce the race, I've decided to play it safe and
>> bump the /proc limit.
> 
> So waiting would be fine as well. One process simply creates & deletes
> files in a loop until the other performs TEARDOWNS teardowns. It doesn't
> really matter how fast teardowns happen for the race to trigger. But I have
> no problem with this solution either.

Let's go with the patch as is then. Like I said, when I don't have a
system where the issue is reproducible, I prefer to play it safe.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
