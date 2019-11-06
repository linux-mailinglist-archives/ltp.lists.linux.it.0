Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B12F1A00
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 16:28:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4A7923C23F1
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Nov 2019 16:28:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DA2563C23BA
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 16:28:43 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 146721A017A8
 for <ltp@lists.linux.it>; Wed,  6 Nov 2019 16:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573054120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK9CyNSqjSgoq1o+rS/T0UsT0majA0zfAS6Q4XgLExM=;
 b=NyjCTlODJyN3gRk1FFQrGZbC+5A5xzmwMW46D07epwSayMahEYlKbmojKSMm0AezO+lD7u
 gH8eRWs5mQsrg61vJgrzhFNrQznIwZfyS2J5pxIZB/PvYyyXhJiR9QDoR5D1Ev6BNIvvlM
 MYZ88+ljanjugxINZpmPQ1GO8WKBZaQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-ZOt31wLZMn6w2geQCS2xrA-1; Wed, 06 Nov 2019 10:28:38 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11381800DFB;
 Wed,  6 Nov 2019 15:28:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D309F60BE0;
 Wed,  6 Nov 2019 15:28:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7A1F1819AC5;
 Wed,  6 Nov 2019 15:28:37 +0000 (UTC)
Date: Wed, 6 Nov 2019 10:28:37 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: rpalethorpe@suse.de, Cyril Hrubis <chrubis@suse.cz>
Message-ID: <2124877733.10763434.1573054117742.JavaMail.zimbra@redhat.com>
In-Reply-To: <87o8xpdw0l.fsf@rpws.prws.suse.cz>
References: <4647b3bced96c66c040078a32c13dab65558816d.1572956488.git.jstancek@redhat.com>
 <87o8xpdw0l.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.28]
Thread-Topic: read_all: move blacklist to source
Thread-Index: V9/i6mKWaSv2lscJ4HaDvEkuLv8csA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ZOt31wLZMn6w2geQCS2xrA-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] read_all: move blacklist to source
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
> > +static char *blacklist[] = {
> > +	NULL, /* reserved for -e parameter */
> > +	"/sys/power/wakeup_count",
> > +};
> 
> The problem with this is that it is only required if we are running as a
> privileged user. If -p is specified then it would be a bug if nobody can
> read from any of these files.
> 
> So I guess we could disable the builtin blacklist if drop_privs (switch
> to nobody) is specified

Good point. I just saw your reply that you plan to send a patch, thank you.

> and run this test twice on /sys with and without
> -p.
 
greg-kh wasn't very happy to hear about privileged runs in the other thread.
He was suggesting whitelist approach, but I don't know how we would keep it
up to date, deal with different configs, etc.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
