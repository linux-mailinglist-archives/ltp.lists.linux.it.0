Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A010623A3DB
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 14:12:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24E093C6789
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Aug 2020 14:12:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 155EC3C1CB8
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:12:11 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 2F1CD600748
 for <ltp@lists.linux.it>; Mon,  3 Aug 2020 14:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596456729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVAROomF5VTrXeGviMtjXPJs0u7xjgwyumJtmd30IoE=;
 b=VbE11IPdOUXp5Fhai1LnO+TQnx5pEI1WQxO4JqYemOtlNc7KP9VwR65af7PKVNOzyTy9NY
 0hf+YsX1xTboAUWQsl6JzIcr/4kINL+ydthphus1oiZEFR6y2136b/X/mB7tOAO2rNDffG
 1vbplyy74umGWQt/8QzGj3wLlw4afAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-0NNTav6UNxe-lLXxpvzfXQ-1; Mon, 03 Aug 2020 08:12:02 -0400
X-MC-Unique: 0NNTav6UNxe-lLXxpvzfXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FC12101C8A9;
 Mon,  3 Aug 2020 12:12:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F35F219930;
 Mon,  3 Aug 2020 12:12:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE3069A109;
 Mon,  3 Aug 2020 12:12:00 +0000 (UTC)
Date: Mon, 3 Aug 2020 08:12:00 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Shwetha Subramanian <shwetha@zilogic.com>
Message-ID: <1756062468.5779238.1596456720574.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200803071312.4140-1-shwetha@zilogic.com>
References: <20200803071312.4140-1-shwetha@zilogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.4]
Thread-Topic: Add mincore() test for pages cached by another process
Thread-Index: EpbsqJywou+PXpLgq5JhJab4u/jMwA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] Add mincore() test for pages cached by another
 process
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
Cc: ltp@lists.linux.it, vijaykumar@zilogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


----- Original Message -----
> 
> It tests the result of mincore when memory is mapped and cached by
> another process. A file is mapped in both parent and child
> process.Then the mapped memory is accessed in the child process. The
> results of mincore are tested in the parent process.
> 
> References:#460
> 
> Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
> Reviewed-by:Vijay Kumar B. <vijaykumar@zilogic.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
