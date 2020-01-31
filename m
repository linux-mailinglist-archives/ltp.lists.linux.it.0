Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9314EA26
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:37:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 774843C247C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jan 2020 10:37:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id A0F9F3C245A
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:37:53 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id E539214052C0
 for <ltp@lists.linux.it>; Fri, 31 Jan 2020 10:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580463471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yrx1dxsw+3uxww6nNCwLTReT2Vr7PS/VEIduOQgLVR8=;
 b=akuGyFDGxmQ6dizSq6+AV5/LQRsoFn1rea8+vrL5lTu4SI7+UJtzmV56MRApYRpw4YH/Mc
 tqplsATwMqxv2g6WkP6lKj/cKhG6h0JWwPx4KPPwY2LY/Vv+fXPZkftjY4xczaUkIXl6Fh
 t1BbX4xX0qw7JSM3aCTCO8o7SW0giac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-KCzYHvGWMP2Mlb5EMd-7dg-1; Fri, 31 Jan 2020 04:37:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A0F0477;
 Fri, 31 Jan 2020 09:37:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E3FD60BE0;
 Fri, 31 Jan 2020 09:37:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B9C885CCA;
 Fri, 31 Jan 2020 09:37:43 +0000 (UTC)
Date: Fri, 31 Jan 2020 04:37:42 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>, Martin Doucha <mdoucha@suse.cz>
Message-ID: <1041474174.5093428.1580463462902.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2f7s+q1upnaikCnQZSqxb-xgdN73aPxhKhLo2i5_M7FkA@mail.gmail.com>
References: <20200130161337.31614-1-mdoucha@suse.cz>
 <CAEemH2f7s+q1upnaikCnQZSqxb-xgdN73aPxhKhLo2i5_M7FkA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.18]
Thread-Topic: Taunt OOM killer in fork12 setup()
Thread-Index: 0D0hOVP8h9FwXJ29WUoyhyXLxXG3Lg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: KCzYHvGWMP2Mlb5EMd-7dg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Taunt OOM killer in fork12 setup()
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
> 
> On Fri, Jan 31, 2020 at 12:13 AM Martin Doucha < mdoucha@suse.cz > wrote:
> 
> 
> On a system with low memory, fork12 can trigger OOM killer before it hits
> any fork() limits. The OOM killer might accidentally kill e.g. the parent
> shell and external testing tools will assume the test failed.
> 
> Set high oom_score_adj on the fork12 process so that the OOM killer focuses
> on it and its children.
> 
> It sounds more like the OOM-Killer defect but not fork12.

Badness score is based on proportion of rss/swap. It doesn't seem like
defect to me, we just quickly spawn many small tasks.

> What we do for that
> is to protect the parent shell and its harness to avoid oom_kill_process()
> acting on them.
> 
> On the other side, if we do raise the oom score of fork12, that would not
> guarantee OOM-Killer do right evaluation but just makes fork12 easily to be
> killed in testing.

fork12 is not an OOM test, so I don't see problem with this. We only need OOM
to kill something we don't care about, in case it triggers.

I'd move oom_score_adj after fork, so only child processes are better target,
not the parent.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
