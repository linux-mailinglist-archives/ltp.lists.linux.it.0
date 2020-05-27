Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE721E39E7
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:11:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1FEF33C3220
	for <lists+linux-ltp@lfdr.de>; Wed, 27 May 2020 09:11:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id A7D163C321A
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:11:12 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 683506010FA
 for <ltp@lists.linux.it>; Wed, 27 May 2020 09:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590563469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VR6DYl6iPKGbl8iT6ARqvrMHuumFh4usMGrGRJO0Mvs=;
 b=GHtTwhjXWJfsmAC6kVp9hOXwIFWAsXUvvYgc2+rImjfMtEkLAzZjj+GAYmAUJJUp0IHP2d
 WgODyBXK6CIa9RtTASOH20CDVnbrnSIy35dq/eJYQ6OfACQp2hxo1CsrV1LcCvFah25VzN
 cgsjmJFoiGbovtvhlw1/QaZWhO3h8Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-5hZJyPICN6C1kFYoxANmAA-1; Wed, 27 May 2020 03:11:06 -0400
X-MC-Unique: 5hZJyPICN6C1kFYoxANmAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337628018A2
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:11:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D91310013D5
 for <ltp@lists.linux.it>; Wed, 27 May 2020 07:11:05 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2619C62D1F;
 Wed, 27 May 2020 07:11:05 +0000 (UTC)
Date: Wed, 27 May 2020 03:11:04 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1731864663.13759097.1590563464850.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cGa5tvgWAPbyoanBKh7MbM4kuo+Ws_i0Z2vmbCts1yYQ@mail.gmail.com>
References: <20200522012327.18991-1-liwang@redhat.com>
 <1156025603.13595880.1590481651127.JavaMail.zimbra@redhat.com>
 <CAEemH2cGa5tvgWAPbyoanBKh7MbM4kuo+Ws_i0Z2vmbCts1yYQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.19]
Thread-Topic: add new cgroup test API
Thread-Index: 2+Oz8PR3nHY3Vfe4DYh+8IN+OYSLBQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC 1/4] lib: add new cgroup test API
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

> > We should probably handle also EBUSY, for cases when controller is already
> > part
> > of existing hierarchy. E.g. cpu,cpuacct is mounted together, and someone
> > tries to mount just cpu:
> >   mount("none", "/mnt/cgroup", "cgroup", MS_MGC_VAL, "cpu") = -1 EBUSY
> > (Device or resource busy)
> >
> 
> That's true.
> 
> But in general, people are not permitted to use tst_cgroup*_mount()
> directly, it is only as the low-level/internal function to hide details we
> mount cgroup. My previous thought is that, in v1, cpu,cpuacct are bound
> together(as system way) in tst_croup_cpu().

They don't need to use tst_cgroup*_mount() directly, they could change their
system config and mount cpu,cpuacct,memcg together. Though chances of that
happening are low.

> > tst_cgroup_create(enum tst_cgroup_ctrl, const char *dir)
> >
> 
> Maybe we can drop the second parameter "dir", the mount
> functions are internal and we just use path macros in sub-function
> which like what I did.

I wanted to keep some flexibility in case test needs multiple cgroups.
I'll have a look at v1 you posted today.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
