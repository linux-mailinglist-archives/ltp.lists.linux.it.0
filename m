Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3041B989D
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 09:31:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CAA9D3C2860
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 09:31:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 88D2C3C042D
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 09:31:30 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 33AC7600781
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 09:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587972688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AS7HrQFJVQn3igVSj6mwUV8Bdg7Ao53+hzgRVEmpRlc=;
 b=bLtKwS0anj9Kno6nV1cVGsfzF/ZQKvjCMzsCYG0h52FtoFrD+M0gQqmugAPrwTNcGrqZty
 IG4MPJ9WH+r5FsRNzYWXD98ol6Gm0/vDvrkiRoeBybSomIdotN9VC08UiDUQ8MaOjmvAtu
 xlpATQN9UA3RecZaWmhAN5j0CK//yoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-827P0D3uMEakKp5-XK8D-Q-1; Mon, 27 Apr 2020 03:31:25 -0400
X-MC-Unique: 827P0D3uMEakKp5-XK8D-Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D30AF1054F9B;
 Mon, 27 Apr 2020 07:31:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C915627CC2;
 Mon, 27 Apr 2020 07:31:23 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0BF51809542;
 Mon, 27 Apr 2020 07:31:22 +0000 (UTC)
Date: Mon, 27 Apr 2020 03:31:22 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <951270734.10286613.1587972682386.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200427053125.GA21164@dell5510>
References: <20200424150422.17467-1-mdoucha@suse.cz>
 <20200427053125.GA21164@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: Add env variable as workaround for test issues in VMs
Thread-Index: UNC9I7e5T5oBZmFMWnrbtqY9fMJ9UQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add env variable as workaround for test issues in
 VMs
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
> Hi Martin,
> 
> > Timer tests often fail on sleep overrun when LTP is running inside a VM.
> > The main cause is usually that the VM doesn't get enough CPU time to wake
> > up
> > the test process in time.
> Cannot we detect presence of "hypervisor" in flags in /proc/cpuinfo?
> I though it was quite reliable for detecting VM.

We have tst_is_virt().

I see these tests fail frequently on ppc and s390, so I'm all for
some switch that would make it more forgiving if running under virt.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
