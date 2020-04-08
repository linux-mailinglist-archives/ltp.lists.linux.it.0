Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE8E1A1EA4
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 12:19:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DCB93C2D1D
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 12:19:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 521653C0639
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 12:19:09 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 57A211000D09
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 12:19:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586341147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p65OnIij0fIjcfY/BKrogaXR3o1xWqL+A89yytAAwkI=;
 b=XlmrwA30QfC4xsIBkMkjBDLMEnKtPveGRYDOn6FfkIJ+ONlesaVP4xiCyhyC63xiFatwEh
 emZahXKCNzxB6ulr25hL8e8Mf3WDDqDOahc94MdjKuZgBWbti0JsyzRHcf35QaufEETndp
 MQbVf9g0vMOUzk87r9prxKoTt2U1rGw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-DUAAX_8jPPK9k8dfNJiQng-1; Wed, 08 Apr 2020 06:19:05 -0400
X-MC-Unique: DUAAX_8jPPK9k8dfNJiQng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABFC9800D5C;
 Wed,  8 Apr 2020 10:19:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 797EAC0D85;
 Wed,  8 Apr 2020 10:19:04 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4225818095FF;
 Wed,  8 Apr 2020 10:19:04 +0000 (UTC)
Date: Wed, 8 Apr 2020 06:19:04 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>, 
 Richard Palethorpe <rpalethorpe@suse.com>, 
 Li Wang <liwan@redhat.com>, Rachel Sibley <rasibley@redhat.com>
Message-ID: <1200091233.7615565.1586341144193.JavaMail.zimbra@redhat.com>
In-Reply-To: <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
References: <20200408090635.4686-1-rpalethorpe@suse.com>
 <d950a46d-b65a-ac33-e71b-f93a2dce7620@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.5]
Thread-Topic: add_key05: Avoid race with key garbage collection
Thread-Index: mUSzOifDkjOuloJyJwii6+8oWgrQ+A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] add_key05: Avoid race with key garbage
 collection
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
> Hi Richard
> 
> > The key subsystem independently tracks user info against UID. If a user is
> > deleted and the UID reused for a new user then the key subsystem will
> > mistake
> > the new user for the old one.

Thanks for raising this problem Richard. This matches CKI failure
we seen recently. (CC Li and Rachel)

> Does any documentation or kernel comment mentioned this? I didn't notice
> this before.
> > 
> > The keys/keyrings may not be accessible to the new user, but if they are
> > not
> > yet garbage collected (which happens asynchronously) then the new user may
> > be
> > exceeding its quota limits.
> > 
> > This results in a race condition where this test can fail because the old
> > thread keyring is taking up the full quota. We should be able to avoid this
> > by
> > creating two users in parallel instead of sequentially so that they have
> > different UIDs.
> I guess you may want to creat two user, so next, the key subsystem
> think the new user is different from  the last deleting user. It can
> avoid race.
> 
> But you patch overrides ltpuser, in actually, we still use
> ltp_add_key05_1 in SAFE_SETUID.
> 
> Also, this patch doesn't handle delete user when we using -i parameters.

-i might be problem, but other than that I think it works, at least for default run.

Though I'm wondering, shouldn't the test delete keys it creates,
rather than relying on garbage collection?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
