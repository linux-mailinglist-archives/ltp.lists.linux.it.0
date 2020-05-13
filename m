Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8BD1D1B41
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 18:40:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 678533C5503
	for <lists+linux-ltp@lfdr.de>; Wed, 13 May 2020 18:40:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id A8A0A3C25D8
 for <ltp@lists.linux.it>; Wed, 13 May 2020 17:51:18 +0200 (CEST)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E540A1A01450
 for <ltp@lists.linux.it>; Wed, 13 May 2020 17:51:17 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id x12so177609qts.9
 for <ltp@lists.linux.it>; Wed, 13 May 2020 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rLEeAmSBwjT3ETZ4wrXG/Y/gbcP+c03guOC0q4Y8fXA=;
 b=CxGZlnCeO8Z+6gWlkyNbL90JiSBlEzm6ThptrdmeTLYbrTmiUMlAF6eHDx9NV4zeGb
 6Rz3PQV5R2XN9pUf4xmN1IKVyaF3WVMHV2UboX5qGevLW946cEuuraERFw9eQEGrXbKC
 ZEtxxPGYbrPUoeWB24ML8Lrx5iuNxW9EkzdqgnkAEasHh2uQH+0JMGCCrdUhLWCvQxBk
 JnuFgJC9Q7HhNbdxW6kBxmZQg/NA4JNrsvfHwgltLePF6FTwiQ/6ToQYL4IHmpzv3H5S
 y/cem8PayEiSqD2aA8SYbHiKZP+VpyM2Tnbb7hjAsHqXaRo4rS7TuE99ktMAowj5sh3E
 V6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=rLEeAmSBwjT3ETZ4wrXG/Y/gbcP+c03guOC0q4Y8fXA=;
 b=Y4pxH25WyFfVsAk92lhLNgL/K8vdvDu+Ry/FJbIHWQLQb4UPh/HCiRkvJPDe/0CRbD
 i1jCX82xRfQSBqj9rOqS1UF9+JDs21S3+Bm1UMQhDt6gyq6qdDghc0mxLhsgghfhEB2d
 nHKwi2A63NsNRrtNqyHWMEEe3zA0ahUJat8Y2OQoz6XMB/8/gY5v46I3qgEDds/VFiDl
 CvXFk2vJWQ6uJncVwIrJbL2d2mcbldlhvXmpiYWRZNaxf8cr7vJNIP1YXL72jxjeO5MA
 545fHUn4La7Lkkf5cptJaYSzfWY/kbnDEbMLWdFP7J/YKFaLkdFPpPos8nY/gDdRT1lI
 mMIQ==
X-Gm-Message-State: AGi0Pubn9u77snjBrdAqFcYVsxsNed8XZcN73kp/poqjiJmnz2vucW3x
 4rw2yJeJO7sT851Trc5Z1qI=
X-Google-Smtp-Source: APiQypJBGgkxSgwM/jON7e/l0PAa64vx+SeoV9cMd7E3z4I3RW/6nSCOjOHbnOoiFOC7cea+rfzl7g==
X-Received: by 2002:ac8:3664:: with SMTP id n33mr29399453qtb.363.1589385076554; 
 Wed, 13 May 2020 08:51:16 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:beb1])
 by smtp.gmail.com with ESMTPSA id t88sm7645qtd.5.2020.05.13.08.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 08:51:15 -0700 (PDT)
Date: Wed, 13 May 2020 11:51:14 -0400
From: Tejun Heo <tj@kernel.org>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20200513155114.GF16815@mtj.duckdns.org>
References: <cki.495C39BD1A.T35Z6VDJPY@redhat.com>
 <20200513060321.GA17433@willie-the-truck>
 <1322199095.22739428.1589365183678.JavaMail.zimbra@redhat.com>
 <1039472143.12305448.1589384415559.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1039472143.12305448.1589384415559.JavaMail.zimbra@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
X-Mailman-Approved-At: Wed, 13 May 2020 18:40:09 +0200
Subject: Re: [LTP] 
 =?utf-8?q?=E2=9D=8C_FAIL=3A_Test_report_for_kernel=3F5=2E7?=
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
 Memory Management <mm-qe@redhat.com>, LTP List <ltp@lists.linux.it>,
 CKI Project <cki-project@redhat.com>, cgroups@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, May 13, 2020 at 11:40:15AM -0400, Jan Stancek wrote:
> In LTP issue above it was clear that memory controller is in use.
> Here it looks like some lingering reference to cpuset controller
> that can't be seen in sysfs.
> 
> It's triggered by podman tests actually:
> 1. run podman tests
> 2. mount -t cgroup -ocpuset cpuset /mnt/cpuset/ -> EBUSY
> 
> # mount | grep cgroup
> cgroup2 on /sys/fs/cgroup type cgroup2 (rw,nosuid,nodev,noexec,relatime,seclabel)
> 
> # grep cpuset -r /sys/fs/cgroup/
> /sys/fs/cgroup/cgroup.controllers:cpuset cpu io memory pids
> 
> And yet, v1 cgroup fails to mount:
> 
> # mount -t cgroup -ocpuset cpuset /mnt/cpuset/
> mount: /mnt/cpuset: cpuset already mounted or mount point busy.

While if a regression it may point to a newly introduced behavior, in
general, dynamically reassigning cgroup controllers to a different version
hierarchy after active use is not something fully supported. From cgroup2
documentation:

  A controller can be moved across hierarchies only after the controller is
  no longer referenced in its current hierarchy. Because per-cgroup
  controller states are destroyed asynchronously and controllers may have
  lingering references, a controller may not show up immediately on the v2
  hierarchy after the final umount of the previous hierarchy. Similarly, a
  controller should be fully disabled to be moved out of the unified
  hierarchy and it may take some time for the disabled controller to become
  available for other hierarchies; furthermore, due to inter-controller
  dependencies, other controllers may need to be disabled too.

  While useful for development and manual configurations, moving controllers
  dynamically between the v2 and other hierarchies is strongly discouraged
  for production use. It is recommended to decide the hierarchies and
  controller associations before starting using the controllers after system
  boot.

Thanks.

-- 
tejun

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
