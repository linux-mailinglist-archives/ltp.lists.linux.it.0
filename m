Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C81EF146
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 08:14:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47BFE3C2F5B
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 08:14:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 581223C222C
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 08:14:07 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 3D8111A01117
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 08:14:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591337644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hlT8nvgjOcgBAtBIJElTYbUHMMxTz6gIfXnc3+jBNDA=;
 b=LhjOnfPM4lgOGpMLIvng3vgErXLlhyIUj6/cZT1MS4vdptNflbwkUrhMzcvH97QYrhFayY
 U/jyMzwR+G3Wpqa7z4XxGhisPCuPSGf+S7wvdC8Hr0+Q2FQDEffiWCZRtSc8tGC4YJyq0B
 5d3TZKzxold5nu9MC9hZAfH2f7YF2q8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-y6_CiH2iNZC0hKmNBm4BuA-1; Fri, 05 Jun 2020 02:14:00 -0400
X-MC-Unique: y6_CiH2iNZC0hKmNBm4BuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FED580572E;
 Fri,  5 Jun 2020 06:13:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E695C557;
 Fri,  5 Jun 2020 06:13:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF01618095FF;
 Fri,  5 Jun 2020 06:13:58 +0000 (UTC)
Date: Fri, 5 Jun 2020 02:13:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1283643675.14872901.1591337638680.JavaMail.zimbra@redhat.com>
In-Reply-To: <4e69e550-d11e-2b0a-2e98-36b186b983e7@cn.fujitsu.com>
References: <0e99163dd0deef5e3c0e7276533998e80a93d16e.1591016352.git.jstancek@redhat.com>
 <2f353cb69600740308c196dcfa8f570ba6420bfa.1591087232.git.jstancek@redhat.com>
 <4e69e550-d11e-2b0a-2e98-36b186b983e7@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.4]
Thread-Topic: syscalls/ioctl_loop05: set loop blksize to bdev blksize
Thread-Index: EpxXPVyy4EWhY4hi++KsU97/795uKw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/ioctl_loop05: set loop blksize to
 bdev blksize
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
> Hi Jan
> 
> Looks good to me, acked.

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
