Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA13C283774
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 16:16:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 67AD93C283E
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Oct 2020 16:16:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C0AFF3C2601
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 16:16:07 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 4C4EB1400762
 for <ltp@lists.linux.it>; Mon,  5 Oct 2020 16:16:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601907365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqhQq+PaeGVKa4wjBCj3+wLHKbukblmDF5dATtgtQs4=;
 b=Y0pS2056k1fTBq4J7o+3uG5fmYmKK01wtx62cpauCUViBHmAw7FXVdoHlxlrk0+mGBWYL9
 Vn/R7XbRP47VmqVXNnWP+IN0SkGGVP2LIUmj1uFPFGih4dkmjWSsRgVg5CJkp4xD2lg5jv
 s9IxPOVszfCIjqjrUokNvlhC8Tc/K/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-UTQwgSMHO4ePdV89KQBSCA-1; Mon, 05 Oct 2020 10:15:49 -0400
X-MC-Unique: UTQwgSMHO4ePdV89KQBSCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C14E318A8222;
 Mon,  5 Oct 2020 14:15:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8F685C1BD;
 Mon,  5 Oct 2020 14:15:47 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E0AA44A56;
 Mon,  5 Oct 2020 14:15:47 +0000 (UTC)
Date: Mon, 5 Oct 2020 10:15:46 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <135581472.16896262.1601907346856.JavaMail.zimbra@redhat.com>
In-Reply-To: <20201005133054.23587-5-chrubis@suse.cz>
References: <20201005133054.23587-1-chrubis@suse.cz>
 <20201005133054.23587-5-chrubis@suse.cz>
MIME-Version: 1.0
X-Originating-IP: [10.40.208.2, 10.4.195.29]
Thread-Topic: docparse: Add README
Thread-Index: LZXf9ZXJW2fgVoLMInXuSeQ+4L7kXg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jstancek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 04/11] docparse: Add README
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
Cc: Cyril Hrubis <metan@ucw.cz>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>



----- Original Message -----
> +Open Points
> +===========
> +
> +There are stil some loose ends. Mostly it's not well defined where to put
> +things and how to format them.
> +
> +* Some of the hardware requirements are already listed in the tst\_test.
> Should
> +  we put all of them there?
> +
> +* What would be the format for test documentation and how to store things
> such
> +  as test variants there?

I'm assuming you don't mean ".test_variants" here, but runtest entries
using same binary with different parameters. Currently we have a "tag"
that can refer to binary+parameters pair. Which is also useful, for
skipping tests - e.g. they run long, they are broken, or older kernel
is known to crash - we have a list of checks that modify runtest files
before actual run to avoid running into known issues (or save time).

> +
> +So far this proof of concept generates a metadata file. I guess that we need
> +actual consumers which will help to settle things down, I will try to look
> into
> +making use of this in the runltp-ng at least as a reference implementation.
> --
> 2.26.2
> 
> 
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
> 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
