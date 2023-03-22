Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C60416C401A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 03:04:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 80B7A3CE3B4
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Mar 2023 03:04:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 94ED83C1CEC
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 03:03:57 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id ABEDF60097F
 for <ltp@lists.linux.it>; Wed, 22 Mar 2023 03:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679450634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VYoWIaIWAYpj7p5KxFRCIWLxykUtP9m1RexPzPdkxq8=;
 b=DzKraj1j1rDtvqioms/bFF2y/5ak5k7nWp9aEtk+zSYG0uq5OsOQi7bce2WOXiyCMSnBrx
 MmI53wwraEIzkyKhqORpP+V0pG+gyQeuB4a+jnto4gb8pwKI3pml6j5yVWaScEOvbjhwgI
 e4gpF214QbK3Rvde7bcU6wsC510cYU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-uNKZMK2xPWWGpIYWKML53w-1; Tue, 21 Mar 2023 22:03:53 -0400
X-MC-Unique: uNKZMK2xPWWGpIYWKML53w-1
Received: by mail-wm1-f71.google.com with SMTP id
 e5-20020a05600c4e4500b003edc5824521so5405381wmq.0
 for <ltp@lists.linux.it>; Tue, 21 Mar 2023 19:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679450632;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYoWIaIWAYpj7p5KxFRCIWLxykUtP9m1RexPzPdkxq8=;
 b=UOkx/97Jh+N0Sx8kJEgSIPT7BQreYLc9rbl9fXJ2hXon1Dy/iz4NNvY5LQip+xS31h
 StUg5q1WRuv80ygtfKI0bUUtv94y42mjCdHSwQ6kEZUIjgIycGXYYFrKeJsq+oSG6Amg
 gzvTV8w5th3nzMA0s8OnqM7w9BxTqmLfslfBegZgB3kyfn7EAuQJ7HdywT+B9+qiL8JP
 acNNrN3+INCUfO7vu3BTU3ktjnagubra/J4FbAktHvEutXt5MxKGVXjV4zrKbiOPeLnp
 1beF0Dg71KM5yYWPi+KCdx8kMAHnfahRmnJ4xShqxrN4kKRZspq8tr0eCEhTZfbZNkZU
 X7Ag==
X-Gm-Message-State: AO0yUKU0bN/EOeKi7gvWBikujPqq/ZZZ4t6O3MIimV3czSO4R5JmCs0l
 7VQFP3avN9pvGa86ZdfnEKV5OIYV1r3m0JODEkKHE+YNQTZfU7HgGaX+1sV04ZdF4jyV4dR5G3y
 15U0hZ26fC2Ym+/h2r9jSlex0JLA=
X-Received: by 2002:a7b:c5d1:0:b0:3ee:10fb:56f8 with SMTP id
 n17-20020a7bc5d1000000b003ee10fb56f8mr1184081wmk.8.1679450632061; 
 Tue, 21 Mar 2023 19:03:52 -0700 (PDT)
X-Google-Smtp-Source: AK7set9iPs4xuH2Q2CVkzJs0uJjRyenAQArr1RqQejizUZdEMc1/VRNQbDdmKzD7Dt4WZBYBIckcGOe6pWYA6nAl0go=
X-Received: by 2002:a7b:c5d1:0:b0:3ee:10fb:56f8 with SMTP id
 n17-20020a7bc5d1000000b003ee10fb56f8mr1184076wmk.8.1679450631836; Tue, 21 Mar
 2023 19:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230321230706.2927611-1-edliaw@google.com>
In-Reply-To: <20230321230706.2927611-1-edliaw@google.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 22 Mar 2023 10:03:40 +0800
Message-ID: <CAEemH2diSOs00qSNg7JBiVxi8VyqmDYc-QKG=DP_i8JLHtgwcA@mail.gmail.com>
To: Edward Liaw <edliaw@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v1] hugemmap: use 64-bit types
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Patch applied, thanks!

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
