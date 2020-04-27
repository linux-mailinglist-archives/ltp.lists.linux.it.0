Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3A1B9F64
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:10:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47DEA3C2864
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 11:10:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id B37B93C226C
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:10:37 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B1D1C1000A29
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 11:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587978635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HVwht1y2GSkUKYDJFrJriS36tJoTdV524rjfRGE3BNQ=;
 b=XAVZhzOHtsLe3BT6jG0YThAEK8sP84heq9OAO6ppYxXlbgDP/B3pQgx71Sq6JW5aaPOajD
 bXzkUcnNmmBlgGRxLcpQeeAgf1yQsSv/5PxIkV6+oHjfaszCUZe9/9IVpMn16NTrpX+wMo
 cb7XUKfkOjGPzBHtA68BmBgw00ID2nE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370--hnIfsldPuOhgY0dJRz_eA-1; Mon, 27 Apr 2020 05:10:30 -0400
X-MC-Unique: -hnIfsldPuOhgY0dJRz_eA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA4271895A2B;
 Mon, 27 Apr 2020 09:10:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1C0C5D9DD;
 Mon, 27 Apr 2020 09:10:29 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id B77F718095FF;
 Mon, 27 Apr 2020 09:10:29 +0000 (UTC)
Date: Mon, 27 Apr 2020 05:10:29 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <437172135.10298956.1587978629703.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2d_0PxgFM6cqQ8WRgaab-w1CmXbBHxkxDawQ+pUEtcMew@mail.gmail.com>
References: <7dd91d5aa2d64bcd0223120916c202f19c327237.1587471007.git.jstancek@redhat.com>
 <CAEemH2d_0PxgFM6cqQ8WRgaab-w1CmXbBHxkxDawQ+pUEtcMew@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: tst_taint: Ignore WARN taint flag if already set
Thread-Index: 0LDaUcdwui+JrWr2rmrRgsxCmerRsA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] lib: tst_taint: Ignore WARN taint flag if
 already set
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
Cc: LTP List <ltp@lists.linux.it>, Chang Yin <cyin@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> On Tue, Apr 21, 2020 at 8:15 PM Jan Stancek <jstancek@redhat.com> wrote:
> 
> > This commit changes the library so that it ignores the taint warn flag
> > if it was set prior to the test run. It turns out that the warn taint
> > flag is not well defined and could be easily set on a freshly booted
> > kernel for example when buggy BIOS is detected.
> >
> > Other recent example is disabling ip forward on kvm guests:
> >   https://github.com/containers/libpod/issues/5815
> >
> > https://lore.kernel.org/netdev/a47b6a3b-c064-2f53-7cf6-d0d0720e9d99@redhat.com/
> >
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > Signed-off-by: Jan Stancek <jstancek@redhat.com>
> > CC: Chang Yin <cyin@redhat.com>
> > CC: Li Wang <liwang@redhat.com>
> >
> 
> Reviewed-by: Li Wang <liwang@redhat.com>

Pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
