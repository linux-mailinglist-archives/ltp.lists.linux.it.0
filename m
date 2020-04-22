Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB31B4355
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:33:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E61AC3C2977
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Apr 2020 13:33:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D434B3C295D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:33:48 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 5F21860028D
 for <ltp@lists.linux.it>; Wed, 22 Apr 2020 13:33:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587555226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52hhEZ1N6Af2MJg8QYcxzoig3SZD799OaOxyDEhCmt4=;
 b=i0Vrt7gbXAY/SJpw0iqZwy4QTCbOHqh8DoUlSPY0bnBWdnF2muaZ69D+PYBiy/O6TU0e2Y
 ucCMRgVgf7K/a46XnMgiMQD+LnmwoFxZV0L1vxv81F1afoZgD+gU9z0o7nmpQyaf+ouK0o
 INwomSv1Ww7fbucU83if2cxPdDF5O9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-99EwYJ83MxqEsTxW0fwoxw-1; Wed, 22 Apr 2020 07:33:44 -0400
X-MC-Unique: 99EwYJ83MxqEsTxW0fwoxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10FBA1137840;
 Wed, 22 Apr 2020 11:33:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D24F65D706;
 Wed, 22 Apr 2020 11:33:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90E099338A;
 Wed, 22 Apr 2020 11:33:43 +0000 (UTC)
Date: Wed, 22 Apr 2020 07:33:43 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <431757761.9427972.1587555223323.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fWhXzLRV+g=hN9yJRcmqsj2iGMxxy14GGGKDpBAEX5HQ@mail.gmail.com>
References: <bc3c52ff5b97feefa4200c3d87002de5a61ee360.1587539566.git.jstancek@redhat.com>
 <CAEemH2fWhXzLRV+g=hN9yJRcmqsj2iGMxxy14GGGKDpBAEX5HQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.3]
Thread-Topic: lib/tst_hugepage: TCONF when huge pages are not supported
Thread-Index: 4HWv2yfXBSgBCeEgHbmzhUTpyNMi8A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib/tst_hugepage: TCONF when huge pages are not
 supported
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
> >         if (access(PATH_HUGEPAGES, F_OK)) {
> >                 tst_hugepages = 0;
> > -               goto out;
> > +               tst_brk(TCONF, "Huge pages not supported.");
> >
> 
> We don't do that because hugetlb is not the hard requirement for some tests
> (i.e pkey01.c). If we exit with TCONF at an early phase on a non-hugetlb
> system the remaining test will be missed too. In a word, the goto out here
> is on purpose.

Then it's a bit strange it TBROKs if it can't reserve enough huge pages.

I'll send v2, that's checking tst_hugepages. Almost all tests appear to have the 
check already, it just needs to be moved up a little in setup().


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
