Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6185B976
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 12:52:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D8CA3C1D6D
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 12:52:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 44F733C1D0B
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 12:52:02 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 823731A006F6
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 12:52:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2E78B81F19
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:52:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 213F717DAB
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:52:00 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12059206D1;
 Mon,  1 Jul 2019 10:52:00 +0000 (UTC)
Date: Mon, 1 Jul 2019 06:51:56 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <548654065.31002613.1561978316851.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190701081917.32051-2-liwang@redhat.com>
References: <20190701081917.32051-1-liwang@redhat.com>
 <20190701081917.32051-2-liwang@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.11]
Thread-Topic: pkey: add test for memory protection keys
Thread-Index: akILxuvAKKiTC5LFWevUXVxiHebO3w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 01 Jul 2019 10:52:00 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/2] pkey: add test for memory protection keys
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
> Memory Protection Keys for Userspace (PKU aka PKEYs) is a Skylake-SP
> server feature that provides a mechanism for enforcing page-based
> protections, but without requiring modification of the page tables
> when an application changes protection domains. It works by dedicating
> 4 previously ignored bits in each page table entry to a "protection key",
> giving 16 possible keys.
> 
> Basic method for PKEYs test:
>   1. test allocates a pkey(e.g. PKEY_DISABLE_ACCESS) via pkey_alloc()
>   2. pkey_mprotect() apply this pkey to a piece of memory buffer
>   3. check if the access right of buffer has been changed and take effect
>   4. remove the access right(pkey) from this buffer via pkey_mprotect()
>   5. check if buffer area can be read or write after removing pkey
>   6. pkey_free() releases the pkey after using it
> 
> Looping around this basic test on diffenrent types of memory.
> 
> Signed-off-by: Li Wang <liwang@redhat.com>

for series:
Acked-by: Jan Stancek <jstancek@redhat.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
