Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6026F1FF112
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 13:56:36 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 28F553C2C8A
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 13:56:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C99C13C2965
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 13:56:34 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 934DE6007BB
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 13:55:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592481392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M10RyBRE2j+M3MvRDsKqGNq+ZoNPk/m5SfIaP5m44jo=;
 b=Y+nFd8aJ8NRq8zUEJhwqcKB7i1I7+6LXfk5mKBJCYwZlk/fXQDLk7dpQf1yT8WeQzXL4NQ
 6rjS9SVr2gEdqVHX35MzBQXCwIB/XCoATMvuV8meXqt27+mQtg5keHia84Vn2fGNsmbuts
 N5D0Q6hYQCY8VqExj7y2KiD6/MRY4ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-AMIp_JHPNduxUcoiyXHzfA-1; Thu, 18 Jun 2020 07:56:28 -0400
X-MC-Unique: AMIp_JHPNduxUcoiyXHzfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B8E10059A5;
 Thu, 18 Jun 2020 11:56:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 407155C1D6;
 Thu, 18 Jun 2020 11:56:27 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A2281809542;
 Thu, 18 Jun 2020 11:56:27 +0000 (UTC)
Date: Thu, 18 Jun 2020 07:56:26 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Pravin Raghul <pravinraghul@zilogic.com>
Message-ID: <1352595416.16558643.1592481386848.JavaMail.zimbra@redhat.com>
In-Reply-To: <c6792053-287d-7a53-477d-5f5ad95ffa6f@zilogic.com>
References: <c6792053-287d-7a53-477d-5f5ad95ffa6f@zilogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.4]
Thread-Topic: Testcase approach for MAP_GROWSDOWN
Thread-Index: tk5od9dRXr0IyflETFmVUkSJKGV8QA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] Testcase approach for MAP_GROWSDOWN
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
> 
> 
> We are planning to add the following testcases for MAP_GROWSDOWN, please let
> us know your thoughts on this.

Sounds similar to test for CVE-2017-1000364 ./testcases/cve/stack_clash.c
Can you have a look if it covers at least test case 2 below?

> 
> We assign the memory region allocated using MAP_GROWSDOWN to a thread, as a
> stack, to test the effect of MAP_GROWSDOWN. This is because the kernel only
> grows the memory region when the stack pointer, is within guard page, when
> the guard page is touched. Test Case 1: Grow into an unmapped region
> 
> 
>     1. Map an anyonymous memory region of size X, and unmap it.
>     2. Split the unmapped memory region into two.
>     3. The lower memory region is left unmapped.
>     4. The higher memory region is mapped for use as stack, using MAP_FIXED |
>     MAP_GROWSDOWN.
>     5. The higher memory region is provided as stack to a thread, where a
>     recursive function is invoked.
>     6. The stack grows beyond the allocated region, into the lower memory
>     area.
>     7. If this results in the memory region being extended, into the unmapped
>     region, the test is considered to have passed.
> Test Case 2: Grow into a mapped region
> 
> 
>     1. Map an anonymous memory area.
>     2. Split the memory area into two by mapping them into two areas.
>     3. The lower memory area is mapped using MAP_FIXED.
>     4. The higher memory area is mapped for use as stack, using MAP_FIXED |
>     MAP_GROWSDOWN.
>     5. The higher memory area is provided as stack to a thread, where a
>     recursive function is invoked.
>     6. The stack grows beyond the allocated area, into the lower memory area.
>     7. If this results in a segmentation fault, the test is considered to
>     have passed.
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
