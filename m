Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 581BF1F3458
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:48:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 204543C2E49
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 08:48:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id C6C5B3C2E3F
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:48:54 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id C38B81000B2A
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 08:48:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591685332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oN+YSxiV0FPb2slAO1AKipj0ZKrRBsOLIup/GSSgqI=;
 b=XeW1UyR+l24hERoC+2RhkdeVx7F+MCbZDAmT42FtfvsTOy9pCI6bX9tP7ptTG04gfw5G56
 NZ2cxHGNT9CwBqXAtTO+abvmXJBUQwHt/vGBPmoqgpFZRquvQz2IpMwx33SbBO24VCmDU3
 xUUQUEGliJKrb/dGKoxUs2X8qg0bYdg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-w9bSEsiTMPCs56pqA5YlKQ-1; Tue, 09 Jun 2020 02:48:49 -0400
X-MC-Unique: w9bSEsiTMPCs56pqA5YlKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E69901800D42;
 Tue,  9 Jun 2020 06:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF2A05C1BD;
 Tue,  9 Jun 2020 06:48:48 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D86061809542;
 Tue,  9 Jun 2020 06:48:48 +0000 (UTC)
Date: Tue, 9 Jun 2020 02:48:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <1242963582.15267570.1591685328616.JavaMail.zimbra@redhat.com>
In-Reply-To: <BMXPR01MB23445D894481BDFED050AD27EE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
References: <BMXPR01MB23442B106F1292542BA7F85CEE850@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1210169239.15186381.1591627929151.JavaMail.zimbra@redhat.com>
 <BMXPR01MB2344728D919729E8F7F007EBEE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
 <1150717403.15265201.1591683953555.JavaMail.zimbra@redhat.com>
 <BMXPR01MB23445D894481BDFED050AD27EE820@BMXPR01MB2344.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.1]
Thread-Topic: [LTP] sched_rr_get_interval01 , sched_rr_get_interval02 ,
 sched_rr_get_interval03 testcase failure
Thread-Index: AQHWPaRp6Cqd9U2uDkWBsGMqNoKOG6jPuRdnq9je5cLUJztFZSiLMMur
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

----- Original Message ----- 

> sched_setscheduler(0, SCHED_FIFO, [1]) = -1 EPERM (Operation not permitted)

Thanks, that aligns with the theory.

> 2)
> root@exaleapsemi-r2:/opt/ltp# pu_mnt=$(mount | grep "type cgroup (.*cpu[,)]"
> | awk '{print $3}')
> root@exaleapsemi-r2:/opt/ltp# cpu_mnt=$(mount | grep "type cgroup (.*cpu[,)]"
> | awk '{print $3}')
> root@exaleapsemi-r2:/opt/ltp# p=$(cat /proc/self/cgroup | grep ":cpu[:,]" |
> sed "s/.*://")
> root@exaleapsemi-r2:/opt/ltp# cat $cpu_mnt/$p/cpu.rt_runtime_us
> cat: //system.slice/system-sshd.slice/cpu.rt_runtime_us: No such file or
> directory

> it didnt gave any info about cpu.rt_runtime_us??

That could be because your distro is mounting cgroup2.

# mount | grep cgroup

Do you see any change if you run following?

# echo $$ > /sys/fs/cgroup/cgroup.procs
# /opt/ltp/testcases/bin/sched_setparam02


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
