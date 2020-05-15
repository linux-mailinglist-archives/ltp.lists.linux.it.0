Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C941D4D91
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80B573C53AB
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 14:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id BDD813C20F6
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:19:02 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4F13514012CA
 for <ltp@lists.linux.it>; Fri, 15 May 2020 14:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589545140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lbek7oOTqccT0Qk7hkffRII29sORXxeungS+C4EL6vQ=;
 b=g5YiHSKhBR87IGc5dJpWDylO5wZczRiiJCRwZMX9hqvu8/Odm1QNc3jjLukD2rgyJn+eNX
 WcPT3A2mtofo97H4qPUEvYrX0nO61EC4ct/qhudICS6x2n7kCl5VcbBDDBkc8Qh8Aa2ZwE
 olOH0EyoKMi+wyZb7GhG0RXljoI0JC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-cO7MFv9cObWkAXOG_9PMlw-1; Fri, 15 May 2020 08:18:57 -0400
X-MC-Unique: cO7MFv9cObWkAXOG_9PMlw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22F7118FE860;
 Fri, 15 May 2020 12:18:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C19E5D9D7;
 Fri, 15 May 2020 12:18:55 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D5F118095FF;
 Fri, 15 May 2020 12:18:55 +0000 (UTC)
Date: Fri, 15 May 2020 08:18:54 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <914267680.12582166.1589545134812.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200515114837.GB3395@yuki.lan>
References: <20200515103910.8703-1-rpalethorpe@suse.com>
 <20200515114837.GB3395@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.20]
Thread-Topic: pty04: Avoid receiving packets from all interfaces
Thread-Index: OpVaiSRHSjCFOUvUEAouqnu9ndVK2w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04: Avoid receiving packets from all interfaces
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> Hi!
> Sounds reasonable, also hope it's the last patch. :-)
> 
> @Jan do you want to test this as well, or should I apply and proceed
> with the release?

I haven't spotted potential issue while looking at kernel code,
will test the patch just to be sure.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
