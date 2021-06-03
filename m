Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C339A062
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:56:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFEE33C5419
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:56:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 83C623C2834
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:50:48 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 11EE32009FC
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:50:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0431063;
 Thu,  3 Jun 2021 03:50:44 -0700 (PDT)
Received: from [192.168.178.6] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F8FC3F774;
 Thu,  3 Jun 2021 03:50:41 -0700 (PDT)
To: kernel test robot <oliver.sang@intel.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20210602064526.GB9872@xsang-OptiPlex-9020>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Message-ID: <56316b95-3ec5-74e6-a4f7-d91aea022abe@arm.com>
Date: Thu, 3 Jun 2021 12:50:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602064526.GB9872@xsang-OptiPlex-9020>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.6 required=7.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 03 Jun 2021 13:56:09 +0200
Subject: Re: [LTP] [sched/pelt] e906550aca:
 WARNING:at_kernel/sched/fair.c:#update_blocked_averages
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
Cc: juri.lelli@redhat.com, odin@uged.al, 0day robot <lkp@intel.com>,
 peterz@infradead.org, aubrey.li@linux.intel.com,
 LKML <linux-kernel@vger.kernel.org>, rostedt@goodmis.org, bsegall@google.com,
 lkp@lists.01.org, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com,
 ltp@lists.linux.it, yu.c.chen@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 02/06/2021 08:45, kernel test robot wrote:

[...]

> kern :warn : [   40.989618] WARNING: CPU: 2 PID: 253 at kernel/sched/fair.c:8029 update_blocked_averages (kbuild/src/consumer/kernel/sched/fair.c:8029 kbuild/src/consumer/kernel/sched/fair.c:8065 kbuild/src/consumer/kernel/sched/fair.c:8152) 

Hit something like this on my Ubuntu i7-7567U as well.

With more debugging:

[    7.388006] WARNING: CPU: 1 PID: 926 at kernel/sched/fair.c:8029 update_blocked_averages+0x30d/0x7e0
...
[    7.388167] path=/autogroup-2 load_avg=1 util_avg=0 runnable_avg=1

IMHO, this is because this patch needs:

(1) sched/pelt: ensure that *_sum is always synced with *_avg (2021-06-03 Vincent Guittot)

https://lkml.kernel.org/r/20210601085832.12626-1-vincent.guittot@linaro.org

(2) sched/fair: Keep load_avg and load_sum synced (2021-06-03 Vincent Guittot)

tip/sched/urgent 7c7ad626d9a0

Using both patches underneath makes this warning go away.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
