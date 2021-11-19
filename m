Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FF5456F59
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 14:11:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A26D53C89B4
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 14:11:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 32BC43C7022
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 14:11:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6E7E6600669
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 14:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637327511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z/t4GRNlaUqlSsq07oNubb7fHlnJ6p2B0osWxK36qtk=;
 b=KTFYqmkhJowt/5zPKNGqUAECFYO4wOa7ReEG1l1IDYnCb5LSKQ7Ie4U1/NVxS1o7V9cdRV
 kK5tRqn+8sGl2YluDmXyZEn0SUftbSx0Qeu9iAYU6b/e7hsikcaA0a9uvZydL0THuotiaV
 VGS2MuHVkORxFG5S4i+RD/v8y6mC24U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-585-AJ4f2BX1PPaLdqYwx2gZmA-1; Fri, 19 Nov 2021 08:11:48 -0500
X-MC-Unique: AJ4f2BX1PPaLdqYwx2gZmA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FFAA84F209;
 Fri, 19 Nov 2021 13:11:47 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.192.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C472660BF1;
 Fri, 19 Nov 2021 13:11:45 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Cyril Hrubis <chrubis@suse.cz>
References: <YZearmiVEw9/eor9@yuki>
Date: Fri, 19 Nov 2021 14:11:43 +0100
In-Reply-To: <YZearmiVEw9/eor9@yuki> (Cyril Hrubis's message of "Fri, 19 Nov
 2021 13:38:06 +0100")
Message-ID: <877dd4cmsw.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] asm-generic/int-ll64.h wrongly used on x86_64?
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
Cc: linux-api@vger.kernel.org, libc-alpha@sourceware.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

* Cyril Hrubis:

> Hi!
> I was writing simple userspace code that prints the values from the
> struct statx the line in question looks like:
>
> 	printf("%" PRIu64 "\n", st.stx_size);
>
> This unexpectedly gives me warning on x86_64:
>
> warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type '__u64' {aka 'long long unsigned int'}

The correct format depends on whether you use struct statx from the
glibc headers or the Linux UAPI headers.  glibc uses uint64_t, Linux
uses __u64.  uint64_t in glibc prefers unsigned long if the type is
64-bit, Linux uses unsigned long long unconditionally.

One solution is to use %ju and cast to (uintmax_t).  Other cast-based
approaches are possible as well.

I'm not happy with the situation because those casts reduce type safety
and may suppress relevant compiler warnings.

Thanks,
Florian


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
