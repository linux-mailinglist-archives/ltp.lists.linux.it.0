Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEAA14C7E9
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:17:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1F1383C243F
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 10:17:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3A4353C23E0
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:16:59 +0100 (CET)
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id BA2DC600C08
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 10:16:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580289417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJZXqflZgSthjQII32f5gCCp9MNiRpmpkoxHgeUq/Nc=;
 b=ZU8LvlwQg3xy3ELwseBOJVIW2rvStGZeC3LwjEmoISUDO3Tt3D5Rswn3EXihdraPAgZGdf
 Mz4nn3iE6pmrEXGplhf3RGcMd8H3SS2vyph5Pn76T2nOiWQbnw0gb2GyH840PQHG8whpDm
 l9KfXO6FszRuNmmr9g20eNqjcVLLdZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-eosa41h6PxSV5cBRYUAckw-1; Wed, 29 Jan 2020 04:16:53 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06E791800D41;
 Wed, 29 Jan 2020 09:16:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1EA27D933;
 Wed, 29 Jan 2020 09:16:51 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id E3CD387A60;
 Wed, 29 Jan 2020 09:16:51 +0000 (UTC)
Date: Wed, 29 Jan 2020 04:16:51 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Message-ID: <1680515224.4725561.1580289411736.JavaMail.zimbra@redhat.com>
In-Reply-To: <CA+G9fYsnSGw0NmV5hWwZSs5OYu18YRam3jYCsg4Sn+KUQJSMWw@mail.gmail.com>
References: <20200128135749.822297911@linuxfoundation.org>
 <CA+G9fYsnSGw0NmV5hWwZSs5OYu18YRam3jYCsg4Sn+KUQJSMWw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.2]
Thread-Topic: 4.14.169-stable review
Thread-Index: w69/1TES9KK/jDMiHJfMxvvw2GMtcQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: eosa41h6PxSV5cBRYUAckw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4.14 00/46] 4.14.169-stable review
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
> NOTE:
> LTP fs test read_all_proc fails intermittently on 4.9 and 4.14 branches.

[trim CC list to LTP]

Naresh, do you have some examples of these failures?
Has it started recently or do you see it long-term?
Is test timing out on some specific /proc entries?
If yes, is it possible to run test with strace or with "-v" so we can
see where it's getting stuck?

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
