Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0318B360A7E
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:29:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C8EC43C7030
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Apr 2021 15:29:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6020C3C608A
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:29:06 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 9D0E71A01535
 for <ltp@lists.linux.it>; Thu, 15 Apr 2021 15:29:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618493344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8P9f0w9m8uixZm2Ro0hrWvvX24PhLjh/CKLoo7AUKE=;
 b=Ak7J5Ulfmk5AvmeRLslxVNU+kIK3CgHu6WVVcJDzekWnE1YZFQpc9THR4X+G/nKboU8Jot
 klz/aUeM0fJf4+eUv5n1V48IMBW9J4I+pVzy5lC8ly0hDJ/Gs4EH/40dtvMP9wNEzyUbX0
 /2J7doxK8SpuaMz0Rtyl2IJYoCO/iTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-GAu6guWqPweqRPm-oOC8BA-1; Thu, 15 Apr 2021 09:29:02 -0400
X-MC-Unique: GAu6guWqPweqRPm-oOC8BA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E2E6801814;
 Thu, 15 Apr 2021 13:29:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A33100E113;
 Thu, 15 Apr 2021 13:29:01 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id C63604EE0B;
 Thu, 15 Apr 2021 13:29:00 +0000 (UTC)
Date: Thu, 15 Apr 2021 09:29:00 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <1892386347.6487273.1618493340536.JavaMail.zimbra@redhat.com>
In-Reply-To: <YHgnOAF73wRFFrAi@yuki>
References: <f776dd1a02dc16efa8aa80bbe6f9b55186dc82cd.1618321799.git.jstancek@redhat.com>
 <YHgnOAF73wRFFrAi@yuki>
MIME-Version: 1.0
X-Originating-IP: [10.36.110.13, 10.4.195.5]
Thread-Topic: read_all: limit per cpu nodes to first ten cpus
Thread-Index: 0KfzkgctqFILrRxcSRTPwXFUPHS0vQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] read_all: limit per cpu nodes to first ten cpus
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
> Hi!
> Sounds reasonable to me as well.

Thanks for review, pushed.


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
