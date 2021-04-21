Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 138AE366966
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 12:46:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8EF9A3C6C0A
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Apr 2021 12:46:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B7BBF3C19F2
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 12:46:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 057066002B0
 for <ltp@lists.linux.it>; Wed, 21 Apr 2021 12:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619002005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KeBauY8p3bylguiYskFYEPNoLjy8X1hnrnrvkdFZYc=;
 b=Qd+PdxlrkyTI++hUeSXHcmii34BA3IF+Dot1NTv5Nmz9piUNWGoJgZIouskLzOuZ3+OD1E
 6S1mrm43YUCAd+8mfjTuOP4y/aUJ9Z3eO7Q46e7p1Xwu0ICYsgG4865GzVPtSwpdVPMj6c
 OWgSkY7QvivXHnnV8OUA58bCCRUKfnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-sgswG0ZAPt-AqMUevGtSTQ-1; Wed, 21 Apr 2021 06:46:42 -0400
X-MC-Unique: sgswG0ZAPt-AqMUevGtSTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D799881287;
 Wed, 21 Apr 2021 10:46:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFD960C05;
 Wed, 21 Apr 2021 10:46:41 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id A922D18095C9;
 Wed, 21 Apr 2021 10:46:41 +0000 (UTC)
Date: Wed, 21 Apr 2021 06:46:41 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <356706743.9191478.1619002001499.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fcEjre5xd1KuXsAkYzZG6tGaCttE8x3zbjxamVHfUUng@mail.gmail.com>
References: <20210420075351.16059-1-liwang@redhat.com>
 <728318760.8908748.1618921049585.JavaMail.zimbra@redhat.com>
 <CAEemH2fcEjre5xd1KuXsAkYzZG6tGaCttE8x3zbjxamVHfUUng@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.13, 10.4.195.21]
Thread-Topic: mkfs: print more info for debugging
Thread-Index: lVNd67/FJHzrczv5BXD43o4mH9abnQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mkfs: print more info for debugging
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
Cc: xuyang2018 jy <xuyang2018.jy@cn.fujitsu.com>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> On Tue, Apr 20, 2021 at 8:17 PM Jan Stancek <jstancek@redhat.com> wrote:
> >
> >
> >
> > ----- Original Message -----
> > > We can NOT reproduce the problem by manual with both ppc64le and s390x,
> > > so let's print more useful info from test when getting fail.
> >
> > It's mkfs_verify_size, test expects to find 90% blocks (of device size),
> > but lately we miss that by ~1-2%:
> >
> > # mkfs.ext3 /dev/loop0 16000
> > mke2fs 1.46.2 (28-Feb-2021)
> 
> Thanks for the info.
> 
> How reproducible of this issue, and which arch/platform you used?
> Or, can you reproduce it with a downgrade e2fsprogs version?

It starts with this commit:
  https://github.com/tytso/e2fsprogs/commit/59037c5357d39c6d0f14a0aff70e67dc13eafc84


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
