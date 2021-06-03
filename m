Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CDC39A067
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:56:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 872853C53D9
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 13:56:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5FDAC3C2834
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:59:46 +0200 (CEST)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D73D21000F2D
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 12:59:45 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id p20so6555706ljj.8
 for <ltp@lists.linux.it>; Thu, 03 Jun 2021 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3rUlx8O6TNfr8FAo3Ko7jcA+NjSFtbi9cuGQWJwaMeI=;
 b=bk7dW26FtQC+sjFuv3+rhLKc4yVisrxWKzPFfEqdbdZU6I2VjBocKV/I01NVgdsQdo
 VisV4Fc7KJy8g7GuH3c8lHXMXZUp7PoSqbJ8AgqKpg6YsYEEGvQnCc1SwDg/7DK5yU+d
 B6/kZOb0SPVK7Ab9KsOvVVY2WKodszQzpiNvnr9v5484bQ6ntTYKxjKiBK2QpNnYmyOG
 f4WLydV6Pv/PDA8ETfz5gZVx/FXmakvuSWoRz/oOyS6OSZfu4FTDv4O7zDTYWSPfBeQf
 9FoTwueSHKnjSN5jppDQJN2/itUJm9uMYUOgTkasy5Q+nes7nUXDjr9lzmE//HlYQq5P
 UzDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3rUlx8O6TNfr8FAo3Ko7jcA+NjSFtbi9cuGQWJwaMeI=;
 b=aiLb73wlYLX2KxppJwVpzKsBgXI6+e9dU18jDE+LTGSBD0bwOJtQJVt65NHcj1BuYK
 vPPhQRjUk5xLOOYiQd81AMMmT3RKQJIDMQcKR539po5YsJg09ntqcmsU7e3aCrYjNV7k
 tJHCvUnjt1GTisX+p10ReL1Ww0IfyS7JIHR7tEfe5NG2LITVmU/B0yWc82r5YNCcGPxi
 RQGNuG6tyCrZ0tZ97zkb2GqXfex8g4jY3veda0TY4cP/+pwmOkR+SVLSnDFUD9Zf6gBZ
 uU3pB6k11UGw0KVriMUKiLlY2rLbGtGdKwLrh73/5M3cL2Q5jNXrQrEumog6nbtjkly5
 ghEw==
X-Gm-Message-State: AOAM5307gelvq7KttX9bmkZw0bwswLnpH5rObWF0iJ8hFtOVhpatsgAv
 xYbnLkLIPZWUjRtJBl6/ZxIBphnbZGi+gN3XgpAWJQ==
X-Google-Smtp-Source: ABdhPJzzTSrwt9KuJqNENKblCJ655SIPCV6SW4v0MpBY63K3GyuQRp77wXqdZUTTwUtM1L9r0lb+8zB12pj2CZO41+k=
X-Received: by 2002:a2e:760c:: with SMTP id r12mr27765140ljc.299.1622717985236; 
 Thu, 03 Jun 2021 03:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210602064526.GB9872@xsang-OptiPlex-9020>
 <56316b95-3ec5-74e6-a4f7-d91aea022abe@arm.com>
In-Reply-To: <56316b95-3ec5-74e6-a4f7-d91aea022abe@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 3 Jun 2021 12:59:33 +0200
Message-ID: <CAKfTPtBKORaNBTZHDXhxyByB8NLwUPTRCy6TQw5VusPeJ2n1AQ@mail.gmail.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 03 Jun 2021 13:56:23 +0200
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Odin Ugedal <odin@uged.al>,
 0day robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Aubrey Li <aubrey.li@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 lkp@lists.01.org, Ingo Molnar <mingo@redhat.com>,
 kernel test robot <oliver.sang@intel.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, ltp@lists.linux.it,
 Chen Yu <yu.c.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Dietmar,

On Thu, 3 Jun 2021 at 12:50, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 02/06/2021 08:45, kernel test robot wrote:
>
> [...]
>
> > kern :warn : [   40.989618] WARNING: CPU: 2 PID: 253 at kernel/sched/fair.c:8029 update_blocked_averages (kbuild/src/consumer/kernel/sched/fair.c:8029 kbuild/src/consumer/kernel/sched/fair.c:8065 kbuild/src/consumer/kernel/sched/fair.c:8152)
>
> Hit something like this on my Ubuntu i7-7567U as well.

Thanks for having a look at this.

>
> With more debugging:
>
> [    7.388006] WARNING: CPU: 1 PID: 926 at kernel/sched/fair.c:8029 update_blocked_averages+0x30d/0x7e0
> ...
> [    7.388167] path=/autogroup-2 load_avg=1 util_avg=0 runnable_avg=1
>
> IMHO, this is because this patch needs:
>
> (1) sched/pelt: ensure that *_sum is always synced with *_avg (2021-06-03 Vincent Guittot)
>
> https://lkml.kernel.org/r/20210601085832.12626-1-vincent.guittot@linaro.org
>
> (2) sched/fair: Keep load_avg and load_sum synced (2021-06-03 Vincent Guittot)
>
> tip/sched/urgent 7c7ad626d9a0
>
> Using both patches underneath makes this warning go away.

I haven't spent time on this but that's also my 1st guess for the root cause

Regards,
Vincent

>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
