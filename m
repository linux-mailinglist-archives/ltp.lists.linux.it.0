Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991511AB8E
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 14:08:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDDA53C1CA2
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Dec 2019 14:08:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 295F63C18F7
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 14:08:19 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id B55AA100172F
 for <ltp@lists.linux.it>; Wed, 11 Dec 2019 14:08:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576069697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WhnWTWYA2Ru5gHMZKtaAk83G66F3NIn3W38q+ov52YU=;
 b=JINZ9vYgmaVEBKZfTVnFbFB+WkWB+B2Gvjae9Hrawb9A2O4/mMJou/+viW/05s3gRAh0cM
 LZaKB1AWIaBcJSI7xOvJnF33MO3tEMPEVdYTs4iZO/+nImTYCODwTIwgrSSKnd+dHzA3tk
 z5TUgUqAti+7BoC1Iwfo67PR0DXMpCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-BaulRXsvPrW1j8pXr5CO1Q-1; Wed, 11 Dec 2019 08:08:15 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDB281B18BC0;
 Wed, 11 Dec 2019 13:08:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4CFF6363C;
 Wed, 11 Dec 2019 13:08:13 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 80C318370B;
 Wed, 11 Dec 2019 13:08:13 +0000 (UTC)
Date: Wed, 11 Dec 2019 08:08:13 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <petr.vorel@gmail.com>
Message-ID: <1509318407.16168104.1576069693282.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191210201321.1430984-1-petr.vorel@gmail.com>
References: <20191210201321.1430984-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.14]
Thread-Topic: musl: travis build and include fixes
Thread-Index: GyFgKSLL/IE5T9hKROYQX7K4Dfnw8A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: BaulRXsvPrW1j8pXr5CO1Q-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] musl: travis build and include fixes
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
> Hi,
> 
> although LTP not yet fully support musl, I'd like
> to add travis build via Alpine linux distro.
> Remaining broken tests are deleted before building,
> I volunteer to solve musl problems for new code.

Fine by me, we can always disable it later if we run into (too many) issues.

> I also added 2 simple RPC fixes.

LGTM. As for RHEL, socketvar.h appears to be unused for decade at least.

Regards,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
