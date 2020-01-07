Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B431321A9
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 09:50:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C37843C235D
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jan 2020 09:50:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id BA47E3C22D2
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 09:49:59 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 19CDB600E58
 for <ltp@lists.linux.it>; Tue,  7 Jan 2020 09:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578386997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FrXoQucgKeqctFntjklIQ5evi9pGY2w/l6gRJaD1+Us=;
 b=gpQZceBAw+2Xrwmyo23UOBemdO1IbKD6zno3ZSRR7CDSZ3LEi2dc3EK3q/dSojK2PEUCkH
 w3+UReWJ2fjyl/M3Izj977I6Dy7ddRoNQZ4AMvRE3vey47InRNEMMe/oRY1MtahYgvd5gM
 NKVK8DtWJXcBA0T/bdR0wl1R1JDkMA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-w3FoKo24PpeEv-xjPg4ZsQ-1; Tue, 07 Jan 2020 03:49:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BADC718552A2;
 Tue,  7 Jan 2020 08:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83EC89A84;
 Tue,  7 Jan 2020 08:49:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B4F84E166;
 Tue,  7 Jan 2020 08:49:52 +0000 (UTC)
Date: Tue, 7 Jan 2020 03:49:52 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <1571639528.891893.1578386992032.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2djB=2=HD=RQxkABDzFt5ZOZr+iVT3_chahSoZSLhoqqQ@mail.gmail.com>
References: <1576641763-18305-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2eKbbXjonuiKMdHcRda98hJikmGW4=YtWft0-1QAj0oBQ@mail.gmail.com>
 <8a1a9b95-5c42-2176-857a-e3c36fa42b55@cn.fujitsu.com>
 <CAEemH2djB=2=HD=RQxkABDzFt5ZOZr+iVT3_chahSoZSLhoqqQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.16]
Thread-Topic: syscalls/userfaultfd01: add hint about unprivileged_userfaultfd
Thread-Index: 5UjikONRmVvik+C/4MzJp3jHtw0DHQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: w3FoKo24PpeEv-xjPg4ZsQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/userfaultfd01: add hint about
 unprivileged_userfaultfd
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
> 
> After thinking over, to report TCONF is the wise method here because this
> test might run with an unprivileged user and it can not modify the knob
> "vm.unprivileged_userfaultfd".
> 
> Sorry and now I pull back my last comment.
> 
> Reviewed-by: Li Wang <liwang@redhat.com>

Pushed, thanks.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
