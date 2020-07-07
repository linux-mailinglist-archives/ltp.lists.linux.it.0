Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F4091216CED
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 14:37:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A94D23C29E2
	for <lists+linux-ltp@lfdr.de>; Tue,  7 Jul 2020 14:37:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 194713C29B5
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 14:37:14 +0200 (CEST)
Received: from us-smtp-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 62FDA201165
 for <ltp@lists.linux.it>; Tue,  7 Jul 2020 14:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594125431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzCIoA3tbzinjRE4Y4tj+X9aDSduiZiGIxBj2a+cKcI=;
 b=amhcl16YegpbplnaRxYb2geuaLzRokBK1XDNQLhVxCtrTqDbxVOJZbYq3xVAEhT9sg2rkh
 1lrTaCL+5Yogk0LYljdQW5WSckHBPA/WZxsmt5IXeLJlgODaFDHzea8HjGkMvDTSWNqcja
 BBSExH3QKLj9A4lMMivO+zuJ5hBpcFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-9B0di0UGNnO8yoUUfVUDbQ-1; Tue, 07 Jul 2020 08:37:08 -0400
X-MC-Unique: 9B0di0UGNnO8yoUUfVUDbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20EDDA4412;
 Tue,  7 Jul 2020 12:37:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F3860C87;
 Tue,  7 Jul 2020 12:37:03 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F2231809542;
 Tue,  7 Jul 2020 12:37:03 +0000 (UTC)
Date: Tue, 7 Jul 2020 08:37:03 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Shwetha Subramanian <shwetha@zilogic.com>
Message-ID: <1535756409.1079792.1594125423402.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200706050828.5134-1-shwetha@zilogic.com>
References: <20200706050828.5134-1-shwetha@zilogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.12, 10.4.195.30]
Thread-Topic: Add mincore() test for anonymous mappings
Thread-Index: +Y4t1eHXOSk39jAS2oL/qY79hvKqvA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add mincore() test for anonymous mappings
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
> Changes from v1:
> 	1.Changed testcase description.
> 	2.Checked ptr before executing SAFE_MUNMAP() in cleanup().
> 	3.Added a setup() fuction.
> 	4.Fixed formatting issues.
> 	5.Changed TPASS and TFAIL messages.
> 	6.Changed syntax for conditional statements.
> 
> References: #461
> 
> Signed-off-by: Shwetha Subramanian. <shwetha@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>

Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
