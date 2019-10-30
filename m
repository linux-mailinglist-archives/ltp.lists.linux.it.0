Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 742B1EA774
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 00:02:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35A453C1D76
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 00:02:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 21B933C14A2
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 00:02:09 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 3F6A0600BD2
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 00:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572476526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gb4y2mGZ2HuNchiOID7ENOnzy25z4pQuNSwLP6jMzbU=;
 b=Kidgx5Us5Da5lWtYyAOmP5DFkYLVNAY85aCKkQWDhwf+Rs5VEVjK+x+beROcMxrtKBCZBt
 ndKNC4KBfbYkMesxxxwU0vr7q2HjqrcdPNa6n8Abo4tG9Ejyw7PajfifQ5nOQHOkIfZAgu
 h2YlqBVfFam6k6oeBTwZddeBnLjg+cM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-RaF_TufGOUeGkNqOpXPcJg-1; Wed, 30 Oct 2019 19:02:02 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E79B800D49;
 Wed, 30 Oct 2019 23:02:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE1C460BE0;
 Wed, 30 Oct 2019 23:02:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D03361803C32;
 Wed, 30 Oct 2019 23:02:00 +0000 (UTC)
Date: Wed, 30 Oct 2019 19:02:00 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <1277217234.9839643.1572476520526.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYv+-dz11fSjMNt8SHaAhRpu1F=8MF7ieS4ZASAwDzH7Eg@mail.gmail.com>
References: <CA+G9fYv+-dz11fSjMNt8SHaAhRpu1F=8MF7ieS4ZASAwDzH7Eg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.26]
Thread-Topic: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
Thread-Index: T3UIiEKeh7fyfEuD+aF3Hb8e0lhM7A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: RaF_TufGOUeGkNqOpXPcJg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] LTP: accept02: BROK: accept02.c:52: setsockopt(6, 0, 42,
 0xffff9c56df78, 136) failed: ENODEV (19)
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
Cc: camann@suse.com, lkft-triage@lists.linaro.org,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> LTP syscall accept02 test failed intermittently on hikey arm64 device,
> qemu_x86_64 and qemu_i386.
> 
> Do you see this intermittent failure at your end ?

I'm not. What does the network look like on these systems?
Is there a default route? Is 224.0.0.0 reachable?

Can you check with?

# ip route 
# ip route get 224.0.0.0

> 
> hikey arm64 output log,
> 
> tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
> tst_buffers.c:55: INFO: Test is using guarded buffers
> accept02.c:127: INFO: Starting listener on port: 35903
> safe_net.c:186: BROK: accept02.c:52: setsockopt(6, 0, 42,
> 0xffff9c56df78, 136) failed: ENODEV (19)
> 
> qemu_x86_64 output log,
> 
> tst_test.c:1118: INFO: Timeout per run is 0h 15m 00s
> tst_buffers.c:55: INFO: Test is using guarded buffers
> accept02.c:127: INFO: Starting listener on port: 47245
> safe_net.c:186: BROK: accept02.c:52: setsockopt(6, 0, 42,
> 0x7f5397ca3f78, 136) failed: ENODEV (19)
> 
> Test results comparison,
> https://qa-reports.linaro.org/lkft/linux-mainline-oe/tests/ltp-syscalls-tests/accept02
> 
> Full test log,
> https://lkft.validation.linaro.org/scheduler/job/976363
> https://lkft.validation.linaro.org/scheduler/job/977681
> 
> Best regards
> Naresh Kamboju
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
