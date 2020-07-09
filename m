Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A15219A30
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 09:47:07 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25F793C2978
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jul 2020 09:47:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 052053C0196
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 09:47:05 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2A1546013A1
 for <ltp@lists.linux.it>; Thu,  9 Jul 2020 09:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594280822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZopQY8g54BWFLnOLifqVsWnabYgw2dC+vgTnZ2jrpOk=;
 b=YGlzXGhQ94J+i3Cdo9nnTcxq1QaaangOTykTgUEBDa1xv8B98e0ucaD6OqhmJuYVc6pMZ0
 0uT6L8V9Vh3ko88CLjrZRB8unywn19pX88Je9H7xxtGWfwm8TCYQMuBOMUoBurg3BqFoDS
 CWsmdwkdAMQB4bNJP8m1e/Z7DKjEhnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-gydgcz4WNDqPlmczOnPB5A-1; Thu, 09 Jul 2020 03:47:00 -0400
X-MC-Unique: gydgcz4WNDqPlmczOnPB5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11D88015F5;
 Thu,  9 Jul 2020 07:46:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA1C560E1C;
 Thu,  9 Jul 2020 07:46:59 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 935C393F75;
 Thu,  9 Jul 2020 07:46:58 +0000 (UTC)
Date: Thu, 9 Jul 2020 03:46:58 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <270712218.1348506.1594280818466.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200702141503.2556-1-mdoucha@suse.cz>
References: <20200702141503.2556-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.10]
Thread-Topic: Use fallocate() to create loop device backing file
Thread-Index: WL8f7XridHjBzkA/Y5r9F7Q/XWuyOw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Use fallocate() to create loop device backing file
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
> Creating large loop device backing files using tst_fill_file() on shared
> testing machines  may lead to performance issues and timeouts. Preallocating
> space using fallocate() is fast and sufficient.
> 
> Space allocation will fall back to tst_fill_file() if fallocate() fails for
> any
> other reason than lack of space.
> 
> Signed-off-by: Martin Doucha <mdoucha@suse.cz>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
