Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F467AB7B88
	for <lists+linux-ltp@lfdr.de>; Thu, 15 May 2025 04:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1747275720; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=7Tu1ZTxEMLqggKGRw+QrnJDnOTp+IOIIrsAzL+e1Uxg=;
 b=FRl7x4kK0FUhHwn4mGycqnhRFZF6LVao+46i8IJdzFB3UdVck3LAOZvXGAK+WKJWegIx7
 r1iubDjEwbpkLhL1Z1wSzjrAPlw7Cg8CsyLRFR7MUAIKlKwFYuEJmyr6fxfRnoMS3VYGPTV
 g6kO+nklt2kQy/m8yThndk5N5JhmmA0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D23F13CC3EB
	for <lists+linux-ltp@lfdr.de>; Thu, 15 May 2025 04:22:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 346FA3C96C9
 for <ltp@lists.linux.it>; Thu, 15 May 2025 04:21:47 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2052360070E
 for <ltp@lists.linux.it>; Thu, 15 May 2025 04:21:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747275705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=FMEj2xDk19Mz/Ha7V5G54L5KuLgWVd7qD0wKQwhbA06RDWE4BeGcob4wa9gqFrPgRGUyln
 1xWTdH8qcMkxUwuqX1EIKM3RIS3i4xy8ZUkKvM57Wpr2XkOV4Y0o9Fi2MfWhh/RGSS16Kx
 kV/CPDAmN4Fi/wLUzipstWI4oyPDCUU=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-0ARH9nIPNhOzLLdnDJk_eQ-1; Wed, 14 May 2025 22:21:43 -0400
X-MC-Unique: 0ARH9nIPNhOzLLdnDJk_eQ-1
X-Mimecast-MFC-AGG-ID: 0ARH9nIPNhOzLLdnDJk_eQ_1747275703
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-22e7f041997so7407785ad.3
 for <ltp@lists.linux.it>; Wed, 14 May 2025 19:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747275703; x=1747880503;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iRgRMZQmTwKufpT2a+k58zoz2At60jBudm7LrNl4d/Q=;
 b=C/64ZkFQBkMqtAy/KUigivaWCNBQI8xuYQPW4raPeRzZ9N1NTo+c8VbyJTvgLngfzx
 3K3dD2XN3TjQUuutqA3kOfZt0hhTrK5ScQeA5/Pd6r72QrZK3WXMqksqy9Kmjr2CaZ2P
 YkJt+7sebKkpRjT4sedk62D4EP/SeJA6N6GWHFFv8UGGokU5NNB6B3W7Qm8w92JJPmjL
 d5vJWbe6VdcYEt7FK8lI3f8oaLYLX2gO9GidswBzbx9c2tJbbPVIs0maH6KVH/L/gLRo
 U9+gmH4NedI7+kL1m9DdOHCVn0HDnP+huhoQaZtyFjxPCHFXJLmsixtPueVnnLiwg6Wt
 Fc/A==
X-Gm-Message-State: AOJu0Yy56r7kXQZ7BzZ/4mfuihsKMmWvyudDhEC5yrAYi7OK1QXqucj7
 23uUoEiNDrmZqDSTkd3AwbXWB2kQQrwp57hQsTfLxyu7LPHPwtYJ0crVmgaa5MDmyiIwsTuofOP
 5N2WpXL9uNBsBrwrZpi8+2XpsYSfRUoa32jcdv3M5tLuhMg/Z8bBeLVId9/KI2Rlgxbxi2bNaHc
 XsR1+aBOLqZaNgErCG9j6qN0k=
X-Gm-Gg: ASbGnctjy4gzhz/g1vSvkhzsBfZoxAW26yBPPZH2ISLr47/tKZ5PeIbmW4xa0ASdih1
 4OBkHgVHzhx2fvl5by7aYXERAbiNMQJUnRyqANM98XSZddEsBsY/fKS9cPz4s6OeWh/RDRg==
X-Received: by 2002:a17:903:3ad0:b0:22e:b215:1b6 with SMTP id
 d9443c01a7336-231980ef20emr81041585ad.28.1747275702837; 
 Wed, 14 May 2025 19:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvDXwEhXLodzD2OZlDNSIFSr4v02tyF6kX7oCtdj7Ux+QnAEZ/72+87PeNQ4ojiEgw62qAy+2mBmi4bR1nBUQ=
X-Received: by 2002:a17:903:3ad0:b0:22e:b215:1b6 with SMTP id
 d9443c01a7336-231980ef20emr81041425ad.28.1747275702527; Wed, 14 May 2025
 19:21:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-conversions-kill-v1-0-cd633e941e8b@suse.com>
 <20250514-conversions-kill-v1-4-cd633e941e8b@suse.com>
In-Reply-To: <20250514-conversions-kill-v1-4-cd633e941e8b@suse.com>
Date: Thu, 15 May 2025 10:21:30 +0800
X-Gm-Features: AX0GCFtveRVVQp3WXuf5Q5IHFIGkOyBhk1OC0mEtVJI5eVH-i7Cq54ek9ZHrxeo
Message-ID: <CAEemH2cQpScD2F-9HhL-Hx3-kvw+ox6pJ8DdtcVcHWe0jDf-yw@mail.gmail.com>
To: =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b8fG3zfWkN6GmB-L8oWTBISzgP41nhpHauNhlm4Ot4I_1747275703
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 4/6] syscalls/kill11: Fix test description metadata
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Reviewed-by: Li Wang <liwang@redhat.com>

--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
