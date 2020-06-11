Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0071F666C
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:18:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 742A93C6139
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Jun 2020 13:18:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 2D06F3C0038
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:18:22 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 6131714016CE
 for <ltp@lists.linux.it>; Thu, 11 Jun 2020 13:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591874299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HbjUwI9JfDTGFCrkmmWxZu8Uzjk/fVQ1AJr4kfNqVVA=;
 b=Xzmf/HGo2gLAbxVyb77l5283LZvmxSM0U+EJElINDNHEmKj3NaqGA3rPxAaeNXUxxZ7KRR
 ufIGOjq1pjOPkYHp7J7Vjc3Y/NE8wQCjcZWHVZOx6jjexLXtx49obeUV8IwWaVZu814qw5
 TnaqypLqmZ7yh1rrh40nlhVQAm6WdnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-WaxrXt6MPGi6rwBfn0rHJQ-1; Thu, 11 Jun 2020 07:18:13 -0400
X-MC-Unique: WaxrXt6MPGi6rwBfn0rHJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BFAE1800D41;
 Thu, 11 Jun 2020 11:18:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6369610013D0;
 Thu, 11 Jun 2020 11:18:12 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D6A3B34B6;
 Thu, 11 Jun 2020 11:18:12 +0000 (UTC)
Date: Thu, 11 Jun 2020 07:18:12 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Kushal Chand <kushalchand@zilogic.com>
Message-ID: <433506763.15617153.1591874292012.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200609044641.3623-1-kushalchand@zilogic.com>
References: <20200609044641.3623-1-kushalchand@zilogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.25, 10.4.195.16]
Thread-Topic: Added test case to test mmap with MAP_FIXED_NOREPLACE flag
Thread-Index: 58Buu9tXRQ2ENGTbcpvN7OllZGsoUA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Added test case to test mmap with
 MAP_FIXED_NOREPLACE flag
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
Cc: ltp@lists.linux.it, "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> 
> This patch adds a new test case for the mmap syscall. It tests the
> MAP_FIXED_NOREPLACE flag of mmap. The code checks if MAP_FIXED_NOREPLACE
> returns with EEXIST when mapped with an already mapped address. It does
> so by allocating an available address by passing NULL to first argument
> of mmap and tries to mmap with MAP_FIXED_NOREPLACE flag at the same
> address returned by the first mmap call. This fails as expected. It also
> does the necessary changes required to run the syscall using the runltp
> command after building the LTP test suite.
> Git Hub Issue link - https://github.com/linux-test-project/ltp/issues/299
> 
> Signed-off-by: Kushal Chand <kushalchand@zilogic.com>
> Reviewed-by: Vijay Kumar B. <vijaykumar@zilogic.com>

Added include to lapi/mmap.h, slightly modified commit message and pushed.

Thanks,
Jan


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
