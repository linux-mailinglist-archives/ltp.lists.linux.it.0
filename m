Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18A14C7D8
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:11:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 101543C256E
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:11:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 9217A3C2387
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:11:26 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 8966C201203
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:11:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580289084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7GpWho/pSf2LlxqvoHJnHoCJVtZ51WIw3SZZCYpXLM=;
 b=g78xT8kjxqqZSUH5kPYPFeKe9sjUH/3NFWUB45KxXWbIZKXYZ9PJiCn9pnbTx/cUnNQpPF
 /6Un3molQcQYoK0AAzr0plDMmL8pYu+ulOVo71b77/6p2Ch8d2AAfXkNj2uYwm2qjFYfaZ
 pX3fWcVS2Zg7PKS8j5+mXnCJeoDKTj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-ZO0xdHmJM8mswh5Iygnd9g-1; Wed, 29 Jan 2020 04:11:20 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AFB38010C7;
 Wed, 29 Jan 2020 09:11:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82C84100032E;
 Wed, 29 Jan 2020 09:11:19 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A10D81965;
 Wed, 29 Jan 2020 09:11:19 +0000 (UTC)
Date: Wed, 29 Jan 2020 04:11:19 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1864416055.4725286.1580289079295.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200128213033.GA23147@dell5510>
References: <79fee43729701f3a3d46c6cbc26fa3f2402e182e.1579877705.git.jstancek@redhat.com>
 <20200128213033.GA23147@dell5510>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.15]
Thread-Topic: read_all: skip eeprom and nvmem
Thread-Index: GZQZhhmrDiCSShDtBJeTEbXThV038A==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: ZO0xdHmJM8mswh5Iygnd9g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: skip eeprom and nvmem
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
> Hi Jan,
> 
> > Big Power9 NV systems are failing to complete the test, as they
> > spend lot of time on /sys/devices/platform, trying to read dozens
> > of low level files like eeprom or nvmem. Each adds couple seconds,
> > eventually pushing test over timeout.
> 
> > User or system admin is unlikely to ever need to access these
> > entries, so skip them.
> LGTM.
> Acked-by: Petr Vorel <pvorel@suse.cz>

Thanks, pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
