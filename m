Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45817A27C
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:50:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 34B313C6507
	for <lists+linux-ltp@lfdr.de>; Thu,  5 Mar 2020 10:50:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id BA94C3C64EA
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:50:31 +0100 (CET)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6C6231001CDF
 for <ltp@lists.linux.it>; Thu,  5 Mar 2020 10:50:28 +0100 (CET)
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0259nRau006066;
 Thu, 5 Mar 2020 18:49:27 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Thu, 05 Mar 2020 18:49:27 +0900 (JST)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0259nKcd006026
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 5 Mar 2020 18:49:27 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
To: Jan Kara <jack@suse.cz>
References: <CA+G9fYs==eMEmY_OpdhyCHO_1Z5f_M8CAQQTh-AOf5xAvBHKAQ@mail.gmail.com>
 <20200305093832.GG21048@quack2.suse.cz>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <c875cdda-212e-d88c-6456-c270586be1ef@i-love.sakura.ne.jp>
Date: Thu, 5 Mar 2020 18:49:20 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200305093832.GG21048@quack2.suse.cz>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] fs/buffer.c: WARNING: alloc_page_buffers while mke2fs
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
Cc: ak@linux.intel.com, jlayton@redhat.com, lkft-triage@lists.linaro.org,
 tim.c.chen@linux.intel.com, LTP List <ltp@lists.linux.it>,
 open list <linux-kernel@vger.kernel.org>, willy@infradead.org,
 Michal Hocko <mhocko@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/03/05 18:38, Jan Kara wrote:
> On Tue 03-03-20 14:15:24, Naresh Kamboju wrote:
>> [Sorry for the spam]
>>
>> Linux-next 5.6.0-rc3-next-20200302 running on arm64 juno-r2 device while
>> running LTP syscalls chown tests.
>>
>> Suspecting commits are (did not do git bisect),
>> b1473d5f3d0 fs/buffer.c: dump more info for __getblk_gfp() stall problem
>> b10a7ae6565 fs/buffer.c: add debug print for __getblk_gfp() stall problem
> 
> These are almost certainly unrelated. If I'm looking right, the warning is
> coming from memalloc_use_memcg() called from alloc_page_buffers()
> complaining that memcg to charge is already set. But I don't see how that
> would be possible (at least with today's linux-next). Can you reproduce the
> problem with today's linux-next?
> 

Already handled as
https://lore.kernel.org/linux-mm/20200303162948.a383cb88c4a1b0bfd3817798@linux-foundation.org/ .

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
