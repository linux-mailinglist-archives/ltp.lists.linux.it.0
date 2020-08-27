Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E709A254C7B
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 19:56:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 985F43C2E66
	for <lists+linux-ltp@lfdr.de>; Thu, 27 Aug 2020 19:56:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 7F5DF3C2218
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 19:55:59 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 0A99C1A001F4
 for <ltp@lists.linux.it>; Thu, 27 Aug 2020 19:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598550957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeR96qk1KdvkEtDzNEbylW9cOgvzR+/K670JLawYpgc=;
 b=BGGQ8lnRfnjDjpfb2DmfiKwpEYpV9J1eRSLJnOjuAP9Fk+umqHluWIN0NjefJsPj3qUwbu
 mQYrPvxa2dC0a8jhCDspUT8Xo7xmBfgk2/ZZrDBEeywUvJa7IlJGebY/Ymi5Zi18DK6tHK
 kEUcU6PI3hCf+Fhy0EhnJkzZcXtD6Ls=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-5kkvOTU9P_ymZG8Gx93fEA-1; Thu, 27 Aug 2020 13:55:55 -0400
X-MC-Unique: 5kkvOTU9P_ymZG8Gx93fEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DE21107B767;
 Thu, 27 Aug 2020 17:55:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 170CB7B9F4;
 Thu, 27 Aug 2020 17:55:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id D398118408A0;
 Thu, 27 Aug 2020 17:55:53 +0000 (UTC)
Date: Thu, 27 Aug 2020 13:55:53 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>, ltp@lists.linux.it
Message-ID: <368170331.10374593.1598550953564.JavaMail.zimbra@redhat.com>
In-Reply-To: <452994585.10362765.1598543893067.JavaMail.zimbra@redhat.com>
References: <20200826103913.27678-1-mdoucha@suse.cz>
 <10ca0dc0c59d782bcccd5aedc99dadb5c76fed91.1598530309.git.jstancek@redhat.com>
 <1175d50f-9b07-ec6e-4840-f5b61d677753@suse.cz>
 <452994585.10362765.1598543893067.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.26]
Thread-Topic: syscalls/setsockopt05: associate receiver with destination
 address
Thread-Index: lp7++Bri2W/OBQz0e129KzcAxtVkQwbZYfDm
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/setsockopt05: associate receiver with
 destination address
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

----- Original Message -----
> Hi,
> I assume that cycling through different source ports prevented the issue?

Yes, it did, it ran fine over night.

> 
> Reviewed-by: Martin Doucha <mdoucha@suse.cz>

Pushed.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
