Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3128D1F3415
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:26:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E20403C2E49
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:26:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1D0A63C2E3F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:26:04 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 0F599140162F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591683962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PG5wyGApVOXiUW+BAG+P9SzGgWAyys6ffpPg1+TMVPg=;
 b=VIL6HOvHqcAhfQy9O2gPwdQob644XeBS/tDJwnb220t3opoMxfBBY9sLoxizoPUk61oL5A
 WTEnHNM7gSpsQcJ3ma/N/ooCnrv8Bu/yZdKUuRNTdsHc1YeOKE9n/CYUw3g/+Zq5Z08xvL
 gb0x2/TvNfyBMQ9v9e+3LxQ4Y8FdpWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-r3U__mQTPDq3iKhJkK8PKg-1; Tue, 09 Jun 2020 02:25:55 -0400
X-MC-Unique: r3U__mQTPDq3iKhJkK8PKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 388411854C6E;
 Tue,  9 Jun 2020 06:25:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6F36648DB;
 Tue,  9 Jun 2020 06:25:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C9051809542;
 Tue,  9 Jun 2020 06:25:53 +0000 (UTC)
Date: Tue, 9 Jun 2020 02:25:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <1150717403.15265201.1591683953555.JavaMail.zimbra@redhat.com>
In-Reply-To: <BMXPR01MB2344728D919729E8F7F007EBEE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1210169239.15186381.1591627929151.JavaMail.zimbra@redhat.com>
 <BMXPR01MB2344728D919729E8F7F007EBEE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.24]
Thread-Topic: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
Thread-Index: AQHWPaRp6Cqd9U2uDkWBsGMqNoKOG6jPuRdnq9je5cI=
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi Jan Stancek,
> Thanks for your response.All of the following test are failing w.r.t sched
> 
> 1) sched_setparam02
> 2) sched_setparam03
> 3) sched_getscheduler01

That suggests it could be cpu.rt_runtime_us == 0, since all tests are
trying to use realtime scheduler.

> 
> root@exaleapsemi-r2:/opt/ltp# strace ./runltp -s sched_setparam02

Above doesn't help much, since you are not tracing child processes.

1. Can you run this instead:
 /opt/ltp# strace ./testcases/bin/sched_setparam02

2. Can you check what is the cpu.rt_runtime_us for pid that runs the test?

# cpu_mnt=$(mount | grep "type cgroup (.*cpu[,)]" | awk '{print $3}')
# p=$(cat /proc/self/cgroup | grep ":cpu[:,]" | sed "s/.*://")
# cat $cpu_mnt/$p/cpu.rt_runtime_us


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
