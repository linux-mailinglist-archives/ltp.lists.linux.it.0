Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E16E2FCD7B
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:33:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 630273C5DBD
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Jan 2021 10:33:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id D8D3B3C24E4
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:33:06 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id E33FB600C00
 for <ltp@lists.linux.it>; Wed, 20 Jan 2021 10:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611135184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0OTTmMHlgUGBgQ5hWT9m11ZPUaSy1SPGTIpsa6coN/g=;
 b=YLaagyiuZYVHNZCNPdgKKGr8N+mVo8u8RIdBVl6aX6JclIv1FAibgi6XJGB0KbjOeZMZrs
 s45Jbzh7cpwZrjwvs6Q05hj3SzGBOdC5MHEuSv3N5tMlO85t9nc53TcqSC197v06Xa4ObE
 RATB+8RlkSCC6Lzb+ydyz756cEBxBfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-dh6wxL_dO1mjHQsKU39dbw-1; Wed, 20 Jan 2021 04:33:00 -0500
X-MC-Unique: dh6wxL_dO1mjHQsKU39dbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D31B0E744;
 Wed, 20 Jan 2021 09:32:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA79B5D9DD;
 Wed, 20 Jan 2021 09:32:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72DBF18095C9;
 Wed, 20 Jan 2021 09:32:59 +0000 (UTC)
Date: Wed, 20 Jan 2021 04:32:59 -0500 (EST)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <1542162728.33692863.1611135179166.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2dj2KGi6dmYoJaxsvvG1wvecbM8GrpBshHh8CTkm7pe+A@mail.gmail.com>
References: <2e51e5453562001b5b6992ccc897d9177e6673ca.1571053661.git.jstancek@redhat.com>
 <CAEemH2dj2KGi6dmYoJaxsvvG1wvecbM8GrpBshHh8CTkm7pe+A@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.76, 10.4.195.19]
Thread-Topic: mlock_8-1, munlock_10-1: don't use LONG_MAX as invalid pointer
Thread-Index: b8XR4S0OO16R9IjSmlPXt98DENLq4Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] mlock_8-1,
 munlock_10-1: don't use LONG_MAX as invalid pointer
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
> Hi Jan,
> 
> I propose to reorg this patch with review comments (maybe apply it after
> the new release).
> 
> Any thought?

This has been fixed in kernel by:
  597399d0cb91 ("arm64: tags: Preserve tags for addresses translated via TTBR1")
  d0022c0ef29b ("arm64: memory: Add missing brackets to untagged_addr() macro")

I'd keep the test as is, maybe add comment with above commits as a hint for future.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
