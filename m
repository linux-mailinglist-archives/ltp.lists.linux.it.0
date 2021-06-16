Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DED473A93B6
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:24:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A51FB3C4CB8
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:24:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 46A313C2DD7
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:24:39 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BA3071401113
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623828277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pJYY6ZJC+O0OKtemLCplzTcWzx/8k5vLrZEo4jK6BGE=;
 b=IrlNyHc0YjV4hadRJ/ezkEsbDEN2IyRNV5S5KQ8POEIhAVJwu3TxYxdswLY5Lx2uKfSuFG
 v/s7/6NwqOjQPKCvXPVLvkqQp+th/k6xKTlX19tB4DgPN6UAnzdbKdrjdAonEWtGowU0Ix
 /TijK9NkRYTPTyk4bzp+x11qlQkl6b4=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-uws2eS4QM8CENaRjlr2RNg-1; Wed, 16 Jun 2021 03:24:36 -0400
X-MC-Unique: uws2eS4QM8CENaRjlr2RNg-1
Received: by mail-yb1-f199.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso1686970ybe.4
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 00:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pJYY6ZJC+O0OKtemLCplzTcWzx/8k5vLrZEo4jK6BGE=;
 b=K09tQYxtLS9aU08XckgZChbvn/BWTt82j7Knan0HTId0boYmKcTGcnqG+I1n8GKdwo
 5AJsJLqoIJM6KBD9Xu60SwWZNt4CrFlIJj2Ek5fuLpkZgzerFeVapq/xBsxwaSnE86qU
 RUTdqhqmlhEW4C19ZGRLXFuE8hvY26UGOKxUxdMAZSjqzxbI8jnzP6WeM3xHJ59WdGc3
 JTlrKFhAcDOtsuWSlcNhRmwnuhifG4OSrBwbPnOiXPwGuX+AqY2ybYAHMqM0HBG4odjq
 4Ig/7cR9sJ65W4m4XiEL+1NdszsgDC/LhzhW2b5NH/agn62dMivUNYxFWPuSpWVYlpB/
 d2ug==
X-Gm-Message-State: AOAM533PxidwGH6mkOmAnQdWxvBUfP3jt5Y1vHKl6D9G79dhT3quvXZW
 Q1UuUXVTeb9efZXPevcIXXtKQ5+c5mKfLGm0GGW2DS09/ffUNQVhhN+VFtP5kOGhc71BXj0qxc8
 vkFqjHp1bGY9LXd4630oH/96Utsk=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr4489024ybs.286.1623828275638; 
 Wed, 16 Jun 2021 00:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZX5W7InHYYSrPAIr4vsgxGm5cWilLFkfl9dlsX1OS64VkCibNc8hoPDn+CsfwITnb6/yMl+RpxzotOD1RsaA=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr4488996ybs.286.1623828275336; 
 Wed, 16 Jun 2021 00:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074045.23974-1-rpalethorpe@suse.com>
In-Reply-To: <20210615074045.23974-1-rpalethorpe@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 16 Jun 2021 15:24:23 +0800
Message-ID: <CAEemH2fgVnh4w9Vgezvu7-YmLXLJiKEkLyz5puTjgo=9=neidg@mail.gmail.com>
To: Richard Palethorpe <rpalethorpe@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Add Coccinelle helper scripts for reference
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richard,

> +for spatch_file in $*; do
> +    case $spatch_file in
> +       libltp-test-macro)
> +           libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro.cocci;;
> +       libltp-test-macro-vars)
> +           libltp_spatch --sp-file scripts/coccinelle/libltp-test-macro-vars.cocci \
> +                         --ignore lib/tst_test.c;;
> +       *)
> +           tests_spatch --sp-file scripts/coccinelle/$spatch_file.cocci;;

Why here use the coccinelle/ path and add suffix with the spatch_file?
Wouldn't this below more simple to us:

   scripts/coccinelle/$spatch_file.cocci  ==> $spatch_file

> +    esac
> +done




--
Regards,
Li Wang


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
