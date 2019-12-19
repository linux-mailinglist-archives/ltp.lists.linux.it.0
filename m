Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DD01263CB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:43:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62F623C23B5
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 14:43:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id BE9403C2382
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:43:11 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id B0DF0600207
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 14:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576762989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t5ceRSSTnKM+cRv9CWX7OMeubgKu6cOpJW4fUxmB7bQ=;
 b=KRK7yJ/Tf0Jlr9YTgqkL+XfRXmbsCE5jjHNwUcatNcnfI3tUebKkaeXl9zdYLOl2Cu1IPX
 3j3r+CfSFEe4jLsZX4OIP3xvL4QCKeFuGqmnJycRKVGvGCB5kVzppoxeSGKYG9TMmR8YoU
 nUZ4rchF1ke6ObEudkBXEP55cO4bFME=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-G9YC2D8KOZunx5-wUObPzw-1; Thu, 19 Dec 2019 08:43:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D99107ACCC;
 Thu, 19 Dec 2019 13:43:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29DE468897;
 Thu, 19 Dec 2019 13:43:03 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C092F1809567;
 Thu, 19 Dec 2019 13:43:03 +0000 (UTC)
Date: Thu, 19 Dec 2019 08:43:03 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <391203935.17412269.1576762983583.JavaMail.zimbra@redhat.com>
In-Reply-To: <20191219095050.26106-1-pvorel@suse.cz>
References: <20191219095050.26106-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.21]
Thread-Topic: tst_test.sh: Add return value to _tst_expect_{fail, pass}
Thread-Index: AfTK4c95a5N35mIoTXzsHUmD+XfRAQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: G9YC2D8KOZunx5-wUObPzw-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] tst_test.sh: Add return value to
 _tst_expect_{fail, pass}
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
> +It's possible to detect whether expected value happened:
> +[source,sh]
> +-------------------------------------------------------------------------------
> +if ! EXPECT_PASS command arg1 2\> /dev/null; then
> +	continue
> +fi
> +-------------------------------------------------------------------------------
> +

Looks useful, ack.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
