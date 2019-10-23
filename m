Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426AE1D81
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:59:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 65C0F3C1CB7
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 15:59:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id BE6B33C1C86
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:58:58 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 483EB1A01081
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 15:58:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571839136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4SmypL7q/S5yA9HyG033E2QCmOo/+0H+BqCm2SI+tjE=;
 b=WG6tu/UUC5sRxz3jeYeWe89B9NKLD0bBUR3trvfzQ6IC6tFpaV3EqkCWQC/grIRxBEhGsx
 SEnnRsqBaMSPQnI4aCNrbZnbL1nWoQOUILH8gOxiHNlmn6PXmdWsHurN36gw57GQgVU+wp
 4VoZ9iyDJRt3KCIcBhQUwSDCx/l9YWE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-sTXL6cPcP2undgZP4jwS3g-1; Wed, 23 Oct 2019 09:58:54 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F99A800D49
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 13:58:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 681315ED21
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 13:58:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 602E54E58A
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 13:58:53 +0000 (UTC)
Date: Wed, 23 Oct 2019 09:58:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: ltp@lists.linux.it
Message-ID: <1714198769.8739783.1571839133168.JavaMail.zimbra@redhat.com>
In-Reply-To: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
References: <cb6173ec393a23949ec40c9747fc7f75fed2591f.1571838908.git.jstancek@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.8]
Thread-Topic: timer_create01: accept kernel ENOTSUPP
Thread-Index: NXDHF9TxkFrPflx4Y57VWzGHKZ2yEQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: sTXL6cPcP2undgZP4jwS3g-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] timer_create01: accept kernel ENOTSUPP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> ENOTSUP in userspace is alias for EOPNOTSUPP, so the test still fails.
> Add definition of kernel's ENOTSUPP and use that.
> 
> Signed-off-by: Jan Stancek <jstancek@redhat.com>

I think I misread the original commit. Seems we want this to fail for ENOTSUPP.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
