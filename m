Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 060F8219EED
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 13:12:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C50253C2976
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 13:12:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id E99CD3C02FA
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 13:12:41 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 837312013E0
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 13:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594293160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMOXQwLCtm9vn5jYD+QENFFWFDJAUROIlJse3N0egas=;
 b=f3mBIryo1PjTYd07jtSQtIJQhc7zyqHEvpGJFSRoTN0c4EkgrOgoAdIVCcyJxIuahvKB9S
 1qc3eVcBPy270hOyBvm6z1DDUrqsFUOhj3ragf2FlZwttJlmn8CL6z45YaemB1cQ9UYA+E
 8NoywOCFMsClACUsUck0JF8iWKG45nA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-br4Ox-6yOJuMWbXXy_4Q0Q-1; Thu, 09 Jul 2020 07:12:38 -0400
X-MC-Unique: br4Ox-6yOJuMWbXXy_4Q0Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB7718015F7;
 Thu,  9 Jul 2020 11:12:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A53BD5D9C9;
 Thu,  9 Jul 2020 11:12:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E58993F7D;
 Thu,  9 Jul 2020 11:12:37 +0000 (UTC)
Date: Thu, 9 Jul 2020 07:12:37 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>, Li Wang <liwang@redhat.com>
Message-ID: <214581717.1374815.1594293157595.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200709092238.GD2381@yuki.lan>
References: <4cb36d04b5ac4dd60f073d5a5c2f96faaa03cbd4.1594280924.git.jstancek@redhat.com>
 <20200709092238.GD2381@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.6]
Thread-Topic: runltp: let each test acquire/release device
Thread-Index: 8pRuj3YwAoelDW4OxQYs5oiBF1bfJw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runltp: let each test acquire/release device
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
> Shouldn't we remove the create_block() function as well?
> 
> Other than that, acked.

Pushed with create_block() removed as well.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
