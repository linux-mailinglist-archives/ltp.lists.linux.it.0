Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368010349B
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:51:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0D463C2384
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Nov 2019 07:51:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 376A93C1814
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:51:44 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 8BEE660564A
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 07:51:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574232701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sJBpVI9pTQsmM0bLkgzdWdgc8Fv4TEcJbrWestpmvzI=;
 b=CoDwvfeAVt0Dd5e2OeWnqTiqoyDcV7t6mh890VnpuJJfNT+z81NX359fS84tRwuzutJCKl
 Eh0fmvnF2iWoYJxUO5DViHRoA/8mZL/zZtB9PY1n1TONtXPItJU9p2ZtmNmGZ5VW3303fl
 JymMcQeYnn0HXU7X5Yrb+lvJdZs2qds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-Kw41FsoONE2MjwdqilkRhg-1; Wed, 20 Nov 2019 01:51:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E28F5477
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 06:51:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE8E5C1B2
 for <ltp@lists.linux.it>; Wed, 20 Nov 2019 06:51:38 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C5A191809565;
 Wed, 20 Nov 2019 06:51:38 +0000 (UTC)
Date: Wed, 20 Nov 2019 01:51:38 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <2022379807.13117932.1574232698559.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fiyODj=FedbVK8xtrgz1T3JWO5dBiSUbA1L24XOx2yqA@mail.gmail.com>
References: <1a623a82dfac64c8a6f9805c197fa72cb5e6f046.1574159295.git.jstancek@redhat.com>
 <CAEemH2fiyODj=FedbVK8xtrgz1T3JWO5dBiSUbA1L24XOx2yqA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.56, 10.4.195.8]
Thread-Topic: don't pass NULL to strcmp in safe_mount
Thread-Index: w5tpnbsL8rU4j8p12JgBE5gwkmSS9w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Kw41FsoONE2MjwdqilkRhg-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: don't pass NULL to strcmp in safe_mount
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
> On Tue, Nov 19, 2019 at 6:29 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > Rachel reports, that pivot_root01 crashes on latest LTP:
> >   Thread 3.1 "pivot_root01" received signal SIGSEGV, Segmentation fault.
> >   0x00000000004062c4 in safe_mount (file=file@entry=0x413017
> > "pivot_root01.c"
> >   733             if (strcmp(filesystemtype, "ntfs")) {
> >
> > Don't pass NULL ptr to strcmp. Also fix return in unreachable path,
> > to suppress warning about returning uninitialized 'rval'.
> >
> 
> Good catch.
> 
> And shouldn't we give a "correct" fs_type in pivot_root01.c too? Otherwise,
> the test would be failed on an invalid mounted operation I guess.

Per man-page, it should be ignored.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
