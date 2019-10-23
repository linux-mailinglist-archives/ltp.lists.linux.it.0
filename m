Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23410E1380
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:58:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 496323C23FA
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Oct 2019 09:58:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 54F4C3C2274
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:58:17 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D8BF6600780
 for <ltp@lists.linux.it>; Wed, 23 Oct 2019 09:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571817495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OVR1RId+jV7fNLjHpkzznnuEZgk9DdwThTsh9fmq1Sw=;
 b=GfxbyqU0SiHp1ue5neu2pHdMgXUAsuCgDdviFTtCGXpi8qEXuN+L0sNU11r18UYXFtqSY6
 gX0aGBbAqaXgCWZ2SbtZ5UKuLiZV0DcI5X8TMBckRcnrzUGB/R+NYKj8aoM1tm8DzaRaH5
 bJcWPLm5kEZTEG9yt1SHJxW/aohw9F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-PB4IdjhZP6Gqwmu6tj00fw-1; Wed, 23 Oct 2019 03:58:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 970BB800D49;
 Wed, 23 Oct 2019 07:58:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFFC600CC;
 Wed, 23 Oct 2019 07:58:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F8834E589;
 Wed, 23 Oct 2019 07:58:12 +0000 (UTC)
Date: Wed, 23 Oct 2019 03:58:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1270016842.8517878.1571817492480.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
References: <20191022140757.29713-1-chrubis@suse.cz>
 <20191022140757.29713-2-chrubis@suse.cz>
 <CAEemH2eCpbAuU2xYNtiv9Wq4VwHJE2dZRXnO9v+2H=1=JQJUXQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.26]
Thread-Topic: Add support for test tags
Thread-Index: rAnnbTmKBEm5x1wU1NP5LLCT07JSZg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: PB4IdjhZP6Gqwmu6tj00fw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] lib: Add support for test tags
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
> Maybe we can merge this string compare in the same for loops?
> 
> e.g: http://pastebin.test.redhat.com/808028

Li, I don't think this is public server.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
