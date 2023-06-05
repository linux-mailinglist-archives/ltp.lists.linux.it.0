Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E237721F2B
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jun 2023 09:12:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B17F83CB930
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jun 2023 09:12:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F2AF43CB700
 for <ltp@lists.linux.it>; Mon,  5 Jun 2023 09:12:40 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 610BE1A0070E
 for <ltp@lists.linux.it>; Mon,  5 Jun 2023 09:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685949158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KTKINMpPpikl0DvSq0T7z+cQh1YXUxPQ7kVmyweKse0=;
 b=aK7UOG49A1HmGld7bUWBUwcO2hqF8WKL9nF3h5MuVP/NQY6eQYFFxrLtzCtvfLVls5f0R5
 k9YNy31oI/6+1+HdN70JP4pHVRgCLJJRN3tA8LsEVHYVG/AjnqPspm7f6X6dJNdRc6B3wO
 6HOSNzNxP2FRJODqs02doFtpjydbac4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-e_r6LSl2PUSczU5LFcGjBg-1; Mon, 05 Jun 2023 03:12:37 -0400
X-MC-Unique: e_r6LSl2PUSczU5LFcGjBg-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b1b122976fso17304161fa.3
 for <ltp@lists.linux.it>; Mon, 05 Jun 2023 00:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685949155; x=1688541155;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KTKINMpPpikl0DvSq0T7z+cQh1YXUxPQ7kVmyweKse0=;
 b=AH9bcj6kCy4BM1jnF8iWScipEJ3sRPaQf+Al/Z8U7myCyhHxAkRLy7yn1GZmnoabDr
 L55rinpFndVsoNYdX3Ow1L2VtAfw3YFKimpctPH34wjnj1TIlS+MyjdAeJlSBHrH7Z3C
 p3hXowUahI0/a7DyvU8C8mtK6X5BLbtsDjWZJufpUVobb/Ql5kYJa/aY1IXjKQv64hhh
 xVKGvS1O8pOcRLPBzCshQLPh30l2O7eqwlAVf54DdM4c5FJS0m4IZkd5EhbAUpwddjCl
 vv0h+d/B2cr9bDpsy0cDx3LjLLgO3g/pui/wPns3NVp7fprlLvy5vjZFxOcmBuLgpPUU
 C/ww==
X-Gm-Message-State: AC+VfDyC6NK8K0E8BQ8UlvKsYsuF0DTeaR6iYdjaZAER7nCH8iWiSwYg
 5oTC5U2vuTIiEZQ7LB0MrktzNhMyxLWj8Kkhly7BQXBTlHWBrTB5WjgkhI15dMvUqdufLuKv/NJ
 n0BnzCmazH1HY2tnHIMtu9f68WW0=
X-Received: by 2002:a2e:8699:0:b0:2b1:c4f9:c342 with SMTP id
 l25-20020a2e8699000000b002b1c4f9c342mr1688924lji.33.1685949155807; 
 Mon, 05 Jun 2023 00:12:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4rE0r0TMqIPWB9DHb82j9HVy1oZ5HFXZd2DEA0vnfZcSO67CLU9tSRhrrqwA6xHaM4F7RVQcgNTZy9G/3MvTY=
X-Received: by 2002:a2e:8699:0:b0:2b1:c4f9:c342 with SMTP id
 l25-20020a2e8699000000b002b1c4f9c342mr1688918lji.33.1685949155456; Mon, 05
 Jun 2023 00:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <1685699631-4671-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1685699631-4671-2-git-send-email-xuyang2018.jy@fujitsu.com>
In-Reply-To: <1685699631-4671-2-git-send-email-xuyang2018.jy@fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Mon, 5 Jun 2023 15:12:23 +0800
Message-ID: <CAEemH2dPR8yFw7tY6G7jq2-bCO--gh0F_PARQPqX1O7EhrPtQg@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_IMAGE_ONLY_08,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS,T_REMOTE_IMAGE,T_SCC_BODY_TEXT_LINE
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH 2/2] syscalls/munlock02: Convert into new api
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

Reviewed-by: Li Wang <liwang@redhat.com>


-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
