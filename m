Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D41D4821
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 10:30:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6121D3C53B6
	for <lists+linux-ltp@lfdr.de>; Fri, 15 May 2020 10:30:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id F33F83C2412
 for <ltp@lists.linux.it>; Fri, 15 May 2020 10:30:15 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 340221A01954
 for <ltp@lists.linux.it>; Fri, 15 May 2020 10:30:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589531413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsXui9FuqwYZT3m0EsB6INpDvh+IztTg4OV97t0g9J4=;
 b=VOPxM//repLqEZYtzCYcDSrIpgIvA+9JW79gJVpIPxnDgIMzWssCDhqtIUPFtPqHqEQsW1
 besXtr4R0JRw7rEVJac9TkMg8W4TGBxfxdK5neRvhvi7CDvhJaUOWqe8xARUrkW1KYTo4K
 Ak7CU0dvEK34qB/24kzyP7UNWWzx3j4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-kvH4xu73N0CwNbUK7GFf-Q-1; Fri, 15 May 2020 04:30:12 -0400
X-MC-Unique: kvH4xu73N0CwNbUK7GFf-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC1A918CAD8E;
 Fri, 15 May 2020 08:29:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B52A960C47;
 Fri, 15 May 2020 08:29:43 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7DF8318095FF;
 Fri, 15 May 2020 08:29:43 +0000 (UTC)
Date: Fri, 15 May 2020 04:29:43 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <1321342340.12558723.1589531383298.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200515070022.16407-1-pvorel@suse.cz>
References: <20200515070022.16407-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.21]
Thread-Topic: INSTALL: Update requirements, modernise text
Thread-Index: IEaol6fqTN+6y/UJQ2XHZoi5ZDbKiA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/4] INSTALL: Update requirements,
 modernise text
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
> +# yum install gcc git make pkgconf autoconf automake bison flex m4
> kernel-headers glibc-headers

Do we want to list also optional packages here?
libaio-devel libcap-devel numactl-devel openssl-devel and others?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
