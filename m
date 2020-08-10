Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D22BA24034D
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 10:18:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5936E3C3158
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 10:18:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7E3D93C076F
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 10:17:59 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0DECF601085
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 10:17:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597047477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w8emTEmSz2sp1ltGgBEVZgvKZZAxDbLqAr4haOBwt5E=;
 b=LzK9S2wfFPDPHWtJ1oHiloSuKVGtpYSU0xUAS0QIGmh6/nYKyMAHxsCtTKwVPWcoBmKKD3
 x7mGXit+EHtdKXR2/dTwRO5u5NM4YKf2e79Q0cKZN23seVAaplpj5sPUZEpoOwuRX0YhQY
 vVVtq/B47QrFqUdP2m1PjC/w8+sBkYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-UDpUXxppOfiQ-puTOaMgag-1; Mon, 10 Aug 2020 04:17:55 -0400
X-MC-Unique: UDpUXxppOfiQ-puTOaMgag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AF0919057A1;
 Mon, 10 Aug 2020 08:17:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63CF95D9D7;
 Mon, 10 Aug 2020 08:17:54 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 001AD97553;
 Mon, 10 Aug 2020 08:17:53 +0000 (UTC)
Date: Mon, 10 Aug 2020 04:17:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <754283726.7180369.1597047473774.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200806142334.30494-1-mdoucha@suse.cz>
References: <20200806142334.30494-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.6]
Thread-Topic: Add test for CVE-2019-8912
Thread-Index: coffM683U4+YJNHVBc2YMaN7wFe/sg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Add test for CVE-2019-8912
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
> Fixes #504
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  runtest/crypto                     |   1 +
>  runtest/cve                        |   1 +
>  testcases/kernel/crypto/.gitignore |   1 +
>  testcases/kernel/crypto/Makefile   |   4 +-
>  testcases/kernel/crypto/af_alg07.c | 117 +++++++++++++++++++++++++++++
>  5 files changed, 122 insertions(+), 2 deletions(-)
>  create mode 100644 testcases/kernel/crypto/af_alg07.c

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
