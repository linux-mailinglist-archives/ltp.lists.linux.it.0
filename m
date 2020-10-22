Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA214295890
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:50:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 917423C5684
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:50:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 66BF43C2631
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:50:52 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 6DF231A00E45
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:50:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603349450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUf4TVAFQo/c6KCTW4zefhqbMT+0Ipf3d5OSrWyFVUY=;
 b=Hlq2EqoLXGvD1qhJJCU3oe/oG2K36GZMymG2zcGX5x/Vmf5F+/DtRVmJCeGc8n4FfW0Iwj
 N879wkcQoq56G7j1ABGDL1yKsnvcrc4i8gsI4KVHAnB0yA4TXsLZJTI3m7QYTayT3ZTnSM
 osVwpr4QM85uOo8W0td1coFas3fMXhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-_QAav_W_Ox6Bbm0EiHaG8w-1; Thu, 22 Oct 2020 02:50:46 -0400
X-MC-Unique: _QAav_W_Ox6Bbm0EiHaG8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E646918A8224;
 Thu, 22 Oct 2020 06:50:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDA4451732;
 Thu, 22 Oct 2020 06:50:44 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5D4144A43;
 Thu, 22 Oct 2020 06:50:44 +0000 (UTC)
Date: Thu, 22 Oct 2020 02:50:44 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1661149750.18946583.1603349444680.JavaMail.zimbra@redhat.com>
In-Reply-To: <1603339033-8451-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
References: <1603339033-8451-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.15]
Thread-Topic: Remove ftime and sys/timeb.h
Thread-Index: znYdsWRU4VF5osP7d/xcb69UqKoY1g==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Remove ftime and sys/timeb.h
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
> The two case use ftime to get the current milliseconds and it was
> used to generate random value. Use gettimeofday() to get the microseconds
> can reach the same aim.
> 
> This also fixes the travis build error[1] on Fedora:Rawhide because the
> <sys/timeb.h>
> has been deprecated[2].
> 
> [1] https://travis-ci.org/github/linux-test-project/ltp/jobs/737698948
> [2] https://www.spinics.net/lists/fedora-devel/msg279545.html
> 
> Reported-by: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
