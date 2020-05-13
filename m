Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF831D19A6
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 17:40:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B4DF63C54F8
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 17:40:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 023B13C21AE
 for <ltp@lists.linux.it>; Wed, 13 May 2020 17:40:30 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 321432011B5
 for <ltp@lists.linux.it>; Wed, 13 May 2020 17:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589384428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Rwauy6ze7wp8liue4GeJex+DR2vmusIwZACZsakXMw=;
 b=CRAcSXo/VSqDSb/GjajnXhMN4NO2d8VkiTxSqr1zts94KbaqaT1goEgcxmXrt52sHtbrpr
 Ch/IASRGjqBno8JFcXvlarLjAUg9wFsR88C0fcQAgVQ5KDCioaEusPVoZjpQExlhQtOYmm
 Y2cZMoVFie1hXiNj3mrxTArsaQSnajw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-FAEBAe3nMHuRznnDVCJ7Ag-1; Wed, 13 May 2020 11:40:17 -0400
X-MC-Unique: FAEBAe3nMHuRznnDVCJ7Ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AAAF107ACF5;
 Wed, 13 May 2020 15:40:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5242E5C1C3;
 Wed, 13 May 2020 15:40:16 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7C1B1809542;
 Wed, 13 May 2020 15:40:15 +0000 (UTC)
Date: Wed, 13 May 2020 11:40:15 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Veronika Kabatova <vkabatov@redhat.com>, cgroups@vger.kernel.org
Message-ID: <1039472143.12305448.1589384415559.JavaMail.zimbra@redhat.com>
In-Reply-To: <1322199095.22739428.1589365183678.JavaMail.zimbra@redhat.com>
References: <cki.495C39BD1A.T35Z6VDJPY@redhat.com>
 <20200513060321.GA17433@willie-the-truck>
 <1322199095.22739428.1589365183678.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: =?utf-8?B?4p2MIEZBSUw6?= Test report for kernel
 5.7.0-rc5-51f14e2.cki (arm-next)
Thread-Index: CtSTqRVDaqaioGJOAWPCV364AVfM7Pzqql76
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel=095=2E7?=
 =?utf-8?q?=2E0-rc5-51f14e2=2Ecki_=28arm-next=29?=
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
Cc: catalin marinas <catalin.marinas@arm.com>,
 Memory Management <mm-qe@redhat.com>, linux-arm-kernel@lists.infradead.org,
 CKI Project <cki-project@redhat.com>, Will Deacon <will@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> >        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
> >            Commit: 51f14e2c02e8 - Merge branch 'for-next/core' into for-kernelci
> >
> > I'm struggling a bit with this one, please can you confirm that it's not
> > an issue on your end? The failures are related to /dev/cpuset:
> > 
> >   mem.c:760: BROK: mount /dev/cpuset: EBUSY (16)
> >   ...
> >   safe_macros.c:172: BROK: mem.c:750: mkdir(/dev/cpuset,0777) failed:
> >   EEXIST
> >   (17)
> > 
> >   https://cki-artifacts.s3.us-east-2.amazonaws.com/datawarehouse/2020/05/12/564910/LTP/aarch64_2_ltp_mm.fail.log
> > 
> > But we haven't been anywhere near that in the arm64 tree afaik.
> > 
> 
> Hi,
> 
> I suspect this is an LTP bug:
> 
> https://github.com/linux-test-project/ltp/issues/611

[CC cgroups & LTP]

In LTP issue above it was clear that memory controller is in use.
Here it looks like some lingering reference to cpuset controller
that can't be seen in sysfs.

It's triggered by podman tests actually:
1. run podman tests
2. mount -t cgroup -ocpuset cpuset /mnt/cpuset/ -> EBUSY

# mount | grep cgroup
cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,seclabel)

# grep cpuset -r /sys/fs/cgroup/
/sys/fs/cgroup/cgroup.controllers:cpuset cpu io memory pids

And yet, v1 cgroup fails to mount:

# mount -t cgroup -ocpuset cpuset /mnt/cpuset/
mount: /mnt/cpuset: cpuset already mounted or mount point busy.

Fail state persists also after I disable all controllers and move
all processes to root:

# cat /sys/fs/cgroup/cgroup.subtree_control
# ll /sys/fs/cgroup/
total 0
-r--r--r--. 1 root root 0 May 13 10:35 cgroup.controllers
-rw-r--r--. 1 root root 0 May 13 10:44 cgroup.max.depth
-rw-r--r--. 1 root root 0 May 13 10:44 cgroup.max.descendants
-rw-r--r--. 1 root root 0 May 13 10:58 cgroup.procs
-r--r--r--. 1 root root 0 May 13 10:44 cgroup.stat
-rw-r--r--. 1 root root 0 May 13 11:00 cgroup.subtree_control
-rw-r--r--. 1 root root 0 May 13 10:44 cgroup.threads
-rw-r--r--. 1 root root 0 May 13 10:44 cpu.pressure
-r--r--r--. 1 root root 0 May 13 10:44 cpuset.cpus.effective
-r--r--r--. 1 root root 0 May 13 10:44 cpuset.mems.effective
-rw-r--r--. 1 root root 0 May 13 10:44 io.cost.model
-rw-r--r--. 1 root root 0 May 13 10:44 io.cost.qos
-rw-r--r--. 1 root root 0 May 13 10:44 io.pressure
-rw-r--r--. 1 root root 0 May 13 10:44 memory.pressure

# mount -t cgroup -ocpuset cpuset /mnt/cpuset/
mount: /mnt/cpuset: cpuset already mounted or mount point busy

If I reboot and don't run any podman tests, v1 cgroup mounts fine:

# cat /sys/fs/cgroup/cgroup.controllers
cpuset cpu io memory pids
# mount -t cgroup -ocpuset cpuset /mnt/cpuset/
# cat /sys/fs/cgroup/cgroup.controllers
cpu io memory pids
# umount /mnt/cpuset/
# cat /sys/fs/cgroup/cgroup.controllers
cpuset cpu io memory pids


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
