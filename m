Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5244295835
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:01:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68AAC3C3295
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Oct 2020 08:01:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5867C3C2620
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:01:44 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6AD50140112A
 for <ltp@lists.linux.it>; Thu, 22 Oct 2020 08:01:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603346502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ts/nx1a092SnWH88LCHzOUSzicFjdc9ILqDTYzCcFvo=;
 b=Ol11E+u/Cr8NRSRHJfqdIiC9qdxaqMJhBdtx7cj41W+HYpWio6i9XYC6UBRSlLffTcPHM0
 /8qeJqF0koWwbK5NKwuU74mrxZ49P4WKDPOddQJTTuhjIAkrlF/sr2u2dn5mMrS1b7jclq
 XH9ZMEZVBl4x05sEHx3412SwlCXDUa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-T54_ypoaMfWfYpmNKAmkOQ-1; Thu, 22 Oct 2020 02:01:38 -0400
X-MC-Unique: T54_ypoaMfWfYpmNKAmkOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66082107ACF5;
 Thu, 22 Oct 2020 06:01:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35DDF5D9F1;
 Thu, 22 Oct 2020 06:01:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0F84181A261;
 Thu, 22 Oct 2020 06:01:36 +0000 (UTC)
Date: Thu, 22 Oct 2020 02:01:36 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
Message-ID: <493039434.18941934.1603346496769.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
References: <20201021193547.GA49488@x230>
 <CAEemH2cAeMzbr6WWDOTTNYkU8b+1J+7WEHjGU283r3qWtXP8TA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.11]
Thread-Topic: Broken Fedora build
Thread-Index: WC/KKFWmB3DVbXiOS2vk3ctzhtFEgw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Broken Fedora build
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
> Petr Vorel <pvorel@suse.cz> wrote:
> 
> > Fedora build is broken due missing <sys/timeb.h> [1].
> > Quick fix would probably be to use Fedora 33 instead of Rawhide. [2]
> > But we should port hugetlb.c and trace_sched.c (if used) to gettimeofday or
> > clock_gettime. [3]
> 
> +1
> I prefer to go replace ftime() by gettimeofday() or clock_gettime()
> way to solve this from root.

Agreed, ftime is marked as obsolete.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
