Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B66922530E
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 19:27:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E18023C2874
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jul 2020 19:27:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 8B7DD3C1D5B
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 19:27:05 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 9DB07600D7C
 for <ltp@lists.linux.it>; Sun, 19 Jul 2020 19:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595179623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lgjxX5GX4B3OXujKzLwZHeStqyFy0vD4+Eul1Mym+2g=;
 b=G+RwCJMCk567Qp2W+Chw4qLytVNSVn4jGefVBnflRde0tg1/YkqrtkALnm7n3lHecVul4U
 uaGq1xIeaKyt9X3CebS6JCIY9fjGffZaPMFyVAKmdfQV4muB44V8Y7S+WHbqGKyCgHKW92
 Z8eIzJ9XyjQWc2JoqQD4q6DkW3CP4pA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-lhjEoe6rNv6E8_ufgT0nIg-1; Sun, 19 Jul 2020 13:27:00 -0400
X-MC-Unique: lhjEoe6rNv6E8_ufgT0nIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98CA1005504;
 Sun, 19 Jul 2020 17:26:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D22A374F6D;
 Sun, 19 Jul 2020 17:26:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 894E094EE3;
 Sun, 19 Jul 2020 17:26:58 +0000 (UTC)
Date: Sun, 19 Jul 2020 13:26:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <541528424.3620946.1595179618230.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200717112919.GB56792@x230>
References: <1594959191-25155-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200717073842.GA31254@dell5510> <20200717080840.GB32407@dell5510>
 <1eac1ed9-66dd-5141-0bc2-cc05312704c8@cn.fujitsu.com>
 <20200717103816.GA28835@yuki.lan> <20200717112919.GB56792@x230>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.11]
Thread-Topic: lapi/io_uring.h: Add declaration of __kernel_rwf_t
Thread-Index: TNkmwMBbXkKaOSPLc2CJ7QnSi7qTNw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/io_uring.h: Add declaration of __kernel_rwf_t
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
> Hi,
> 
> > > Also, I think we should replace _u32 with uint32 in lapi/loop.h if we
> > > don't want to include linux kernel header for single use.
> 
> > The whole __bitwise is used only by a sparse checker, there is no point
> > to include it in LTP. So we can just typedef the __kernel_rwf_t to int.

+1

> Merged. Thanks both of you for your comments.

Thanks. Sorry for late/no response, I have some time off with limited access to email.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
