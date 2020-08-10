Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 193F5240358
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 10:24:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CFB823C3158
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Aug 2020 10:24:39 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 349793C076F
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 10:24:38 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 75AAB14012B0
 for <ltp@lists.linux.it>; Mon, 10 Aug 2020 10:24:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597047875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEzEIixs2lmbBelkdRlUjmozKYdRGlTSeoTF15ba9hM=;
 b=S0wB5Pv0oKR6LkgUwm7PV6Li8mZEyQNSfrGYswF8QIrHhB/hoOSet5M/SDsJFxkuOCo322
 FBWjHTQjSibO/UR9AbENeqDf12jr0+YbgvTn6IoYzlH02f8VFmjI2tUK2i3Z9W/BSaZSHp
 yJnUjIhxA3H7iOCkbnLqUL9FiyIyTOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-si-vT8_9NYuEWIz47aLK5A-1; Mon, 10 Aug 2020 04:24:33 -0400
X-MC-Unique: si-vT8_9NYuEWIz47aLK5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA42779EC1;
 Mon, 10 Aug 2020 08:24:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A322B89539;
 Mon, 10 Aug 2020 08:24:32 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9807F97553;
 Mon, 10 Aug 2020 08:24:32 +0000 (UTC)
Date: Mon, 10 Aug 2020 04:24:32 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <752669298.7180757.1597047872449.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200806162356.16920-1-mdoucha@suse.cz>
References: <20200806162356.16920-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.29]
Thread-Topic: Drop the mem01 test
Thread-Index: 2nBMmdtqOttGjmWBTd+IdcYN0uS0kg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Drop the mem01 test
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
Cc: Michal Hocko <mhocko@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> The mem01 test often fails on PPC systems mainly because it doesn't take into
> account page sizes larger than 4KB. Test scenario review revealed that it's
> not particularly useful because it doesn't have any more specific goal than
> filling large amount of memory and the hardcoded allocation limits are too
> low for modern and future systems. The useful part of this test mostly
> overlaps with coverage by existing OOM tests.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Jan Stancek <jstancek@redhat.com>

I'm fine with dropping it. Just curious, how is it failing? Do you see it
hit TFAIL, OOM or something else?


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
